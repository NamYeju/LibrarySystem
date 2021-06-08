package com.example.librarysystem.controller;

import com.example.librarysystem.domain.dto.SignInDto;
import com.example.librarysystem.domain.dto.SignUpDto;
import com.example.librarysystem.domain.dto.UserUpdateDto;
import com.example.librarysystem.domain.entity.Book;
import com.example.librarysystem.domain.entity.Member;
import com.example.librarysystem.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private signUpService signUpService;
    @Autowired
    private signInService signInService;

    @Autowired
    private userUpdateService userUpdateService;

    @Autowired
    private userDeleteService userDeleteService;

    @Autowired
    private bookListService bookListService;

    static Member member_session;

    @GetMapping("/")
    public String Main(Model model, HttpServletRequest request){
        HttpSession session=request.getSession();
        if(member_session==null){
        }
        else {
            session.setAttribute("member", member_session);
        }
        String condition=request.getParameter("item");
        System.out.println(condition);

        if(condition!=null) {
            List<Book> booklist = bookListService.rankingList(condition);
            System.out.println(booklist.get(0).getBOOK_NAME());
            model.addAttribute("books", booklist);
        }
        else {
            List<Book> booklist = bookListService.rankingList("국내소설");
            model.addAttribute("books", booklist);
        }
        return "realmain";
    }

    // 회원가입
    @GetMapping("/signUp")
    public String SignUp(Model model) {

        return "signUp";
    }
    //회원가입 확인
    @PostMapping("/signUpcheck")
    public String SignUpCheck(SignUpDto signUpDto, Model model){
        if(!signUpService.check(signUpDto)){
            model.addAttribute("SIGNUP_OK", "fail");
        }
        else if(signUpService.check(signUpDto)){
            signUpService.insertTime(signUpDto);
            signUpService.signUp(signUpDto);
            model.addAttribute("SIGNUP_OK", "success");
        }
        return "signUpcheck";
    }
    //로그인
    @GetMapping("/signIn")
    public String signinpage(){
        return "signIn";
    }

    //로그인 체크
    @PostMapping("/signIncheck")
    public String signIn(Model model, SignInDto signInDto, HttpServletRequest request){
        Member member=signInService.signIn(signInDto);

        //db에 email이 없을때
        if(member==null){

            model.addAttribute("SIGNIN_OK","failid");
        }
        //db에 email이 있을때
        else {
            //db에 값이랑 email,password 같을때
            if (signInDto.getEmail().equals(member.getEmail()) && signInDto.getPassword().equals(member.getPassword())) {
                model.addAttribute("SIGNIN_OK", "success");
                member_session = member;

            }
            //db에 값이랑 email은 같고 password가 다를때
            else if (signInDto.getEmail().equals(member.getEmail()) && !signInDto.getPassword().equals(member.getPassword())) {
                System.out.println("2");
                model.addAttribute("SIGNIN_OK", "failpwd");
            }
        }

        return "signIncheck";

    }

    //로그아웃
    @GetMapping("/logout")
    public String logout() {
        member_session = null;
        return "logout";
    }
    //회원 수정 페이지

    @GetMapping("/userUpdate")
    public String userUpdatepage(){

        return "userUpdate";
    }


    @PostMapping("/userUpdateCheck")
    public String userUpdate(UserUpdateDto userUpdateDto, Model model){
        LocalDateTime time= LocalDateTime.now();
        userUpdateDto.setEmail(member_session.getEmail());
        userUpdateDto.setRegisterDateTime(time);
        userUpdateService.userupdate(userUpdateDto);

        Member member=userUpdateService.sessionchange(userUpdateDto);

        member_session = member;
        model.addAttribute("UPDATE_OK", "success");
        return "userUpdateCheck";
    }


    @PostMapping("/userDelete")
    public String userDelete(HttpServletRequest request,Model model){

        userDeleteService.delete(member_session.getEmail());

        model.addAttribute("DELETE_OK","success");
        member_session = null;


        return "userDelete";
    }
}
