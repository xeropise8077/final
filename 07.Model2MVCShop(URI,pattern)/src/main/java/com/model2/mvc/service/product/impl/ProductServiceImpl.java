package com.model2.mvc.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserDao;

@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao productDao;
	
	public ProductServiceImpl() {
		System.out.println("::"+getClass()+" default Constructor Call.....");
	}
	

	public void setProductDao(ProductDao productDao) {
		System.out.println("::"+getClass()+".setProductDao Call......");
		this.productDao=productDao;
		
	}
	
	@Override
	public int addProduct(Product product) throws Exception {
		
		return productDao.addProduct(product);
		
	}

	@Override
	public Product getProduct(int prodNo) throws Exception {
		return productDao.getProduct(prodNo);
	}

	@Override
	public Map<String, Object> getProductList(Search search) throws Exception {
		List<Product> list= productDao.getProductList(search);
		int totalCount = productDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
		
	}

	@Override
	public int updateProduct(Product product) throws Exception {
		
		return productDao.updateProduct(product);
		
	}


	@Override
	public int getTotalCount(Search search) throws Exception {
		
		return productDao.getTotalCount(search);
	}


	@Override
	public Map<String, Object> getProductListVanila(Search search) throws Exception {
		List<Product> list= productDao.getProductListVanila(search);
		int totalCount = productDao.getTotalCountVanila(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}


	@Override
	public Product recentProduct() throws Exception {
		
		return productDao.recentProduct();
	}

}
