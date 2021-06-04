package com.example.librarysystem.service;


import com.example.librarysystem.repository.BookDao;
import org.springframework.beans.factory.annotation.Autowired;

public class bookRentalService {
    @Autowired
    private BookDao bookDao;

    //find book_state
    public String bookList1(String bookinfo){ return bookDao.selectFindState(bookinfo); }

    //find cnt
    public int bookList2(String bookinfo){return bookDao.selectFindCnt(bookinfo); }


    //update 정보
    public void book_rental(String book_name,String user_id,int count){
        bookDao.update_rental(book_name, user_id, count);
    }
}
