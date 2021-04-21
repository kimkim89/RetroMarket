package com.retro.admin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.retro.member.MemberVO;

@Repository
public class AdminDAO {

	@Autowired
	SqlSession sqlSession;

	// 회원정보 출력
	public List<MemberVO> adminMemberList() {
		return sqlSession.selectList("mapper.Admin.adminMemberList");		
	}
	
	//회원등록
	public void adminMemInsert(MemberVO memberVO) {
		sqlSession.insert("mapper.Admin.adminMemInsert", memberVO);
	}

	//회원정보 수정 데이터 출력
	public MemberVO adminMemberInfo(String id) {
		return sqlSession.selectOne("mapper.Admin.adminMemberInfo", id);
	}

	//회원정보 업데이트
	public void adminMemUpdate(MemberVO memberVO) {
		sqlSession.update("mapper.Admin.adminMemUpdate", memberVO);		
	}
	
	//회원 삭제
	public void adminMemDel(String id) {
		sqlSession.delete("mapper.Admin.adminMemDel", id);
	}
	
	//전체 회원 수
	public int countMem(HashMap<String, Object> map) {
		return sqlSession.selectOne("mapper.Admin.countMem", map);
	}
	
	//페이징처리된 목록 출력
	public List pagingList(HashMap<String, Object> map) {
				
		//20210411 parameter가 HashMap인데 interger과 string 타입이 다 있을 때 - pageFirst는 integer, keyword는 string
		//Object param = map.get(parameterMapping.getProperty().toString()); 처럼 object 타입으로 형 변환 시켜야함
		// mapper에 있는 쿼리 구문 찍음 ↓
		/*String sql = sqlSession.getConfiguration().getMappedStatement("mapper.Admin.pagingList").getBoundSql(map).getSql();
		List<ParameterMapping> parameterMappings = sqlSession.getConfiguration().getMappedStatement("mapper.Admin.pagingList").getBoundSql(map).getParameterMappings();
		
		for (ParameterMapping parameterMapping : parameterMappings) {
            Object param = map.get(parameterMapping.getProperty().toString());
            sql = sql.replaceFirst("\\?", "'" + param.toString() + "'");
        }
        System.out.println("sql : " + sql);*/
	
		return sqlSession.selectList("mapper.Admin.pagingList", map);
	}
	
	//모든 포인트 입력 데이터 수
	public int countPoint(HashMap<String, Object> map) {
		return sqlSession.selectOne("mapper.Admin.countPoint", map);
	}	
	
	//회원 포인트 내역 출력
	public List pointList(HashMap<String, Object> map) {
		// mapper에 있는 쿼리 구문 찍음 ↓
		String sql = sqlSession.getConfiguration().getMappedStatement("mapper.Admin.pointList").getBoundSql(map).getSql();
		List<ParameterMapping> parameterMappings = sqlSession.getConfiguration().getMappedStatement("mapper.Admin.pointList").getBoundSql(map).getParameterMappings();
		
		for (ParameterMapping parameterMapping : parameterMappings) {
            Object param = map.get(parameterMapping.getProperty().toString());
            sql = sql.replaceFirst("\\?", "'" + param.toString() + "'");
        }
        System.out.println("sql : " + sql);
        
        return sqlSession.selectList("mapper.Admin.pointList", map);
	}
	
}
