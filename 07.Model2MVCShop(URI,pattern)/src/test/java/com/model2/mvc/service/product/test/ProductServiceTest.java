package com.model2.mvc.service.product.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;


/*
 *	FileName :  UserServiceTest.java
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-aspect.xml",
									"classpath:config/context-common.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml"})
public class ProductServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	private ProductService productService;

	@Test
	public void testAddProduct() throws Exception {
		
		Product product = new Product();
		product.setProdName("ũ�����Ƿ�");
		product.setPrice(10000);
		product.setProdDetail("���ƾ�");
		product.setManuDate("20190101");
		
		productService.addProduct(product);
		


	}
	
	//@Test
	public void testGetProduct() throws Exception {
		
		Product product = new Product();
//		product.setProdName("ũ�����Ƿ�");
//		product.setPrice(10000);
//		product.setProdDetail("���ƾ�");
//		product.setManuDate("20190101");
		
		product = productService.getProduct(10042);

		//==> console Ȯ��
		//System.out.println(product);
		
		//==> API Ȯ��
		Assert.assertEquals("ũ�����Ƿ�", product.getProdName());
		Assert.assertEquals(10000, product.getPrice());
		Assert.assertEquals("���ƾ�",product.getProdDetail());
		Assert.assertEquals("20190101", product.getManuDate());

		Assert.assertNotNull(productService.getProduct(10042));
		Assert.assertNotNull(productService.getProduct(10041));
	}
	
	//@Test
	 public void testUpdateProduct() throws Exception{
		 
		Product product = productService.getProduct(10017);
		Assert.assertNotNull(product);
		
		Assert.assertEquals("ũ�����Ƿ�", product.getProdName());
		Assert.assertEquals(10000, product.getPrice());
		Assert.assertEquals("���ƾ�",product.getProdDetail());
		Assert.assertEquals("20190101", product.getManuDate());

		product.setProdName("change");
		product.setPrice(200000);
		product.setProdDetail("prodDetail");
		product.setManuDate("20190202");
		
		productService.updateProduct(product);
		
		product = productService.getProduct(10042);
		Assert.assertNotNull(product);
		
		//==> console Ȯ��
		//System.out.println(user);
			
		//==> API Ȯ��
		Assert.assertEquals("change", product.getProdName());
		Assert.assertEquals(200000, product.getPrice());
		Assert.assertEquals("prodDetail",product.getProdDetail());
		Assert.assertEquals("20190202", product.getManuDate());
	 }
	 
	
	 //==>  �ּ��� Ǯ�� �����ϸ�....
	// @Test
	 public void testGetProductListAll() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	
	 	Map<String,Object> map = productService.getProductList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
		//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 	
	 	System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = productService.getProductList(search);
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	//==> console Ȯ��
	 	//System.out.println(list);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
	
}