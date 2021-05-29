package com.example.librarysystem.domain.entity;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class Book {
    private Long BOOK_ID;
    private String BOOK_NAME;
    private String AUTHOR;
    private String PUBLISHER;
    private String GENRE;
    private String BOOK_STATE;
    private String BOOK_IMG;
    private LocalDateTime registerDateTime;
    private int USER_ID;
    private int COUNT;

    public Book(String BOOK_NAME, String AUTHOR, String PUBLISHER, String GENRE, String BOOK_STATE, String BOOK_IMG, LocalDateTime registerDateTime,int USER_ID, int COUNT) {
        this.BOOK_NAME = BOOK_NAME;
        this.AUTHOR = AUTHOR;
        this.PUBLISHER = PUBLISHER;
        this.GENRE = GENRE;
        this.BOOK_STATE = BOOK_STATE;
        this.BOOK_IMG = BOOK_IMG;
        this.registerDateTime = registerDateTime;
        this.USER_ID=USER_ID;
        this.COUNT=COUNT;
    }
}
