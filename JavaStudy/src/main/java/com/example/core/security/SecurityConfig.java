package com.example.core.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

/**
 * packageName    : com.example.core.security
 * fileName       : SecurityConfig
 * author         : 서채영
 * date           : 2025-03-25
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-25           서채영            최초 생성
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig {
    @Bean
    protected SecurityFilterChain httpSecurity(HttpSecurity http) throws Exception {

        http.formLogin().disable();
        http.csrf().disable();
        http.headers().frameOptions().sameOrigin();
        http.authorizeRequests().anyRequest().permitAll();

        return http.build();
    }
}
