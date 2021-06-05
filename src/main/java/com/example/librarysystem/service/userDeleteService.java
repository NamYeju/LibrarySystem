package com.example.librarysystem.service;

import com.example.librarysystem.repository.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;

public class userDeleteService {

    @Autowired
    private MemberDao memberDao;

    public void  delete(String email){
        memberDao.delete(email);
    }
}
