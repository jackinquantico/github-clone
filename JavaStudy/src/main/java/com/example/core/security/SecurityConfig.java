package com.example.core.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
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
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }

    @Bean
    @Order(Ordered.HIGHEST_PRECEDENCE + 1)
    public SecurityFilterChain httpSecurity(HttpSecurity http) throws Exception {

        http.formLogin().disable();
        http.csrf().disable();
        http.headers().frameOptions().sameOrigin();
        http.httpBasic().disable();

        http.logout()
                .logoutUrl("/auth/logout")
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true)
                .clearAuthentication(true)
        ;

        http.authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/auth/**").permitAll()
                .anyRequest().authenticated()
        ;

        return http.build();
    }

    @Bean
    @Order(Ordered.HIGHEST_PRECEDENCE)
    public SecurityFilterChain excludeStaticResources(HttpSecurity http) throws Exception {
        http.csrf().disable();
        http.authorizeRequests()
                .antMatchers("/css/**",
                            "/fonts/**",
                            "/images/**",
                            "/js/**",
                            "/favicon.*",
                            "/*/icon-*",
                            "/webjars/**",
                            "/vendor/**",
                            "/error/**").permitAll()
        ;
        return http.build();
    }
}
