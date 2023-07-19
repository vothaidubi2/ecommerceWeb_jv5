package com.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
@Service
public interface CanvasjsChartDao {
 
	List<List<Map<Object, Object>>> getCanvasjsChartData();
 
}
 