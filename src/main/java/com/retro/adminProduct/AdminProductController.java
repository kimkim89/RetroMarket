package com.retro.adminProduct;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.retro.common.PagingService;


@Controller
@RequestMapping("/adminProd/*")
public class AdminProductController {
	
	@Autowired
	private AdminProductService admProdService;
	private PagingService pagingService;
	
	static Logger logger = Logger.getLogger(AdminProductController.class);
	
		//상품관리-목록 페이지
		@RequestMapping(value = "adminProduct")
		public ModelAndView adminProduct(@RequestParam(defaultValue = "1") int nowPage, 
										 @RequestParam(defaultValue = "") String searchField, 
										 @RequestParam(defaultValue = "") String keyword) {
			ModelAndView mav = new ModelAndView();
			
			/*페이징처리*/
			PagingService pagingService = new PagingService();
			HashMap<String, Object> map = new HashMap<String, Object>();		
			int pageSizeToPaging = 4;
			int blockSizeToBlockSize = 3;
			
			int prodCount = admProdService.countProd(searchField, keyword);
			
			map = pagingService.pagingList(nowPage, prodCount, pageSizeToPaging, blockSizeToBlockSize);
			int pageFirst = Integer.parseInt(map.get("pageFirst").toString());
			int pageSize = Integer.parseInt(map.get("pageSize").toString());
			
			List productList = admProdService.adminProductSelect(searchField, keyword, pageFirst, pageSize);
						
			mav.addObject("productList", productList);
			mav.addObject("prodCount", prodCount);
			mav.addObject("map", map);
			mav.addObject("searchField", searchField);
			mav.addObject("keyword", keyword);
			mav.setViewName("admin/admin_product");
			return mav;
		}
		
		
		//상품관리-상품 등록 페이지 요청
		@RequestMapping(value = "adminProductRegister")
		public ModelAndView adminProductRegister( ) {
			
			ModelAndView mav = new ModelAndView();
			
			//상품등록인지 수정인지 구분해주는 구분자 => wu
			//i=> 상품등록, u=> 상품수정
			String wu = "i";
								
			//상품분류(신상품/인기상품/할인상품)
			List<AdminProductVO> prodSortList = admProdService.selectProdSort();	
			//상품 종류(스낵/젤리/캔디/기타)
			List<AdminProductVO> prodCategoryList = admProdService.selectProdCategory();
			//상품 종류 개수
			int totalProdCategories =admProdService.selectTotalProdCategories();
			
			
			mav.addObject("wu", wu);
			mav.addObject("totalProdCategories", totalProdCategories);
			mav.addObject("prodSortList", prodSortList);
			mav.addObject("prodCategoryList", prodCategoryList);
			mav.setViewName("admin/admin_product_register");
			return mav;
		}
		
		
		//상품관리-상품 수정 페이지 요청
		@RequestMapping(value = "adminProdModify/{product_num}", method = RequestMethod.GET)
		public ModelAndView adminProdModify( AdminProductVO adminProdVO, 
											 @RequestParam("wu") String wu,
											 @PathVariable("product_num") String product_num											 
											) {
			
			ModelAndView mav = new ModelAndView();
						
			//상품 인덱스 번호
			int product_idx = Integer.parseInt(product_num);
						
			//상품분류(신상품/인기상품/할인상품)
			List<AdminProductVO> prodSortList = admProdService.selectProdSort();
			
			//상품 종류(스낵/젤리/캔디/기타)
			List<AdminProductVO> prodCategoryList = admProdService.selectProdCategory();			
			
			//개별 상품정보 select
			AdminProductVO prodList = admProdService.adminSelectOneProd(product_idx);
			
			String product_id = prodList.getMk_product_id().toString();
			
			//개별 상품상세이미지 select
			AdminProductImageVO prodImgList = admProdService.selectProdImage(product_id);
			
						
			
			//System.out.println(prodImgList);
			
			
			mav.addObject("wu", wu);			
			mav.addObject("prodSortList", prodSortList);
			mav.addObject("prodCategoryList", prodCategoryList);
			mav.addObject("prodList", prodList);			
			mav.addObject("prodImgList", prodImgList);		
			mav.setViewName("admin/admin_product_register");
			return mav;
		}
		
		
		//상품 정보 insert
		@RequestMapping(value = "adminProdInsert", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/text; charset=utf8")
		public ModelAndView adminProdInsert( AdminProductVO adminProdVO, 
											 AdminProductImageVO adminProdImageVO,
											 @RequestParam("original_thumb") MultipartFile file1, 
											 @RequestParam("original_upfile1") MultipartFile file2,
											 @RequestParam("original_upfile2") MultipartFile file3,
											 @RequestParam("original_upfile3") MultipartFile file4,
											 @RequestParam("original_upfile4") MultipartFile file5,
											 @RequestParam("original_upfile5") MultipartFile file6,
											 //HttpServletRequest request,
											 MultipartHttpServletRequest request									
											) {
			ModelAndView mav = new ModelAndView();
			
			System.out.println("20210715_테스트입니다.");
			
			
			//서버 물리적 경로
			String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/temporary/");
			
			File makeFolder = new File(uploadPath);
			if(!makeFolder.exists()) {
				makeFolder.mkdirs();
			}
			
			admProdService.adminProdInsert(adminProdVO, adminProdImageVO, file1, file2, file3, file4, file5, file6, uploadPath, request);
			

			mav.setViewName("redirect:/adminProd/adminProduct");
			return mav;
		}
		
		
		//상품 삭제(delete)
		@RequestMapping(value="adminProdDelete/{product_num}", method = RequestMethod.GET)
		public ModelAndView adminProdDelete(@PathVariable("product_num") String product_num, RedirectAttributes attributes) {
			ModelAndView mav = new ModelAndView();
			
			//상품 인덱스 번호
			int product_idx = Integer.parseInt(product_num);			
			admProdService.adminProdDelete(product_idx);
			
			String msg = "";
			msg = "회원 삭제 되었습니다.";
			
			attributes.addFlashAttribute("msg", msg);
			mav.setViewName("redirect:/adminProd/adminProduct");
			return mav;
		}
		
		
		//상품정보 update
		@RequestMapping(value = "adminProdUpdate", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
		public ModelAndView adminProdUpdate( AdminProductVO adminProdVO, 
											 AdminProductImageVO adminProdImageVO,
											 @RequestParam("original_thumb") MultipartFile file1, 
											 @RequestParam("original_upfile1") MultipartFile file2,
											 @RequestParam("original_upfile2") MultipartFile file3,
											 @RequestParam("original_upfile3") MultipartFile file4,
											 @RequestParam("original_upfile4") MultipartFile file5,
											 @RequestParam("original_upfile5") MultipartFile file6,
											 MultipartHttpServletRequest request									
											) {
			ModelAndView mav = new ModelAndView();
			
			//서버 물리적 경로
			String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/temporary/");
			
			File makeFolder = new File(uploadPath);
			if(!makeFolder.exists()) {
				makeFolder.mkdirs();
			}
			
			admProdService.adminProdUpdate(adminProdVO, adminProdImageVO, file1, file2, file3, file4, file5, file6, uploadPath, request);
			
			mav.setViewName("redirect:/adminProd/adminProduct");
			return mav;
		}
		 
		//--------------------------------------------------------------------------------
		
		
		//에디터 이미지 업로드 처리
		@RequestMapping(value = "/adminProd/editorFileUpload", method = {RequestMethod.POST, RequestMethod.GET})
		public String editorFileUpload( HttpServletRequest request,
										HttpServletResponse response,
										MultipartHttpServletRequest multiFile) throws Exception {
			JsonObject json = new JsonObject();
			PrintWriter printWriter = null;
			MultipartFile file = multiFile.getFile("upload");
			UUID uid = UUID.randomUUID();
			FileOutputStream out = null;
			
			
			if(file != null) {
				try {
					String fileName = file.getName();
					byte[] bytes = file.getBytes();
					
					//에디터 이미지(upload) 저장 경로 생성
					String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/editor/");
					
					File uploadFile = new File(uploadPath);
					if(!uploadFile.exists()) {
						uploadFile.mkdirs();
					}

					fileName = UUID.randomUUID().toString();
					uploadPath = uploadPath + "/" + fileName;
					out = new FileOutputStream(new File(uploadPath));
					
					out.write(bytes);
					
					printWriter = response.getWriter();
					response.setContentType("text/html");
					String fileUrl = request.getContextPath() + "/resources/images/editor/" + fileName;
					
					//JSON 데이터 등록
					//return값 -> {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
					json.addProperty("uploaded", 1);
					json.addProperty("fileName", fileName);
					json.addProperty("url", fileUrl);
					
					printWriter.println(json);
					
				}catch (IOException e) {
					e.printStackTrace();
				}finally {
					if(out != null) {
						out.close();
					}
					if(printWriter != null) {
						printWriter.close();
					}
				}
					
				}
				return null;
			}
			
			
		//상품 이미지 관련 다운로드 처리
		@RequestMapping(value = "/adminProd/downloadImg", method = RequestMethod.GET)
		public void imgFileDownload(@RequestParam("imgFileName") String imgFileName,
									@RequestParam("imgRealName") String imgRealName,
									HttpServletRequest request,
									HttpServletResponse response) throws Exception {
			
			//서버 물리적 경로
			String uploadPath = request.getSession().getServletContext().getRealPath("/resources/images/temporary/");
			
			String realFile = uploadPath + imgFileName;
			String fileName = imgRealName;
			
			BufferedOutputStream out = null;
			InputStream in = null;
			
			try {
				response.setContentType("image/*");
				response.setHeader("Content-Disposition", "inline;filename="+fileName);
				File file = new File(realFile);
				if(file.exists()) {
					in = new FileInputStream(file);
					out = new BufferedOutputStream(response.getOutputStream());
					int len;
					byte[] buf = new byte[1024];
					while((len = in.read(buf)) > 0) {
						out.write(buf, 0, len);
					}
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(out != null) {out.flush();}
				if(out != null) {out.close();}
				if(out != null) {in.close();}
			}
		}
			
		
		//상품코드 생성 (ajax)		
		@RequestMapping(value = "/adminProd/ajaxProductCode")
		@ResponseBody
		public String ajaxProductCode(HttpServletRequest request) {
			StringBuffer json = new StringBuffer();
			String line = null;
			int prodCateVal;
			String productCodeVal = "";
			
			try {
				BufferedReader reader = request.getReader();
				while((line = reader.readLine()) != null) {
					json.append(line);
					String productCategory = json.toString();
					
					//Arrays.toString(productCategory);
					
					String[] prCategory = productCategory.split("=");
					String prodCategory = prCategory[1];
					prodCateVal = Integer.parseInt(prodCategory);
					
					productCodeVal = admProdService.ajaxProductCode(prodCateVal);
					
				}
			} catch (Exception e) {
				System.out.println("Error reading JSON string" + e.toString());
			}
			return productCodeVal;			
			
		}
		
				
		//20210628 테스트중
		@RequestMapping(value="/adminProd/test33") 
		public ModelAndView dynamicTagTest() {
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("testFolder/test33");
			return mav;
		}
		
		//20210628 테스트중
		@RequestMapping(value="/adminProd/testtest") 
		public ModelAndView dynamicTagTest2() {
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("testFolder/testtest");
			return mav;
		}
	
		//관리자 상품관리 페이지 선택삭제 기능 구현
		@RequestMapping(value="delEachProdInfo", produces = "application/text; charset=utf8") 
		@ResponseBody
		public String deleteEachCartProd(@RequestParam(value="checkedArray[]") List<String> chkBoxArr) {
			
			String delProdCode = "";
			int delResult = 0;
			String delMsg = "";
			
			for(String delPrCode : chkBoxArr) {
				delProdCode = delPrCode;
				
				//장바구니 제품 delete
				delResult = admProdService.deleteAdminProdList(delProdCode);
				admProdService.deleteAdminProdImg(delProdCode);
			}
			
			if(delResult != 0) {
				delMsg = "삭제되었습니다.";
			}
			return delMsg;
		}	
		
		
		
	

		
		
}
