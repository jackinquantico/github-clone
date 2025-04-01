package com.example.core.config;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ResourceLoader;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

/**
 * packageName    : com.example.core.config
 * fileName       : MybatisConfig
 * author         : 서채영
 * date           : 2025-03-25
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2025-03-25           서채영            최초 생성
 */
@Configuration
@RequiredArgsConstructor
@EnableConfigurationProperties
@EnableTransactionManagement
@MapperScan(basePackages = "com.example", annotationClass = Mapper.class, sqlSessionFactoryRef = "sqlSessionFactory")
public class MybatisConfig {
    public static final String CONFIG_LOCATION_PATH = "classpath:mybatis/mybatis-config.xml";
    public static final String MAPPER_LOCATION_PATH = "classpath:mybatis/mappers/**/*.xml";

    private final ResourceLoader resourceLoader;
    private final ResourcePatternResolver patternResolver;

    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        sqlSessionFactoryBean.setConfigLocation(resourceLoader.getResource(CONFIG_LOCATION_PATH));
        sqlSessionFactoryBean.setMapperLocations(patternResolver.getResources(MAPPER_LOCATION_PATH));
        return sqlSessionFactoryBean.getObject();
    }

    @Bean
    public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}
