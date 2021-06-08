package com.example.librarysystem.controller;

import com.example.librarysystem.domain.entity.Book;
import com.example.librarysystem.domain.entity.Member;
import com.example.librarysystem.service.bookListService;
import com.example.librarysystem.service.bookRentalService;
import com.example.librarysystem.service.bookReservService;
import com.example.librarysystem.service.bookReturnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class BookController {

    @Autowired
    private bookListService bookListService;
    @Autowired
    private bookRentalService bookRentalService;
    @Autowired
    private bookReservService bookReservService;
    @Autowired
    private bookReturnService bookReturnService;

    private String theGenre="";

    //도서검색
    @GetMapping("/bookList")
    public String list(Model model, @RequestParam(defaultValue="1") int curPage) {
        List<Book> booklist = bookListService.bookList();
        String img = booklist.get(0).getBOOK_IMG();
        System.out.println(booklist.get(0).getAUTHOR());
        model.addAttribute("imgpath",img);
        model.addAttribute("bookList", booklist);
        return "bookList";
    }

    // 조건에 따른 검색
    @PostMapping("/conditionSearch")
    public String bookSearch1(Model model, HttpServletRequest request){
        String book_info = request.getParameter("info");
        String condition =request.getParameter("item");
        String genre=request.getParameter("genre");

        if(genre==null){
            theGenre = "";
        }
        System.out.println(book_info);
        System.out.println(condition);
        System.out.println("thecener="+theGenre);

        List<Book> bookList=bookListService.bookList2(book_info, condition);
        System.out.println(bookList.get(0).getAUTHOR());

        model.addAttribute("genre",theGenre);
        model.addAttribute("booklist2",bookList);
        model.addAttribute("CHECK_OK","success");
        return "bookSearchCheck";
    }

    @PostMapping("/genreSearch")
    public String bookSearch2(Model model, HttpServletRequest request){

        String genre=request.getParameter("item");
        String check=request.getParameter("check");
        theGenre = genre;
        System.out.println("check1="+check);

        List<Book> bookList=bookListService.bookList3(genre);
        System.out.println(bookList.get(0).getBOOK_NAME());
        model.addAttribute("check",check);
        model.addAttribute("genre",genre);
        model.addAttribute("booklist3",bookList);
        model.addAttribute("CHECK_OK","success");
        return "bookSearchGenre";
    }



    //도서 대출
    @GetMapping("/bookRental")
    public String bookRental(Model model){
        List<Book> bookList=bookListService.bookList();
        model.addAttribute("bookList",bookListService.bookList());
        return "bookRental";
    }

    //도서 대출
    @PostMapping("/bookRentalCheck")
    public String bookRentalCheck(Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        Member member = (Member)session.getAttribute("member");

        String bookname=request.getParameter("bookname");
        String state=bookRentalService.bookList1(bookname);
        int cnt=bookRentalService.bookList2(bookname);
        String reser= bookReservService.bookReservCheck(bookname);


        if(member!=null) {
            if(reser!=null) {
                if (reser.equals(member.getName())) {
                    bookReservService.bookReservReturn(bookname);
                }
            }
        }

        if(state.equals("가능") && member!=null && (reser==null || reser.equals(member.getName()))){
            if(member!=null) {
                String user_id = member.getName();
                bookRentalService.book_rental(bookname,user_id,cnt);
            }
            model.addAttribute("RENTAL_OK","success");
        }
        else if(state.equals("가능")&&reser!=null&&member.getName()!=reser){
            model.addAttribute("RENTAL_OK","resercheck");
        }
        else if(member==null){
            model.addAttribute("RENTAL_OK","logincheck");
        }
        else if(state.equals("불가능")){
            model.addAttribute("RENTAL_OK","fail");
        }
        return "bookRentalCheck";
    }


    //도서 반납
    @GetMapping("/bookReturn")
    public String bookreturn(Model model,HttpServletRequest request){
        HttpSession session = request.getSession();
        Member member = (Member)session.getAttribute("member");

        if(member!=null) {
            String bookname = request.getParameter("bookname");
            model.addAttribute("mybook", bookReturnService.mylist(member.getName()));
        }

        /*if(bookname!=null) {
            bookReturnService.bookreturn(bookname);
            model.addAttribute("RETURN_OK","success");
        }*/
        return "bookReturn";
    }

    @PostMapping("/bookReturnCheck")
    public String bookreturncheck(Model model,HttpServletRequest request){
        HttpSession session = request.getSession();
        Member member = (Member)session.getAttribute("member");
        String bookname = request.getParameter("bookname");
        bookReturnService.bookreturn(bookname);
        model.addAttribute("RETURN_OK", "success");


        return "bookReturnCheck";
    }

    //도서 예약
    @GetMapping("/bookReserve")
    public String bookreserve(Model model){
        List<Book> bookList=bookListService.bookList();
        model.addAttribute("bookList",bookListService.bookList());
        return "bookReserve";
    }

    //도서 예약 체크
    @PostMapping("/bookReservCheck")
    public String bookresercheck(Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        Member member = (Member)session.getAttribute("member");

        String bookname=request.getParameter("bookname");

        String reser=bookReservService.bookReservCheck(bookname);
        int cnt=bookReservService.bookReservCnt(bookname);

        if(reser==null && member!=null){
            if(member!=null) {
                String user_id = member.getName();
                bookReservService.bookReserve(bookname,user_id,cnt);
            }
            model.addAttribute("RESER_OK","success");
        }

        else if(member==null){
            model.addAttribute("RESER_OK","logincheck");
        }

        else if(reser!=null){
            model.addAttribute("RESER_OK","fail");
        }

        return "bookReservCheck";
    }

    // 도서 예약 현황
    @GetMapping("/myBook")
    public String mybookreser(Model model,HttpServletRequest request){
        HttpSession session = request.getSession();
        Member member = (Member)session.getAttribute("member");

        if(member!=null) {
            model.addAttribute("mybook", bookReservService.myReservList(member.getName()));
        }
        return "myBook";
    }
}

