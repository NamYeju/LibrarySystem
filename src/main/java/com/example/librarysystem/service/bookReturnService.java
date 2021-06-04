package com.example.librarysystem.service;

import com.example.librarysystem.domain.entity.Book;
import com.example.librarysystem.repository.BookDao;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class bookReturnService {
    @Autowired
    private BookDao bookDao;

    public List<Book> mylist(String user_id){
        return bookDao.selectByUserid(user_id);
    }

    public void bookreturn(String book_name){
        bookDao.update_return(book_name);

    }
}
