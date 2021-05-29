package com.example.librarysystem.repository;

import com.example.librarysystem.domain.entity.Book;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.util.List;

public class BookDao {
    private JdbcTemplate jdbcTemplate;

    public BookDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public List<Book> selectAll() {
        List<Book> results = jdbcTemplate.query("select * from book",
                (ResultSet rs, int rowNum) -> {
                    Book book = new Book(rs.getString("BOOK_NAME"), rs.getString("AUTHOR"),
                            rs.getString("PUBLISHER"), rs.getString("GENRE"), rs.getString("BOOK_STATE"),
                            rs.getString("BOOK_IMG"), rs.getTimestamp("BOOK_REGDATE").toLocalDateTime(),
                              rs.getInt("USER_ID"),rs.getInt("COUNT"));
                    book.setBOOK_ID(rs.getLong("BOOK_ID"));
                    return book;
                });
        return results;
    }
}