package repository;

import model.Book;

import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository {
    private static final List<Book> list = new ArrayList<>();


    static {
        list.add(new Book(1, "Hóa", 32, "Xuân Diệu", "Tự nhiên"));
        list.add(new Book(2, "Hóa", 32, "Xuân Diệu", "Tự nhiên"));
        list.add(new Book(3, "Hóa", 32, "Xuân Diệu", "Tự nhiên"));
        list.add(new Book(4, "Hóa", 32, "Xuân Diệu", "Tự nhiên"));
    }

    @Override
    public List<Book> getAll() {
        return list;
    }

    @Override
    public void addProduct(Book book) {
        list.add(book);
    }

    @Override
    public void remove(int id) {
        list.remove(id);
    }

    @Override
    public void edit(int id, Book book) {
        list.set(id,book);
    }

    @Override
    public List<Book> findByName(String name) {
        List<Book> bookList = new ArrayList<>();
        for(Book book : list){
            if(book.getTitle().toLowerCase().contains(name.toLowerCase())){
                bookList.add(book);
            }
        }
        return bookList;
    }


}
