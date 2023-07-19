package com.dao;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SessionService {
	@Autowired
	HttpSession session;

	/**
	 * Đọc giá trị của attribute trong session
	 * 
	 * @param name tên attribute
	 * @return giá trị đọc được hoặc null nếu không tồn tại
	 */
	@SuppressWarnings("unchecked")
	public <T> T get(String name) {
		return (T) session.getAttribute(name);
	}

	public <T> T get(String name, T defaultvalue) {
		T value = get(name);
		return value != null ? value : defaultvalue;
	}

//	public Double getDoubleMin(String input) {
//		T value = get(input);
//		return value != null ? Double.parseDouble(value) : Double.MIN_VALUE;
//	}
//
//	public Double getDoubleMax(String input) {
//		String value = get(input);
//		return value != null ? Double.parseDouble(value) : Double.MAX_VALUE;
//	}

	/**
	 * Thay đổi hoặc tạo mới attribute trong session
	 * 
	 * @param name  tên attribute
	 * @param value giá trị attribute
	 */
	public void set(String name, Object value) {
		session.setAttribute(name, value);
	}

	/**
	 * Xóa attribute trong session
	 * 
	 * @param name tên attribute cần xóa
	 */
	public void remove(String name) {
		session.removeAttribute(name);
	}
}
