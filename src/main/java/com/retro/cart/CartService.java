package com.retro.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retro.customerOrder.CustomerOrderService;

@Service
public class CartService {

	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private CartVO cartVO;
	@Autowired
	CustomerOrderService csOrderService;
	
	public int insertCartInfo(List<HashMap<String, Object>> productList, Integer productNum, String userId, HttpServletRequest request) {
					
		//장바구니 데이터 저장하는 아이디의 IP주소 가져오기
		String memberIP = request.getHeader("X-Forwarded-For");	    
		//상품번호
		Integer prIdx = 0;
		
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
					 prIdx = Integer.parseInt(ent.getValue().toString());
					 cartVO.setPr_idx(prIdx);
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
		
	    System.out.println();
	    System.out.println("cartVO.getPRCOde: " + cartVO.getPr_idx());
	    System.out.println();
	        
	    int existProdCheck = existProd(cartVO.getPr_idx(), cartVO.getMember_id());
	    if(existProdCheck == 0) {
	    	cartDAO.insertCartInfo(cartVO);
	    	//주문된 상품의 수량을 상품 재고량에서 빼기, 상품별 적립금액 저장
			csOrderService.updateProductInventory(productNum, prIdx, "plus");
	    	
	    }
	    
	    return existProdCheck;
	}
	
	
	public List<HashMap<String, Object>> selectCartList(String userId) {
		return cartDAO.selectCartList(userId);
	}

	
	//장바구니 제품 delete
	public int deleteCartList(Integer checkDelNum) {
		return cartDAO.deleteCartList(checkDelNum);
		
	}

	//장바구니 수량 변경
	public int updateCartList(HashMap<String, Integer> updateCartMap) {
		return cartDAO.updateCartList(updateCartMap);
	}
	
	//장바구니에 동일한 상품이 있는지 확인
	public int existProd(int prIdx, String memberId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
			map.put("prIdx", prIdx);
			map.put("memberId", memberId);
		
		return cartDAO.existProd(map);
	} 

}
