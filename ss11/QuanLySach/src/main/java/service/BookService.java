package service;

import model.Book;
import repository.BookRepository;
import repository.IBookRepository;

import java.util.List;

public class BookService implements IBookService{
    private static IBookRepository bookRepository = new BookRepository();
    @Override
    public List<Book> getAll() {
        return bookRepository.getAll();
    }

    @Override
    public void addProduct(Book book) {
        bookRepository.addProduct(book);
    }

    @Override
    public void remove(int id) {
        bookRepository.remove(id);
    }

    @Override
    public void edit(int id, Book book) {
        bookRepository.edit(id,book);
    }

    @Override
    public List<Book> findByName(String name) {
        return bookRepository.findByName(name);
    }


}
