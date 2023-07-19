package com.bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.dao.InvoiceDAO;
import com.dao.OrderDAO;
import com.entities.Invoice;
import com.entities.Orders;

public class CanvasjsChartData {
	@Autowired
	InvoiceDAO invoicedao;
	@Autowired
	OrderDAO orders;

	static Map<Object, Object> map = null;
	static List<List<Map<Object, Object>>> list = new ArrayList<List<Map<Object, Object>>>();
	static List<Map<Object, Object>> dataPoints1 = new ArrayList<Map<Object, Object>>();
//	public double totalmoney(Integer input) {
//		double tempmoney = 0;
//		if(invoicedao.findIdbyInputDate(input).isEmpty()) {
//			return tempmoney = 0;
//		}
//		for (Invoice temp : invoicedao.findIdbyInputDate(input)) {
//			for (Orders ordertemp : orders.findByInvoiceId(temp.getId())) {
//				tempmoney += (ordertemp.getQuantity() * ordertemp.getPrice());
//			}
//		}
//		return tempmoney;
//	}
//	static {
	// double temp1 = new CanvasjsChartData().totalmoney(7);
	// double temp2 = new CanvasjsChartData().totalmoney(6);
	// double temp3 = new CanvasjsChartData().totalmoney(5);
	// double temp4 = new CanvasjsChartData().totalmoney(4);
	// double temp5 = new CanvasjsChartData().totalmoney(3);
	// double temp6 = new CanvasjsChartData().totalmoney(2);
	// double temp6 = new CanvasjsChartData().totalmoney(1);
//		map = new HashMap<Object,Object>(); map.put("x", "6 days ago"); map.put("y", temp1);dataPoints1.add(map);
//		map = new HashMap<Object,Object>(); map.put("x", "5 days ago"); map.put("y", temp2);dataPoints1.add(map);
//		map = new HashMap<Object,Object>(); map.put("x", "4 days ago"); map.put("y", temp3);dataPoints1.add(map);
//		map = new HashMap<Object,Object>(); map.put("x", "3 days ago"); map.put("y", temp4);dataPoints1.add(map);
//		map = new HashMap<Object,Object>(); map.put("x", "2 days ago"); map.put("y",temp5);dataPoints1.add(map);
//		map = new HashMap<Object,Object>(); map.put("x", "1 days ago"); map.put("y", temp6);dataPoints1.add(map);
//		map = new HashMap<Object,Object>(); map.put("x", "now"); map.put("y", temp7);dataPoints1.add(map);
//		
//		list.add(dataPoints1);
//	}

	public static List<List<Map<Object, Object>>> getCanvasjsDataList() {

		return list;
	}

}