package com.retro.adminProduct;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class AdminProductService {

	@Autowired
	AdminProductDAO admProdDAO;
	AdminProductImageVO adminProdImageVO;
	
	//상품 정보 insert
	public void adminProdInsert(AdminProductVO adminProdVO, 
								AdminProductImageVO adminProdImageVO,
								MultipartFile file1, 
								MultipartFile file2, 
								MultipartFile file3, 
								MultipartFile file4, 
								MultipartFile file5, 
								MultipartFile file6,
								String uploadPath,
								HttpServletRequest request) {
		
		
		//썸네일 원본 파일명
		String thumbOrigName = file1.getOriginalFilename();
		//썸네일 서버 파일명
		String thumbStoredName = System.currentTimeMillis() + "_" + thumbOrigName;
		//썸네일 원본 파일 사이즈
		long thumbFileSize = file1.getSize();
		
		//상품 이미지 원본 파일명1
		String upfileOrigName1 = file2.getOriginalFilename();		
		//상품 이미지 서버 파일명1
		String upfileStoredName1 = System.currentTimeMillis() + "_" + upfileOrigName1;
		//상품 이미지 원본 파일 사이즈1
		long upfileFileSize1 = file2.getSize();
		
		//상품 이미지 원본 파일명2
		String upfileOrigName2 = file3.getOriginalFilename();
		//상품 이미지 서버 파일명2
		String upfileStoredName2 = System.currentTimeMillis() + "_" + upfileOrigName2;
		//상품 이미지 원본 파일 사이즈2
		long upfileFileSize2 = file3.getSize();
		
		//상품 이미지 원본 파일명3
		String upfileOrigName3 = file4.getOriginalFilename();
		//상품 이미지 서버 파일명3
		String upfileStoredName3 = System.currentTimeMillis() + "_" + upfileOrigName3;
		//상품 이미지 원본 파일 사이즈3
		long upfileFileSize3 = file4.getSize();		
		
		//상품 이미지 원본 파일명4
		String upfileOrigName4 = file5.getOriginalFilename();
		//상품 이미지 서버 파일명4
		String upfileStoredName4 = System.currentTimeMillis() + "_" + upfileOrigName4;
		//상품 이미지 원본 파일 사이즈4
		long upfileFileSize4 = file5.getSize();	
		
		//상품 이미지 원본 파일명5
		String upfileOrigName5 = file6.getOriginalFilename();
		//상품 이미지 서버 파일명5
		String upfileStoredName5 = System.currentTimeMillis() + "_" + upfileOrigName5;
		//상품 이미지 원본 파일 사이즈5
		long upfileFileSize5 = file6.getSize();		
					
		try {
			
			if(thumbOrigName.isEmpty() == false) {//상품 썸네일 파일이 있을 경우				
				//썸네일 파일 정보 저장
				adminProdVO.setMk_original_thumb(thumbOrigName);
				adminProdVO.setMk_stored_thumb(thumbStoredName);
				adminProdVO.setMk_thumb_size(thumbFileSize);
				File upload_file1 = new File(uploadPath+thumbStoredName);
				file1.transferTo(upload_file1);
			}//상품 썸네일 파일 유무 if문 끝
			
			if(upfileOrigName1.isEmpty() == false) {//상품 이미지 파일1 있을 경우		
				//상품 이미지 파일1 정보 저장		
				adminProdImageVO.setMk_original_upfile1(upfileOrigName1);		
				adminProdImageVO.setMk_stored_upfile1(upfileStoredName1);
				adminProdImageVO.setMk_upfile_size1(upfileFileSize1);
				File upload_file2 = new File(uploadPath+upfileStoredName1);
				file2.transferTo(upload_file2);
			}//상품 이미지 파일1 유무 if문 끝		
					
			if(upfileOrigName2.isEmpty() == false) {//상품 이미지 파일2 있을 경우		
				//상품 이미지 파일2 정보 저장
				adminProdImageVO.setMk_original_upfile2(upfileOrigName2);
				adminProdImageVO.setMk_stored_upfile2(upfileStoredName2);
				adminProdImageVO.setMk_upfile_size2(upfileFileSize2);
				File upload_file3 = new File(uploadPath+upfileStoredName2);
				file3.transferTo(upload_file3);
			}//상품 이미지 파일2 유무 if문 끝	
			
			if(upfileOrigName3.isEmpty() == false) {//상품 이미지 파일2 있을 경우		
				//상품 이미지 파일3 정보 저장
				adminProdImageVO.setMk_original_upfile3(upfileOrigName3);
				adminProdImageVO.setMk_stored_upfile3(upfileStoredName3);
				adminProdImageVO.setMk_upfile_size3(upfileFileSize3);
				File upload_file4 = new File(uploadPath+upfileStoredName3);
				file4.transferTo(upload_file4);
			}//상품 이미지 파일3 유무 if문 끝	
			
			if(upfileOrigName4.isEmpty() == false) {//상품 이미지 파일2 있을 경우		
				//상품 이미지 파일5 정보 저장
				adminProdImageVO.setMk_original_upfile4(upfileOrigName4);
				adminProdImageVO.setMk_stored_upfile4(upfileStoredName4);
				adminProdImageVO.setMk_upfile_size4(upfileFileSize4);
				File upload_file5 = new File(uploadPath+upfileStoredName4);
				file5.transferTo(upload_file5);    
			}//상품 이미지 파일4 유무 if문 끝	
			
			if(upfileOrigName5.isEmpty() == false) {//상품 이미지 파일2 있을 경우		
				//상품 이미지 파일 정보 저장
				adminProdImageVO.setMk_original_upfile5(upfileOrigName5);
				adminProdImageVO.setMk_stored_upfile5(upfileStoredName5);
				adminProdImageVO.setMk_upfile_size5(upfileFileSize5);
				File upload_file6 = new File(uploadPath+upfileStoredName5);
				file6.transferTo(upload_file6);				
			}//상품 이미지 파일5 유무 if문 끝	

        } catch (IllegalStateException e) {            
            e.printStackTrace();
        } catch (IOException e) {            
            e.printStackTrace();
        }		
		
		//상품 정보 작성자 IP주소 가져오기
		String writer_ip = request.getHeader("X-Forwarded-For");	    

	    if (writer_ip == null) {
	    	writer_ip = request.getHeader("Proxy-Client-IP");	        
	    }
	    if (writer_ip == null) {
	    	writer_ip = request.getHeader("WL-Proxy-Client-IP");	        
	    }
	    if (writer_ip == null) {
	    	writer_ip = request.getHeader("HTTP_CLIENT_IP");	        
	    }
	    if (writer_ip == null) {
	    	writer_ip = request.getHeader("HTTP_X_FORWARDED_FOR");	        
	    }
	    if (writer_ip == null) {
	    	writer_ip = request.getRemoteAddr();	        
	    }
	    
		adminProdVO.setMk_writer_ip(writer_ip);		
		
		//상품 정보 테이블에 insert		
		admProdDAO.adminProdInsert(adminProdVO);
		
		
		//상품상세이미지 테이블 데이터 저장
		adminProdImageVO.setPf_product_id(adminProdVO.getMk_product_id());
		
		//상품 상세 이미지 테이블에 insert
		admProdDAO.insertProdImage(adminProdImageVO);
	}
	
		
	
	//상품 수정 update
	public void adminProdUpdate( AdminProductVO adminProdVO, 
								 AdminProductImageVO adminProdImageVO,	
								 MultipartFile file1, 
								 MultipartFile file2, 
								 MultipartFile file3, 
								 MultipartFile file4, 
								 MultipartFile file5, 
								 MultipartFile file6, 
								 String uploadPath,
								 HttpServletRequest request) {		
							
				//썸네일 원본 파일명
				String thumbOrigName = file1.getOriginalFilename();
				//썸네일 서버 파일명
				String thumbStoredName = System.currentTimeMillis() + "_" + thumbOrigName;
				//썸네일 원본 파일 사이즈
				long thumbFileSize = file1.getSize();
			
				
				//상품 이미지 원본 파일명1
				String upfileOrigName1 = file2.getOriginalFilename();		
				//상품 이미지 서버 파일명1
				String upfileStoredName1 = System.currentTimeMillis() + "_" + upfileOrigName1;
				//상품 이미지 원본 파일 사이즈1
				long upfileFileSize1 = file2.getSize();
				
				//상품 이미지 원본 파일명2
				String upfileOrigName2 = file3.getOriginalFilename();
				//상품 이미지 서버 파일명2
				String upfileStoredName2 = System.currentTimeMillis() + "_" + upfileOrigName2;
				//상품 이미지 원본 파일 사이즈2
				long upfileFileSize2 = file3.getSize();
				
				//상품 이미지 원본 파일명3
				String upfileOrigName3 = file4.getOriginalFilename();
				//상품 이미지 서버 파일명3
				String upfileStoredName3 = System.currentTimeMillis() + "_" + upfileOrigName3;
				//상품 이미지 원본 파일 사이즈3
				long upfileFileSize3 = file4.getSize();		
				
				//상품 이미지 원본 파일명4
				String upfileOrigName4 = file5.getOriginalFilename();
				//상품 이미지 서버 파일명4
				String upfileStoredName4 = System.currentTimeMillis() + "_" + upfileOrigName4;
				//상품 이미지 원본 파일 사이즈4
				long upfileFileSize4 = file5.getSize();	
				
				//상품 이미지 원본 파일명5
				String upfileOrigName5 = file6.getOriginalFilename();
				//상품 이미지 서버 파일명5
				String upfileStoredName5 = System.currentTimeMillis() + "_" + upfileOrigName5;
				//상품 이미지 원본 파일 사이즈5
				long upfileFileSize5 = file6.getSize();		
				
								
				try {
					
					if(thumbOrigName.isEmpty() == false) {//상품 썸네일 파일이 있을 경우				
						//썸네일 파일 정보 저장
						adminProdVO.setMk_original_thumb(thumbOrigName);
						adminProdVO.setMk_stored_thumb(thumbStoredName);
						adminProdVO.setMk_thumb_size(thumbFileSize);
						File upload_file1 = new File(uploadPath+thumbStoredName);
						file1.transferTo(upload_file1);
					}//상품 썸네일 파일 유무 if문 끝
					
					if(upfileOrigName1.isEmpty() == false) {//상품 이미지 파일1 있을 경우		
						//상품 이미지 파일1 정보 저장		
						adminProdImageVO.setMk_original_upfile1(upfileOrigName1);		
						adminProdImageVO.setMk_stored_upfile1(upfileStoredName1);
						adminProdImageVO.setMk_upfile_size1(upfileFileSize1);
						File upload_file2 = new File(uploadPath+upfileStoredName1);
						file2.transferTo(upload_file2);
					}//상품 이미지 파일1 유무 if문 끝		
							
					if(upfileOrigName2.isEmpty() == false) {//상품 이미지 파일2 있을 경우		
						//상품 이미지 파일2 정보 저장
						adminProdImageVO.setMk_original_upfile2(upfileOrigName2);
						adminProdImageVO.setMk_stored_upfile2(upfileStoredName2);
						adminProdImageVO.setMk_upfile_size2(upfileFileSize2);
						File upload_file3 = new File(uploadPath+upfileStoredName2);
						file3.transferTo(upload_file3);
					}//상품 이미지 파일2 유무 if문 끝	
					
					if(upfileOrigName3.isEmpty() == false) {//상품 이미지 파일2 있을 경우		
						//상품 이미지 파일3 정보 저장
						adminProdImageVO.setMk_original_upfile3(upfileOrigName3);
						adminProdImageVO.setMk_stored_upfile3(upfileStoredName3);
						adminProdImageVO.setMk_upfile_size3(upfileFileSize3);
						File upload_file4 = new File(uploadPath+upfileStoredName3);
						file4.transferTo(upload_file4);
					}//상품 이미지 파일3 유무 if문 끝	
					
					if(upfileOrigName4.isEmpty() == false) {//상품 이미지 파일2 있을 경우		
						//상품 이미지 파일5 정보 저장
						adminProdImageVO.setMk_original_upfile4(upfileOrigName4);
						adminProdImageVO.setMk_stored_upfile4(upfileStoredName4);
						adminProdImageVO.setMk_upfile_size4(upfileFileSize4);
						File upload_file5 = new File(uploadPath+upfileStoredName4);
						file5.transferTo(upload_file5);    
					}//상품 이미지 파일4 유무 if문 끝	
					
					if(upfileOrigName5.isEmpty() == false) {//상품 이미지 파일2 있을 경우		
						//상품 이미지 파일 정보 저장
						adminProdImageVO.setMk_original_upfile5(upfileOrigName5);
						adminProdImageVO.setMk_stored_upfile5(upfileStoredName5);
						adminProdImageVO.setMk_upfile_size5(upfileFileSize5);
						File upload_file6 = new File(uploadPath+upfileStoredName5);
						file6.transferTo(upload_file6);				
					}//상품 이미지 파일5 유무 if문 끝	

		        } catch (IllegalStateException e) {            
		            e.printStackTrace();
		        } catch (IOException e) {            
		            e.printStackTrace();
		        }		
		
		
				//상품 정보 작성자 IP주소 가져오기
				String writer_ip = request.getHeader("X-Forwarded-For");	    

			    if (writer_ip == null) {
			    	writer_ip = request.getHeader("Proxy-Client-IP");	        
			    }
			    if (writer_ip == null) {
			    	writer_ip = request.getHeader("WL-Proxy-Client-IP");	        
			    }
			    if (writer_ip == null) {
			    	writer_ip = request.getHeader("HTTP_CLIENT_IP");	        
			    }
			    if (writer_ip == null) {
			    	writer_ip = request.getHeader("HTTP_X_FORWARDED_FOR");	        
			    }
			    if (writer_ip == null) {
			    	writer_ip = request.getRemoteAddr();	        
			    }		
			    
				adminProdVO.setMk_writer_ip(writer_ip);					
		
		//상품 정보 수정				
		admProdDAO.adminProdUpdate(adminProdVO);
		
		adminProdImageVO.setPf_product_id(adminProdVO.getMk_product_id());
		
		//System.out.println("상품번호 " + adminProdImageVO.getPf_product_id());
		
		//상품 이미지 정보 수정
		admProdDAO.updateProdImage(adminProdImageVO);
		
		//장바구니 테이블 내 주문이 들어가지 않은 row의 상품 가격(pr_price) 변경
		updateCartPrPrice(adminProdVO);
	}
	
	
	
	//상품 분류(신상품-1, 인기상품-2, 할인상품-3)
	public List<AdminProductVO> selectProdSort() {
		return admProdDAO.selectProdSort();
	}
	
	//상품 종류(스낵/젤리/캔디/기타)
	public List<AdminProductVO> selectProdCategory() {		
		return admProdDAO.selectProdCategory();
	}
	
	//상품 종류(스낵/젤리ㅣ/캔디/기타) 개수
	public int selectTotalProdCategories() {
		return admProdDAO.selectTotalProdCategories();
	}
	
	//전체 상품목록 Select - 페이징처리 포함
	public List<AdminProductVO> adminProductSelect(String searchField, String keyword, int pageFirst, int pageSize) {
		HashMap map = new HashMap();
		
		map.put("searchField", searchField);
		map.put("keyword", keyword);
		map.put("pageFirst", pageFirst);
		map.put("pageSize", pageSize);
		
		return admProdDAO.adminProductSelect(map);
	}
	
	//개별 상품정보 select
	public AdminProductVO adminSelectOneProd(int mk_idx) {
		return admProdDAO.adminSelectOneProd(mk_idx);
	}
	
	//개별 상품상세이미지 select
	public AdminProductImageVO selectProdImage(String product_id) {			
		return admProdDAO.selectProdImage(product_id);
	}	
	
	//상품 삭제(delete)
	public void adminProdDelete(int mk_idx) {
		admProdDAO.adminProdDelete(mk_idx);
	}

	//전체 상품 수
	public int countProd(String searchField, String keyword) {
		HashMap map = new HashMap();
		
		map.put("searchField", searchField);
		map.put("keyword", keyword);
		
		return admProdDAO.countProd(map);
	}
	
	//상품코드 ajax
	public String ajaxProductCode(int prodCategoryValue) {
		
		String productCode = admProdDAO.ajaxProductCode(prodCategoryValue);
		String prCodeChar = "";
		String productCodeNum = "";
		
		if(productCode != null) {
			//상품코드 중 문자만 추출
			prCodeChar = productCode.replaceAll("[0-9]", "");
			
			//상품코드 중 숫자만 추출
			int prCodeNum = Integer.parseInt(productCode.replaceAll("[^0-9]", ""));
			
			//새로운 상품 => 상품코드 중 숫자에 1 더하기
			prCodeNum = prCodeNum +1;
			productCodeNum = String.format("%05d", prCodeNum);
		}else {
			switch(prodCategoryValue) {
				case 1: prCodeChar = "A";
				break;
				case 2: prCodeChar = "B";
				break;
				case 3: prCodeChar = "C";
				break;
				case 4: prCodeChar = "D";
				break;				
			}
			productCodeNum = String.format("%05d", 1);
			
		}
		//새로운 상품 번호 저장
		String newProductCode = prCodeChar + productCodeNum;
					
		return newProductCode;
	}


	//상품 금액 변경 시 주문번호(order_num)가 null, 장바구니상태(cart_status)가 0인 row의 pr_price 데이터 일괄 변경 
	public void updateCartPrPrice(AdminProductVO adminProdVO) {
		admProdDAO.updateCartPrPrice(adminProdVO);
	}
	

	
	
}
