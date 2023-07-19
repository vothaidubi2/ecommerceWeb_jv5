package com.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Service;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.handler.MappedInterceptor;

import com.interceptor.LoggerInterceptor;
import com.interceptor.SecurityInterceptor;

@SpringBootApplication
@ComponentScan(basePackages = { "com.*","com.service"})
@EntityScan(basePackages = "com.entities")
@EnableJpaRepositories(basePackages = "com.dao")
@EnableScheduling
public class Lab4Application {
	@Bean
	public MessageSource messageSource() {
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasename("classpath:message/product");
		messageSource.setDefaultEncoding("UTF-8");
		return messageSource;
	}

	@Bean
	public LocalValidatorFactoryBean validateBean() {
		LocalValidatorFactoryBean bean = new LocalValidatorFactoryBean();
		bean.setValidationMessageSource(messageSource());
		return bean;
	}
	

	public static void main(String[] args) {
		SpringApplication.run(Lab4Application.class, args);
	}

}
