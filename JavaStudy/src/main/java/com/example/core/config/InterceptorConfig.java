package com.example.core.config;

import com.example.core.interceptor.SidebarInterceptor;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * packageName    : com.example.core.config
 * fileName       : InterceptorConfig
 * author         : 서채영
 * date           : 2025-03-31
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-31           서채영            최초 생성
 */
@Configuration
@RequiredArgsConstructor
public class InterceptorConfig  implements WebMvcConfigurer {

    private final SidebarInterceptor sidebarInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(sidebarInterceptor).addPathPatterns("/**");
    }
}
