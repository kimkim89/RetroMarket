package com.retro.product;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retro.moonmarket.HomeMainDAO;

@Service
public class ProductService {
	
	@Autowired
	ProductDAO productDAO;
		
		public List<HashMap<String, Object>> selectAllProducts() {
			return productDAO.selectAllProducts();
		}
		
	
}
