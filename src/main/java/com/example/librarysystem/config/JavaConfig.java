package com.example.librarysystem.config;

import com.example.librarysystem.repository.BookDao;
import com.example.librarysystem.repository.MemberDao;
import com.example.librarysystem.service.signUpService;
import com.example.librarysystem.service.bookListService;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class JavaConfig {
    @Bean(destroyMethod = "close")
    public DataSource dataSource() {
        DataSource ds = new DataSource();
        ds.setDriverClassName("com.mysql.jdbc.Driver");
        ds.setUrl("jdbc:mysql://localhost/librarysystem?characterEncoding=utf8&serverTimezone=UTC");
        ds.setUsername("spring");
        ds.setPassword("spring");
        ds.setInitialSize(2);
        ds.setMaxActive(10);
        ds.setTestWhileIdle(true);
        ds.setMinEvictableIdleTimeMillis(60000 * 3);
        ds.setTimeBetweenEvictionRunsMillis(10 * 1000);
        return ds;
    }
    @Bean
    public MemberDao memberDao() {
        return new MemberDao(dataSource());
    }
    @Bean
    public signUpService signUpService(){
        return new signUpService();
    }
    @Bean
    public BookDao bookDao(){
        return new BookDao((dataSource()));
    }
    @Bean
    public bookListService bookListService(){
        return new bookListService();
    }
}
