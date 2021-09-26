package com.retro.cart;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private CartVO cartVO;
	
	public void insertCartInfo(List<HashMap<String, Object>> productList, Integer productNum) {
		
		cartVO.setTotal_num(productNum);
		
		for(int i = 0; i < productList.size(); i++) {
			for(Entry<String, Object> ent : productList.get(i).entrySet()) {
				 System.out.println( String.format("키 : %s, 값 : %s", ent.getKey(), ent.getValue()) );
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
		

		
		
		cartDAO.insertCartInfo(cartVO);
	}

}
