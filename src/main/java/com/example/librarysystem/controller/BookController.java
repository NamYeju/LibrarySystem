package com.example.librarysystem.controller;

import com.example.librarysystem.domain.dto.BookDto;
import com.example.librarysystem.domain.dto.SignUpDto;
import com.example.librarysystem.domain.entity.Book;
import com.example.librarysystem.repository.BookDao;
import com.example.librarysystem.service.bookListService;
import com.example.librarysystem.service.signUpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class BookController {
    @Autowired
    private bookListService bookListService;

    @GetMapping("/list")
    public String list(Model model) {
        List<Book> booklist = bookListService.bookList();
        System.out.println(booklist.get(0).getAUTHOR());
        model.addAttribute("books", booklist);
        return "list";
    }

}

