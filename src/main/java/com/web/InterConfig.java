package com.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.interceptor.LoggerInterceptor;
import com.interceptor.SecurityInterceptor;

@Configuration
public class InterConfig implements WebMvcConfigurer {
	@Autowired
	LoggerInterceptor logger;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoggerInterceptor()).addPathPatterns("/**");

		registry.addInterceptor(new SecurityInterceptor()).addPathPatterns("/cart/**", "/category/**", "/order/**", "/admin/**","/checkout")
				.excludePathPatterns("/account/login", "/index","/");

	}
}