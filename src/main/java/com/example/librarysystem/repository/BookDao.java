package com.example.librarysystem.repository;

import com.example.librarysystem.domain.entity.Book;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class BookDao {
    private JdbcTemplate jdbcTemplate;

    public BookDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    // 전체 도서 출력
    public List<Book> selectAll() {
        List<Book> results = jdbcTemplate.query("select * from book",
                (ResultSet rs, int rowNum) -> {
                    Book book = new Book(rs.getString("BOOK_NAME"), rs.getString("AUTHOR"),
                            rs.getString("PUBLISHER"), rs.getString("GENRE"), rs.getString("BOOK_STATE"),
                            rs.getString("BOOK_IMG"), rs.getTimestamp("BOOK_REGDATE").toLocalDateTime(),
                              rs.getString("USER_ID"),rs.getInt("COUNT"), rs.getString("RENTAL"));
                    book.setBOOK_ID(rs.getLong("BOOK_ID"));
                    return book;
                });
        return results;
    }

    // 검색 조건에 맞는 도서리스트
    public List<Book> selectByCondition(String bookinfo,String condition) {
        List<Book> results = jdbcTemplate.query("select * from BOOK where "+condition+" like '%" + bookinfo +"%'",
                new RowMapper<Book>() {
                    @Override
                    public Book mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Book book = new Book( rs.getString("BOOK_NAME"), rs.getString("AUTHOR"),
                                rs.getString("PUBLISHER"), rs.getString("GENRE"), rs.getString("BOOK_STATE"),
                                rs.getString("BOOK_IMG"),rs.getTimestamp("BOOK_REGDATE").toLocalDateTime(),
                                rs.getString("USER_ID"), rs.getInt("COUNT"), rs.getString("RENTAL"));
                        book.setBOOK_ID(rs.getLong("BOOK_ID"));
                        return book;
                    }
                });
        return results;
    }
    //장르 조건에 맞는 도서리스트
    public List<Book> selectByGenre(String genre) {
        List<Book> results = jdbcTemplate.query("select * from BOOK where GENRE=?",
                new RowMapper<Book>() {
                    @Override
                    public Book mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Book book = new Book( rs.getString("BOOK_NAME"), rs.getString("AUTHOR"),
                                rs.getString("PUBLISHER"), rs.getString("GENRE"),
                                rs.getString("BOOK_STATE"), rs.getString("BOOK_IMG"),rs.getTimestamp("BOOK_REGDATE").toLocalDateTime(),
                                rs.getString("USER_ID"), rs.getInt("COUNT"), rs.getString("RENTAL"));
                        book.setBOOK_ID(rs.getLong("BOOK_ID"));
                        return book;
                    }
                },genre);
        return results;
    }

    // 인기순위 도서리스트
    public List<Book> selectByCount(String condition) {
        System.out.println("***"+condition);
        List<Book> results = jdbcTemplate.query("select * from BOOK where GENRE like"+"'%"+condition+"%'"+"ORDER BY COUNT DESC LIMIT 5",
                new RowMapper<Book>() {
                    @Override
                    public Book mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Book book = new Book( rs.getString("BOOK_NAME"), rs.getString("AUTHOR"),
                                rs.getString("PUBLISHER"), rs.getString("GENRE"), rs.getString("BOOK_STATE"),
                                rs.getString("BOOK_IMG"),rs.getTimestamp("BOOK_REGDATE").toLocalDateTime(),
                                rs.getString("USER_ID"), rs.getInt("COUNT"), rs.getString("RENTAL"));
                        book.setBOOK_ID(rs.getLong("BOOK_ID"));
                        return book;
                    }
                });
        return results;
    }

    // 도서 대여
    public void update_rental (String BOOK_NAME, String USER_ID, int COUNT){
        jdbcTemplate.update("update BOOK set BOOK_STATE=? ,USER_ID=?, COUNT=? where book_name=?",
                "불가능",USER_ID, COUNT+1, BOOK_NAME);
    }
    // 도서 반납
    public void update_return (String book_name){
        jdbcTemplate.update("update book set book_state=? ,user_id=? where book_name=?",
                "가능",null,book_name);
    }

    // 도서 예약
    public void update_reserve (String book_name,String user_id,int COUNT){
        jdbcTemplate.update("update book set rental=? ,COUNT=? where book_name=?",
                user_id,COUNT+1, book_name);
    }
    //도서 예약 수정
    public void update_reserve2 (String book_name){
        jdbcTemplate.update("update book set rental=? where book_name=?", null,book_name);
    }

    //해당도서 대여 가능 상태 출력
    public String selectFindState(String bookname) {
        List<Book> results = jdbcTemplate.query("select * from BOOK where book_name=?" ,
                (ResultSet rs, int rowNum) -> {
                    Book book = new Book( rs.getString("BOOK_NAME"), rs.getString("AUTHOR"),
                            rs.getString("PUBLISHER"), rs.getString("GENRE"), rs.getString("BOOK_STATE"),
                            rs.getString("BOOK_IMG"),rs.getTimestamp("BOOK_REGDATE").toLocalDateTime(),
                            rs.getString("USER_ID"), rs.getInt("COUNT"),rs.getString("RENTAL"));
                    book.setBOOK_ID(rs.getLong("BOOK_ID"));
                    return book;
                },bookname);
        return results.get(0).getBOOK_STATE();
    }


    //해당도서 예약 가능 상태 출력
    public String selectFindreservState(String bookname) {
        List<Book> results = jdbcTemplate.query("select * from BOOK where book_name=?" ,
                (ResultSet rs, int rowNum) -> {
                    Book book = new Book( rs.getString("BOOK_NAME"), rs.getString("AUTHOR"),
                            rs.getString("PUBLISHER"), rs.getString("GENRE"), rs.getString("BOOK_STATE"),
                            rs.getString("BOOK_IMG"),rs.getTimestamp("BOOK_REGDATE").toLocalDateTime(),
                            rs.getString("USER_ID"), rs.getInt("COUNT"),rs.getString("RENTAL"));
                    book.setBOOK_ID(rs.getLong("BOOK_ID"));
                    return book;
                },bookname);
        return results.get(0).getRENTAL();
    }


    //해당 도서 조회수 출력
    public int selectFindCnt(String bookname) {
        List<Book> results = jdbcTemplate.query("select * from BOOK where book_name=?" ,
                (ResultSet rs, int rowNum) -> {
                    Book book = new Book( rs.getString("BOOK_NAME"), rs.getString("AUTHOR"),
                            rs.getString("PUBLISHER"), rs.getString("GENRE"), rs.getString("BOOK_STATE"),
                            rs.getString("BOOK_IMG"),rs.getTimestamp("BOOK_REGDATE").toLocalDateTime(),
                            rs.getString("USER_ID"), rs.getInt("COUNT"),rs.getString("RENTAL"));
                    book.setBOOK_ID(rs.getLong("BOOK_ID"));
                    return book;
                },bookname);
        return results.get(0).getCOUNT();
    }
    // 로그인한 사용자 도서 대여 목록
    public List<Book> selectByUserid(String userid) {
        List<Book> results = jdbcTemplate.query("select * from BOOK where user_id=?",
                new RowMapper<Book>() {
                    @Override
                    public Book mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Book book = new Book( rs.getString("BOOK_NAME"), rs.getString("AUTHOR"),
                                rs.getString("PUBLISHER"), rs.getString("GENRE"), rs.getString("BOOK_STATE"),
                                rs.getString("BOOK_IMG"),rs.getTimestamp("BOOK_REGDATE").toLocalDateTime(),
                                rs.getString("USER_ID"), rs.getInt("COUNT"), rs.getString("RENTAL"));
                        book.setBOOK_ID(rs.getLong("BOOK_ID"));
                        return book;
                    }
                },userid);
        return results;
    }
    //로그인한 사용자 도서 예약 목록
    public List<Book> selectByRental(String rental) {
        List<Book> results = jdbcTemplate.query("select * from BOOK where rental=?",
                new RowMapper<Book>() {
                    @Override
                    public Book mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Book book = new Book( rs.getString("BOOK_NAME"), rs.getString("AUTHOR"),
                                rs.getString("PUBLISHER"), rs.getString("GENRE"), rs.getString("BOOK_STATE"),
                                rs.getString("BOOK_IMG"),rs.getTimestamp("BOOK_REGDATE").toLocalDateTime(),
                                rs.getString("USER_ID"), rs.getInt("COUNT"),rs.getString("RENTAL"));
                        book.setBOOK_ID(rs.getLong("BOOK_ID"));
                        return book;
                    }
                },rental);
        return results;
    }
}