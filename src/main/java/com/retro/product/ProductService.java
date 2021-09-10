package com.retro.product;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retro.adminProduct.AdminProductImageVO;
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
		
		// 상품 상세 페이지 데이터 조회
		public List<HashMap<String, Object>> selectEachProd(String product_id) {
			return productDAO.selectEachProd(product_id);
		}
				
		// 모든 상품 - 인기상품
		public List<HashMap<String, Object>> selectAllPopularProd() {
			return productDAO.selectAllPopularProd();
		}
		
		// 모든 상품 - 신상품
		public List<HashMap<String, Object>> selectAllNewProd() {
			return productDAO.selectAllNewProd();
		}
		
		// 모든 상품 - 할인상품
		public List<HashMap<String, Object>> selectAllDiscountProd() {
			return productDAO.selectAllDiscountProd();
		}


		
	
}
