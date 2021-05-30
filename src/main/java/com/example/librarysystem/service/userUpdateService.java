package com.example.librarysystem.service;

import com.example.librarysystem.domain.dto.UserUpdateDto;
import com.example.librarysystem.domain.entity.Member;
import com.example.librarysystem.repository.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;

public class userUpdateService {
    @Autowired
    private MemberDao memberDao;

    public void userupdate(UserUpdateDto userUpdateDto){
        memberDao.update(userUpdateDto);
    }

    public Member sessionchange(UserUpdateDto userUpdateDto){

        return memberDao.selectByEmail(userUpdateDto.getEmail());

    }
}
