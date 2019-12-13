package com.model2.mvc.service.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

public interface ProductDao {
	
	public int addProduct(Product product) throws Exception;

	public Product getProduct(int prodNo) throws Exception;
	
	public Product recentProduct() throws Exception;

	public List<Product> getProductList(Search search) throws Exception;
	
	public List<Product> getProductListVanila(Search search) throws Exception;

	public int updateProduct(Product product) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
	public int getTotalCountVanila(Search search) throws Exception;
}
