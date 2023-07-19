package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.entities.Category;

public interface CategoryDAO extends JpaRepository<Category, Integer>{

}
