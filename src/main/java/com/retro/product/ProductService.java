package com.retro.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retro.adminProduct.AdminProductImageVO;
import com.retro.adminProduct.AdminProductVO;
import com.retro.moonmarket.HomeMainDAO;

@Service
public class ProductService {
	
	@Autowired
	ProductDAO productDAO;
	@Autowired
	AdminProductVO adminProdVO;
	@Autowired
	ProductController productController;
	
		
		// 상품 조회
		public List<HashMap<String, Object>> selectProdList(String prCode, String prType, int pageFirst, int pageSize) {			
			Map<String, Integer> prCodeNumMap = new HashMap<String, Integer>();
			
			System.out.println();
			System.out.println("prType확인중1234--------- : " + prType);
			System.out.println();
			
			int prCodeNum = 0;
			int prTypeNum = 0;
			
			if(prCode.equals("snack")) { // 스낵 상품 조회
				prCodeNum = 1;			
			}else if(prCode.equals("jellycandy")) { // 젤리 or 캔디 상품 조회
				prCodeNum = 2;
			}else if(prCode.equals("etc")) { // 기타 상품 조회
				prCodeNum = 3;
			}else if(prCode.equals("all")){ // 모든 상품 조회
				prCodeNum = 0;
			}
			
			
			if(prType.equals("new")) {
				prTypeNum = 1;
			}else if(prType.equals("pop")) {
				prTypeNum = 2;
			}else if(prType.equals("dis")) {
				prTypeNum = 3;
			}else {
				prTypeNum = 0;
			}
			
			prCodeNumMap.put("prCodeNum", prCodeNum);
			prCodeNumMap.put("prTypeNum", prTypeNum);
			prCodeNumMap.put("pageFirst", pageFirst);
			prCodeNumMap.put("pageSize", pageSize);
			
			return productDAO.selectProdList(prCodeNumMap);
		}
	
		// 상품 상세 페이지 데이터 조회
		public List<HashMap<String, Object>> selectEachProd(int productId) {
			return productDAO.selectEachProd(productId);
		}
				
		// 상품 개수 조회
		public int countAllProducts(String prCode, String prType) {
			
			Map<String, Integer> prCodeNumMap = new HashMap<String, Integer>();
			
			int prCodeNum = 0;
			int prTypeNum = 0;
			
			if(prCode.equals("snack")) { // 스낵 상품 조회
				prCodeNum = 1;			
			}else if(prCode.equals("jellycandy")) { // 젤리 or 캔디 상품 조회
				prCodeNum = 2;
			}else if(prCode.equals("etc")) { // 기타 상품 조회
				prCodeNum = 3;
			}else if(prCode.equals("all")){ // 모든 상품 조회
				prCodeNum = 0;
			}
			
			
			if(prType.equals("new")) {
				prTypeNum = 1;
			}else if(prType.equals("pop")) {
				prTypeNum = 2;
			}else if(prType.equals("dis")) {
				prTypeNum = 3;
			}else {
				prTypeNum = 0;
			}
			
			prCodeNumMap.put("prCodeNum", prCodeNum);
			prCodeNumMap.put("prTypeNum", prTypeNum);
			
			
			return productDAO.countAllProducts(prCodeNumMap);
		}
		
		
		//위시리스트(좋아요) 테이블에 데이터 저장
		public int insertProdLikeInfo(int prodIdx, HttpServletRequest request) {
			
			WishlistVO wishlistVO = new WishlistVO();
			
			String userId = productController.getCurrentUserID(request);	
			
			
			//장바구니 데이터 저장하는 아이디의 IP주소 가져오기
			String memberIP = request.getHeader("X-Forwarded-For");	    

		    if (memberIP == null) {
		    	memberIP = request.getHeader("Proxy-Client-IP");	        
		    }
		    if (memberIP == null) {
		    	memberIP = request.getHeader("WL-Proxy-Client-IP");	        
		    }
		    if (memberIP == null) {
		    	memberIP = request.getHeader("HTTP_CLIENT_IP");	        
		    }
		    if (memberIP == null) {
		    	memberIP = request.getHeader("HTTP_X_FORWARDED_FOR");	        
		    }
		    if (memberIP == null) {
		    	memberIP = request.getRemoteAddr();	        
		    }
			
			wishlistVO.setUw_user_id(userId);
			wishlistVO.setUw_prod_idx(prodIdx);
			wishlistVO.setUw_user_ip(memberIP);
			
			return productDAO.insertProdLikeInfo(wishlistVO);
		}
		
		//위시리스트 테이블에 중복된 데이터가 있는지 확인 
		public int checkDuplicateLike(int prodIdx, String userId) {
			
			Map<String, Object> map = new HashMap<String, Object>();
				map.put("prodIdx", prodIdx);
				map.put("userId", userId);
			
			return productDAO.checkDuplicateLike(map);
		}
		
		//위시리스트 내 데이터 삭제 
		public int deleteWishlist(int prodIdx, String userId) {
			Map<String, Object> map = new HashMap<String, Object>();
				map.put("prodIdx", prodIdx);
				map.put("userId", userId);
			return productDAO.deleteWishlist(map);
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
