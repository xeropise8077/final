package com.model2.mvc.web.product;

import java.io.File;
import java.sql.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;



//==> 회원관리 Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
	
	
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping("/addProduct")
	public String addProduct( @ModelAttribute("product") Product product, @RequestParam("fileNameList") MultipartFile multipartFile) throws Exception {
		
		StringBuffer sb = new StringBuffer();
        //파일명
		MultipartFile[] multiPartfile = product.getFileNameList();
		
		for(int i=0; i<multiPartfile.length; i++) {
			//파일명
			if(multiPartfile[i].isEmpty() != true) {
				String originalFile =multiPartfile[i].getOriginalFilename();
				//파일명 중 확장자만 추출                                //lastIndexOf(".") - 뒤에 있는 . 의 index번호
				String originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
			 
		        //업무에서 사용하는 리눅스, UNIX는 한글지원이 안 되는 운영체제 
		        //UUID클래스 - (특수문자를 포함한)문자를 랜덤으로 생성                    "-"라면 생략으로 대체
		        String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;	
	        
		        //파일 경로
		        String filePath = "C:\\Users\\USER\\Desktop\\workspace\\07.Model2MVCShop(URI,pattern)\\WebContent\\images\\uploadFiles\\";
		        //파일을 저장하기 위한 파일 객체 생성
		        File file = new File(filePath+storedFileName);	     
		        //파일 저장 
		        multiPartfile[i].transferTo(file);
		        System.out.println(storedFileName+"으로 저장됐고, 사이즈는 \n"+multiPartfile[i].getSize());
		        
		        sb.append(file.getName()+"@");
			}
		}
		//
		product.setFileName(sb.toString());
	
		System.out.println(product.getFileName());
		product.setManuDate( product.getManuDate().replace("-", "") );
		productService.addProduct(product);
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/deleteProduct")
	public String deleteProduct( @RequestParam("checkBox") String checkBox) throws Exception {
		
		System.out.println("/deleteProduct");
		System.out.println();
		

		return null;
	}
	
	@RequestMapping("/listProduct")
	public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/listProduct");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		System.out.println(map.get("list"));
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("menu", (String)request.getParameter("menu"));
		return "forward:/product/listProduct.jsp";
	}
	
	@RequestMapping("/listProductVanila")
	public String listProductVanila(@ModelAttribute("search") Search search , Model model , HttpServletRequest request ) throws Exception {
		
		System.out.println("/listProductVanila");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		// Business logic 수행
		Map<String , Object> map=productService.getProductListVanila(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		System.out.println(map.get("list"));
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);	
		return "forward:/product/listProductVanila.jsp";
	}
	
	@RequestMapping("/getProduct")
	public String getProduct( @RequestParam("prodNo") int prodNo, Model model, HttpServletRequest request, HttpServletResponse response ) throws Exception {
		
		System.out.println("/getProduct");
		Product product =productService.getProduct(prodNo);
		Cookie[] cookies = request.getCookies();
		
		//인터셉터로 여기 부분만 걸리게 나중에 바꿔줘야함
		//쿠키 갯수만큼 돌림
		for( Cookie cookie : cookies) {
			//쿠키 이름이 "history"면 
			if(cookie.getName().equals("history")) {
				cookie.setValue(cookie.getValue()+","+request.getParameter("prodNo"));
				response.addCookie(cookie);
				System.out.println( cookie.getValue());
				break;
				
			//쿠키 이름이 "history"가 아니면 
			}else{
				response.addCookie(new Cookie("history",request.getParameter("prodNo")));
				break;
			}
		}
		
		
		
		// Model 과 View 연결
		
		model.addAttribute("product", product);
		model.addAttribute("menu", (String)request.getParameter("menu"));
		if(request.getParameter("menu").equals("manage")) {
			return "forward:/product/readProduct.jsp";
		}else {
			return "forward:/product/productDetail.jsp";
		}
	}	

	
	@RequestMapping("/updateProduct")
	public String updateProduct( @ModelAttribute("product") Product product, Model model, HttpServletRequest request,
			@RequestParam("fileNameList") MultipartFile multipartFile ) throws Exception {
		
		System.out.println("/updateProduct");
		//Business Logic
		System.out.println("/updateProduct의 product.getFileNameList() \n"+product.getFileNameList());
		
	if(product.getFileNameList()!= null) {
		MultipartFile[] multiple =product.getFileNameList();
		
		    //파일명
			//null이 아니거나
		if( multiple != null && multiple[0].getOriginalFilename().length() >1) {
			StringBuffer sb = new StringBuffer();
			
			MultipartFile[] multiPartfile = product.getFileNameList();
			
			for(int i=0; i<multiPartfile.length; i++) {
				//파일명
				if(multiPartfile[i].isEmpty() != true) {
					String originalFile =multiPartfile[i].getOriginalFilename();
					//파일명 중 확장자만 추출                                //lastIndexOf(".") - 뒤에 있는 . 의 index번호
					String originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
				 
			        //업무에서 사용하는 리눅스, UNIX는 한글지원이 안 되는 운영체제 
			        //UUID클래스 - (특수문자를 포함한)문자를 랜덤으로 생성                    "-"라면 생략으로 대체
			        String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;	
		        
			        //파일 경로
			        String filePath = "C:\\Users\\USER\\Desktop\\workspace\\07.Model2MVCShop(URI,pattern)\\WebContent\\images\\uploadFiles\\";
			        //파일을 저장하기 위한 파일 객체 생성
			        File file = new File(filePath+storedFileName);	     
			        //파일 저장 
			        multiPartfile[i].transferTo(file);
			        System.out.println(storedFileName+"으로 저장됐고, 사이즈는 \n"+multiPartfile[i].getSize());
			        
			        sb.append(file.getName()+"@");
				}
			}
			//
			product.setFileName(sb.toString());		
		}
	}
		
		int i =productService.updateProduct(product); 
		if(i == 1) {
			System.out.println("[ update가 완료되었습니다. ]");
		}else {
			System.out.println("[ update가 안됐습니다. ]");
		}
		
		// Model 과 View 연결
		model.addAttribute("product", productService.getProduct(product.getProdNo()));
		model.addAttribute("menu", (String)request.getParameter("menu"));
			return "forward:/product/productDetail.jsp";
			
	}		

}