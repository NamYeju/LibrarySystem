package com.example.librarysystem.service;

import com.example.librarysystem.domain.dto.SignInDto;
import com.example.librarysystem.domain.entity.Member;
import com.example.librarysystem.repository.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;

public class signInService {
    @Autowired
    private MemberDao memberDao;

    public Member signIn(SignInDto signInDto) {
        String email=signInDto.getEmail();
        System.out.println("signIn="+email);
        Member member=memberDao.selectByEmail(email);
        return member;
    }

}
