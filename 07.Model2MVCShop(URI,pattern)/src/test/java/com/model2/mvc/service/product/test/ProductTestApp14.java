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
  * ::  Annotation ��� 
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

		System.out.println("[ FindProduct ���� �غ��� ]");

		System.out.println( service.getProduct(10000) );

		System.out.println("\n");		
		
		//System.out.println("[ insertProduct ���� �غ��� ]");
		
		//���δ�Ʈ null��� ���� ���� �߻�.. INSERT���� JDBCTYPE �� �������ָ� �ȴ�.
		Product product = new Product();
		product.setProdName("ũ�����Ƿ�");
		product.setPrice(10000);
		product.setProdDetail("���ƾ�");
		product.setManuDate("20190101");
	
		//System.out.println( service.addProduct(product) );
		
		
		System.out.println("[ getProductList ���� �غ��� ]");
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		System.out.println( service.getProductList(search).get("list"));
		
		
		
		System.out.println("[ UpdateProduct ���� �غ��� ]");
		product.setProdNo(10041);
		System.out.println( service.updateProduct(product) );
		
		System.out.println("[ getTotalCount ���� �غ��� ]");
		System.out.println( service.getTotalCount(search));
	
	}//end of main
}//end of class