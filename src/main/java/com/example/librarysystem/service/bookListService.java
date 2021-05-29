package com.example.librarysystem.service;

import com.example.librarysystem.domain.dto.BookDto;
import com.example.librarysystem.domain.entity.Book;
import com.example.librarysystem.repository.BookDao;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class bookListService {
    @Autowired
    private BookDao bookDao;

    public List<Book> bookList() {

        return bookDao.selectAll();
    }
}
