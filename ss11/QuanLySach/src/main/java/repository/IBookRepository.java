package repository;

import model.Book;

import java.util.List;

public interface IBookRepository {
    List<Book> getAll();
    void addProduct(Book book);

    void remove(int id);

    void edit(int id, Book book);
    List<Book> findByName(String name);


}
