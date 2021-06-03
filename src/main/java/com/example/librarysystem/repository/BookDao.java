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
    public String selectfindAll(String bookname) {
        List<Book> results = jdbcTemplate.query("select * from BOOK where book_name=?" ,
                (ResultSet rs, int rowNum) -> {
                    Book book = new Book( rs.getString("BOOK_NAME"), rs.getString("AUTHOR"),
                            rs.getString("PUBLISHER"), rs.getString("GENRE"), rs.getString("BOOK_STATE"),
                            rs.getString("BOOK_IMG"),rs.getTimestamp("BOOK_REGDATE").toLocalDateTime(),
                            rs.getString("USER_ID"), rs.getInt("COUNT"), rs.getString("RENTAL"));
                    book.setBOOK_ID(rs.getLong("BOOK_ID"));
                    return book;
                },bookname);
        return results.get(0).getBOOK_STATE();
    }


    public List<Book> selectByEmail(String bookinfo,String jogun) {
        List<Book> results = jdbcTemplate.query("select * from BOOK where "+jogun+" like '%" + bookinfo +"%'",
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

    public void update (String book_name,String user_id){
        jdbcTemplate.update("update book set book_state=? ,user_id=? where book_name=?",
                "불가능",user_id,book_name);
    }


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

    public void update1 (String book_name){
        jdbcTemplate.update("update book set book_state=? ,user_id=? where book_name=?",
                "가능",null,book_name);
    }


    //책 총 갯수
    public int count(){
        int count = jdbcTemplate.queryForObject("select count(*) from book", Integer.class);
        return count;
    }
    //페이징
    public int getTotalRow() {
        String sql = "select count(*) from BOOK";

        int totalRow=jdbcTemplate.queryForObject(sql,new RowMapper<Integer>(){
            @Override
            public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
                return rs.getInt(1);
            }//mapRow()

        });//queryForObject()
        return totalRow;
    }//getTotalRow()


}