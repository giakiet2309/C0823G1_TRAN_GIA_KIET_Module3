package controller;

import model.Book;
import service.BookService;
import service.IBookService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthOptionPaneUI;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookServlet", value = "/book-servlet")
public class BookServlet extends HttpServlet {
    private final IBookService bookService = new BookService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showAddForm(req, resp);
                break;
            case "edit":
                showEditForm(req, resp);
                break;
            case "searchName":
                searchName(req, resp);
                break;
            case "delete" :
                remove(req,resp);
                break;
            default:
                showAll(req, resp);
        }
    }

    private void remove(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int index = getIndex(id);
        bookService.remove(index);
        resp.sendRedirect("/book-servlet");

    }


    private void searchName(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        List<Book> book = bookService.findByName(title);
        if(book.size()!=0){
            req.setAttribute("book",book);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/search_product_by_name.jsp");
            requestDispatcher.forward(req,resp);
        } else {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/not_found.jsp");
            requestDispatcher.forward(req,resp);
        }
    }

    private int getIndex(int id) {
        int index = -1;
        for (int i = 0; i < bookService.getAll().size(); i++) {
            if (bookService.getAll().get(i).getId() == id) {
                index = i;
                break;
            }
        }
        return index;
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int index = getIndex(id);
        Book book = bookService.getAll().get(index);
        req.setAttribute("book", book);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/edit.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showAddForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/add.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void showAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Book> bookList = bookService.getAll();
        req.setAttribute("bookList", bookList);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/list.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                add(req, resp);
                break;
            case "edit":
                edit(req, resp);
                break;
        }
    }

    private void edit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        int pageSize = Integer.parseInt(req.getParameter("pageSize"));
        String author = req.getParameter("author");
        String category = req.getParameter("category");

        Book book = new Book(id, title, pageSize, author, category);
        int index = getIndex(id);
        bookService.edit(index, book);
        resp.sendRedirect("/book-servlet");
    }

    private void add(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        int pageSize = Integer.parseInt(req.getParameter("pageSize"));
        String author = req.getParameter("author");
        String category = req.getParameter("category");

        bookService.addProduct(new Book(id, title, pageSize, author, category));
        resp.sendRedirect("/book-servlet");
    }
}
