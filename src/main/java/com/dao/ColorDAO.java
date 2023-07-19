package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.entities.Color;

public interface ColorDAO extends JpaRepository<Color, Integer>{

}
