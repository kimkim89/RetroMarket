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
		
		// 모든 상품 조회
		public List<HashMap<String, Object>> selectAllProducts() {
			return productDAO.selectAllProducts();
		}
		
		// 스낵 상품 조회
		public List<HashMap<String, Object>> selectSnack() {
			return productDAO.selectSnack();
		}
		
		// 젤리 or 캔디 상품 조회
		public List<HashMap<String, Object>> selectJellyCandy() {
			return productDAO.selectJellyCandy();
		}
		
		// 기타 상품 조회
		public List<HashMap<String, Object>> selectEtc() {
			return productDAO.selectEtc();
		}
		
		// 모든 상품 - 인기상품
		public List<HashMap<String, Object>> selectallPopularProd() {
			return productDAO.selectallPopularProd();
		}
		
		// 모든 상품 - 신상품
		public List<HashMap<String, Object>> selectallNewProd() {
			return productDAO.selectallNewProd();
		}
		
		// 모든 상품 - 할인상품
		public List<HashMap<String, Object>> selectallDiscountProducts() {
			return productDAO.selectallDiscountProducts();
		}
		
	
}
