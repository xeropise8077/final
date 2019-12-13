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



//==> ȸ������ Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method ���� ����
	
	
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
	//==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping("/addProduct")
	public String addProduct( @ModelAttribute("product") Product product, @RequestParam("fileNameList") MultipartFile multipartFile) throws Exception {
		
		StringBuffer sb = new StringBuffer();
        //���ϸ�
		MultipartFile[] multiPartfile = product.getFileNameList();
		
		for(int i=0; i<multiPartfile.length; i++) {
			//���ϸ�
			if(multiPartfile[i].isEmpty() != true) {
				String originalFile =multiPartfile[i].getOriginalFilename();
				//���ϸ� �� Ȯ���ڸ� ����                                //lastIndexOf(".") - �ڿ� �ִ� . �� index��ȣ
				String originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
			 
		        //�������� ����ϴ� ������, UNIX�� �ѱ������� �� �Ǵ� �ü�� 
		        //UUIDŬ���� - (Ư�����ڸ� ������)���ڸ� �������� ����                    "-"��� �������� ��ü
		        String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;	
	        
		        //���� ���
		        String filePath = "C:\\Users\\USER\\Desktop\\workspace\\07.Model2MVCShop(URI,pattern)\\WebContent\\images\\uploadFiles\\";
		        //������ �����ϱ� ���� ���� ��ü ����
		        File file = new File(filePath+storedFileName);	     
		        //���� ���� 
		        multiPartfile[i].transferTo(file);
		        System.out.println(storedFileName+"���� ����ư�, ������� \n"+multiPartfile[i].getSize());
		        
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
		// Business logic ����
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		System.out.println(map.get("list"));
		// Model �� View ����
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
		// Business logic ����
		Map<String , Object> map=productService.getProductListVanila(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		System.out.println(map.get("list"));
		// Model �� View ����
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
		
		//���ͼ��ͷ� ���� �κи� �ɸ��� ���߿� �ٲ������
		//��Ű ������ŭ ����
		for( Cookie cookie : cookies) {
			//��Ű �̸��� "history"�� 
			if(cookie.getName().equals("history")) {
				cookie.setValue(cookie.getValue()+","+request.getParameter("prodNo"));
				response.addCookie(cookie);
				System.out.println( cookie.getValue());
				break;
				
			//��Ű �̸��� "history"�� �ƴϸ� 
			}else{
				response.addCookie(new Cookie("history",request.getParameter("prodNo")));
				break;
			}
		}
		
		
		
		// Model �� View ����
		
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
		System.out.println("/updateProduct�� product.getFileNameList() \n"+product.getFileNameList());
		
	if(product.getFileNameList()!= null) {
		MultipartFile[] multiple =product.getFileNameList();
		
		    //���ϸ�
			//null�� �ƴϰų�
		if( multiple != null && multiple[0].getOriginalFilename().length() >1) {
			StringBuffer sb = new StringBuffer();
			
			MultipartFile[] multiPartfile = product.getFileNameList();
			
			for(int i=0; i<multiPartfile.length; i++) {
				//���ϸ�
				if(multiPartfile[i].isEmpty() != true) {
					String originalFile =multiPartfile[i].getOriginalFilename();
					//���ϸ� �� Ȯ���ڸ� ����                                //lastIndexOf(".") - �ڿ� �ִ� . �� index��ȣ
					String originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
				 
			        //�������� ����ϴ� ������, UNIX�� �ѱ������� �� �Ǵ� �ü�� 
			        //UUIDŬ���� - (Ư�����ڸ� ������)���ڸ� �������� ����                    "-"��� �������� ��ü
			        String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;	
		        
			        //���� ���
			        String filePath = "C:\\Users\\USER\\Desktop\\workspace\\07.Model2MVCShop(URI,pattern)\\WebContent\\images\\uploadFiles\\";
			        //������ �����ϱ� ���� ���� ��ü ����
			        File file = new File(filePath+storedFileName);	     
			        //���� ���� 
			        multiPartfile[i].transferTo(file);
			        System.out.println(storedFileName+"���� ����ư�, ������� \n"+multiPartfile[i].getSize());
			        
			        sb.append(file.getName()+"@");
				}
			}
			//
			product.setFileName(sb.toString());		
		}
	}
		
		int i =productService.updateProduct(product); 
		if(i == 1) {
			System.out.println("[ update�� �Ϸ�Ǿ����ϴ�. ]");
		}else {
			System.out.println("[ update�� �ȵƽ��ϴ�. ]");
		}
		
		// Model �� View ����
		model.addAttribute("product", productService.getProduct(product.getProdNo()));
		model.addAttribute("menu", (String)request.getParameter("menu"));
			return "forward:/product/productDetail.jsp";
			
	}		

}