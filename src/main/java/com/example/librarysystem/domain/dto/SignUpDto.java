package com.example.librarysystem.domain.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class SignUpDto {
    private String email;
    private String password;
    private String name;
    private String phone;
    private LocalDateTime registerDateTime;
}
