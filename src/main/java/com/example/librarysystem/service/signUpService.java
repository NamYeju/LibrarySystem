package com.example.librarysystem.service;

import com.example.librarysystem.domain.dto.SignUpDto;
import com.example.librarysystem.domain.entity.Member;
import com.example.librarysystem.repository.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDateTime;

public class signUpService {

    @Autowired
    private MemberDao memberDao;

    public  boolean check(SignUpDto signUpDto){
        boolean already = false; //회원가입 가능 유무
        Member member = memberDao.selectByEmail(signUpDto.getEmail());

        if(member == null)
            already = true;

        return already;
    }
    public void insertTime(SignUpDto signUpDto){
        LocalDateTime time = LocalDateTime.now();
        signUpDto.setRegisterDateTime(time);
    }
    public void signUp(SignUpDto signUpDto) {
        memberDao.insert(signUpDto);
    }
}
