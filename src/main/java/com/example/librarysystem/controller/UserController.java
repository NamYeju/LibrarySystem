package com.example.librarysystem.controller;

import com.example.librarysystem.domain.dto.SignUpDto;
import com.example.librarysystem.repository.MemberDao;
import com.example.librarysystem.service.signUpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
@Controller
public class UserController {
    @Autowired
    private signUpService signUpService;

    @GetMapping("/")
    public String Main() {

        return "main";
    }

    // 회원가입
    @GetMapping("/signUp")
    public String SignUp(Model model) {

        return "signUp";
    }

    @PostMapping("/check")
    public String SignUpCheck(SignUpDto signUpDto, Model model){
        if(signUpService.check(signUpDto) == false){
            model.addAttribute("SIGNUP_OK", "fail");
        }
        else if(signUpService.check(signUpDto) == true){
            signUpService.insertTime(signUpDto);
            signUpService.signUp(signUpDto);
            model.addAttribute("SIGNUP_OK", "success");
        }
        return "check";
    }
}
