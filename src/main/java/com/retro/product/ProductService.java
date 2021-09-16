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
		
		public List<HashMap<String, Object>> selectProduct(String prCode) {
			
			
			if(prCode.equals("snack")) { // 스낵 상품 조회
				return productDAO.selectSnack();
			}else if(prCode.equals("jellycandy")) { // 젤리 or 캔디 상품 조회
				return productDAO.selectJellyCandy();
			}else if(prCode.equals("etc")) { // 기타 상품 조회
				return productDAO.selectEtc();
			}else if(prCode.equals("all")){ // 모든 상품 조회
				return productDAO.selectAllProducts();
			}else {
				return productDAO.selectAllProducts();
			}
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
