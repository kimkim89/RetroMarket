package com.retro.adminOrder;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.retro.customerOrder.CustomerOrderVO;

@Repository
public class adminOrderDAO {

	@Autowired
	SqlSession sqlSession;
	
	public CustomerOrderVO selectAdminOrderList() {
		return sqlSession.selectList("mapper.adminOrder.selectAdminOrderList");
	}
}
