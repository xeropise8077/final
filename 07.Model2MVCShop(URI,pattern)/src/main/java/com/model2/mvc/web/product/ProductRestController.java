package com.model2.mvc.web.product;




import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;



//==> 상품관리 RestController
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
	
	
		
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping( value="json/getProduct/{prodNo}", method=RequestMethod.GET)
	public Product getProduct( @PathVariable int prodNo) throws Exception {
		
		System.out.println(prodNo);
		Product product = productService.getProduct(prodNo);
		
		return product;
	}
	
	
	@RequestMapping( value="json/addProduct", method=RequestMethod.POST)
	public Product addProduct( @RequestBody Product product  ) throws Exception {
		
		System.out.println(product);
		
		productService.addProduct(product);
		
		return productService.recentProduct();
	}
	
	@RequestMapping( value="json/getProductList", method=RequestMethod.POST)
	public Map getProductListPost( @RequestBody Search search) throws Exception {
		
		System.out.println(search);
		
		Map map = productService.getProductList(search);
		
	
		
		return map;
	}// 모델로 넘기는 건.4.0은 안되고.. 3.0 버전만 된다.
	
	@RequestMapping( value="json/getProductList", method=RequestMethod.GET)
	public Map getProductListGet( @RequestBody Search search) throws Exception {
		
		System.out.println(search);
		
		Map map = productService.getProductList(search);
		
	
		
		return map;
	}// 모델로 넘기는 건.4.0은 안되고.. 3.0 버전만 된다.	
	
	@RequestMapping( value="json/getProductListVanila", method=RequestMethod.POST)
	public Map getProductListVanilaPOST( @RequestBody Search search, Model model) throws Exception {
		
			System.out.println("json/getProductListVanila");
			Map map = productService.getProductListVanila(search);
			
			return map;
	}
	
	@RequestMapping( value="json/getProductListVanila", method=RequestMethod.GET)
	public Map getProductListVanilaGET( @RequestBody Search search, Model model) throws Exception {
		
			System.out.println("json/getProductListVanila");
			Map map = productService.getProductListVanila(search);
			
			return map;
	}	
	
	@RequestMapping( value="json/updateProduct", method=RequestMethod.POST)
	public void updateProduct( @RequestBody Product product ) throws Exception {
		
		System.out.println("json/updateProduct");
		int i = productService.updateProduct(product);
		
		if(i==1) {
			System.out.println("update 성공");
		}else {
			System.out.println("update 실패");
		}
		
	}
}