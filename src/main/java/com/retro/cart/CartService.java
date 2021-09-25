package com.retro.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

	@Autowired
	CartDAO cartDAO;
	
	public void insertCartInfo() {
		cartDAO.insertCartInfo();
	}

}
