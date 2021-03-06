package com.example.librarysystem.repository;

import java.sql.SQLException;
import java.util.List;
import java.sql.ResultSet;
import javax.sql.DataSource;

import com.example.librarysystem.domain.dto.SignUpDto;
import com.example.librarysystem.domain.dto.UserUpdateDto;
import com.example.librarysystem.domain.entity.Member;
import org.springframework.jdbc.core.*;
public class MemberDao {
    private JdbcTemplate jdbcTemplate;
    public MemberDao(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    public List<Member> selectAll() {
        List<Member> results = jdbcTemplate.query("select * from MEMBER",
                (ResultSet rs, int rowNum) -> {
                    Member member = new Member( rs.getString("EMAIL"), rs.getString("PASSWORD"),
                            rs.getString("NAME"), rs.getString("PHONE"),rs.getTimestamp("REGDATE").toLocalDateTime());
                    member.setId(rs.getLong("ID"));
                    return member;
                });
        return results;
    }
    public Member selectByEmail(String email) {
        List<Member> results = jdbcTemplate.query("select * from MEMBER where email=?",
                new RowMapper<Member>() {
                    @Override
                    public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Member member = new Member(rs.getString("EMAIL"),
                                rs.getString("PASSWORD"),
                                rs.getString("NAME"),
                                rs.getString("PHONE"),
                                rs.getTimestamp("REGDATE").toLocalDateTime());
                        member.setId(rs.getLong("ID"));
                        return member;
                    }
                }, email);
        return results.isEmpty() ? null : results.get(0);
    }
    public void insert(SignUpDto signUpDto){
        String sql = "insert into "
                + "MEMBER(EMAIL, PASSWORD, NAME, PHONE, REGDATE) "
                + "values(?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, signUpDto.getEmail(), signUpDto.getPassword(), signUpDto.getName(), signUpDto.getPhone(), signUpDto.getRegisterDateTime() );
    }
    public void update (UserUpdateDto userUpdateDto){
        jdbcTemplate.update("update  MEMBER set PASSWORD=? , NAME=?, PHONE=?, REGDATE=? where EMAIL=?",
                userUpdateDto.getPassword(),userUpdateDto.getName(),userUpdateDto.getPhone(),userUpdateDto.getRegisterDateTime(),userUpdateDto.getEmail());
    }

    //member delete
    public void delete (String email){
        jdbcTemplate.update("delete from MEMBER where EMAIL=?", email);
    }
}

