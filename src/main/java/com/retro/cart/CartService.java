package com.retro.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private CartVO cartVO;
	
	public void insertCartInfo(List<HashMap<String, Object>> productList, Integer productNum, String userId, HttpServletRequest request) {
				
		
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
		
		for(int i = 0; i < productList.size(); i++) {
			for(Entry<String, Object> ent : productList.get(i).entrySet()) {
				 //System.out.println( String.format("키 : %s, 값 : %s", ent.getKey(), ent.getValue()) );
				 if(ent.getKey().equals("mk_idx")) {
					 String cartIdx = ent.getValue().toString();
					 cartVO.setPr_idx(Integer.parseInt(cartIdx));
				 }else if(ent.getKey().equals("mk_product_id")) {
					 String proCode = ent.getValue().toString();
					 cartVO.setPr_code(proCode);				 
				 }else if(ent.getKey().equals("mk_product_name")) {
					 String proName = ent.getValue().toString();
					 cartVO.setPr_name(proName);					 
				 }else if(ent.getKey().equals("mk_product_price")) {
					 String proPrice = ent.getValue().toString();
					 cartVO.setPr_price(Integer.parseInt(proPrice));
				 }
			}
		}
		
	    cartVO.setMember_id(userId);
		cartVO.setTotal_num(productNum);
	    cartVO.setMember_ip(memberIP);
		
		cartDAO.insertCartInfo(cartVO);
	}
	
	
	public List<HashMap<String, Object>> selectCartList(String userId) {
		return cartDAO.selectCartList(userId);
	}

}