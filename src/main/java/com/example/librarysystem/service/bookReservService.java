package com.example.librarysystem.service;

import com.example.librarysystem.domain.entity.Book;
import com.example.librarysystem.repository.BookDao;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class bookReservService {
    @Autowired
    private BookDao bookDao;

    public String bookReservCheck(String bookinfo){
        return bookDao.selectFindreservState(bookinfo);
    }

    public int bookReservCnt(String bookinfo){
        return bookDao.selectFindCnt(bookinfo);
    }

    public void bookReserve(String book_name,String user_id,int cnt){
        bookDao.update_reserve(book_name,user_id,cnt);
    }

    public void bookReservReturn(String book_name){
        bookDao.update_reserve2(book_name);
    }

    public List<Book> myReservList(String rental){
        return bookDao.selectByRental(rental);
    }
}
