package com.example.librarysystem.domain.entity;

import java.time.LocalDateTime;
public class Member {
    private Long id;
    private String email;
    private String password;
    private String name;
    private String phone;
    private LocalDateTime registerDateTime;
    public Member(String email, String password, String name, String phone, LocalDateTime regDateTime)
    {
        this.email = email;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.registerDateTime = regDateTime;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public LocalDateTime getRegisterDateTime() {
        return registerDateTime;
    }

    public void setRegisterDateTime(LocalDateTime registerDateTime) {
        this.registerDateTime = registerDateTime;
    }
}

