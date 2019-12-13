package com.model2.mvc.service.product.test;

import java.util.ArrayList;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.*;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/*
 * FileName : MyBatisTestApp14.java
  * :: Business Layer unit Test : Service + Persistence (Spring +mybatis + DAO)
  * ::  Annotation 기반 
  */
public class ProductTestApp14 {
	
	///main method
	public static void main(String[] args) throws Exception{

		ApplicationContext context =
				new ClassPathXmlApplicationContext(
																	new String[] {	"/config/commonservice14.xml"	 }
									                                   );
		System.out.println("\n");

		ProductService service = (ProductService) context.getBean("productServiceImpl14");
		System.out.println("\n");

		System.out.println("[ FindProduct 실행 해보기 ]");

		System.out.println( service.getProduct(10000) );

		System.out.println("\n");		
		
		//System.out.println("[ insertProduct 실행 해보기 ]");
		
		//프로덕트 null들어 갈시 오류 발생.. INSERT문에 JDBCTYPE 을 선언해주면 된다.
		Product product = new Product();
		product.setProdName("크리스피롤");
		product.setPrice(10000);
		product.setProdDetail("으아앙");
		product.setManuDate("20190101");
	
		//System.out.println( service.addProduct(product) );
		
		
		System.out.println("[ getProductList 실행 해보기 ]");
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		System.out.println( service.getProductList(search).get("list"));
		
		
		
		System.out.println("[ UpdateProduct 실행 해보기 ]");
		product.setProdNo(10041);
		System.out.println( service.updateProduct(product) );
		
		System.out.println("[ getTotalCount 실행 해보기 ]");
		System.out.println( service.getTotalCount(search));
	
	}//end of main
}//end of class