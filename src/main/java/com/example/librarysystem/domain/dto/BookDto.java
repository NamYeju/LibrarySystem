package com.example.librarysystem.domain.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class BookDto {
    private String BOOK_NAME;
    private String AUTHOR;
    private String PUBLISHER;
    private String GENRE;
    private String BOOK_STATE;
    private String BOOK_IMG;
    private LocalDateTime registerDateTime;
    private int USER_ID;
    private int COUNT;
}
