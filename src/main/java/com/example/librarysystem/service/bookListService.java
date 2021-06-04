package com.example.librarysystem.service;

import com.example.librarysystem.domain.dto.BookDto;
import com.example.librarysystem.domain.dto.PageModel;
import com.example.librarysystem.domain.entity.Book;
import com.example.librarysystem.repository.BookDao;
import com.example.librarysystem.repository.ListObject;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class bookListService {
    @Autowired
    private BookDao bookDao;

    // 전체 리스트
    public List<Book> bookList() {
        return bookDao.selectAll();
    }

    // 검색 조건(제목, 저자, 출판사)에 따른 리스트
    public List<Book> bookList2(String book_info, String condition){
        return bookDao.selectByEmail(book_info, condition);
    }

    // 장르(장르 네비게이션)에 따른 리스트
    public List<Book> bookList3(String genre) {
        return bookDao.selectByGenre(genre);
    }

    // 인기순위 리스트
    public List<Book> rankingList(String condition){
        return bookDao.selectByCount(condition);
    }
}

