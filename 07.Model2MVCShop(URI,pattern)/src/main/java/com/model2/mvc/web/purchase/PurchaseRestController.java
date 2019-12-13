package com.model2.mvc.web.purchase;




import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseService;




//==> ��ǰ���� RestController
@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {
	
	///Field
	@Autowired
	private PurchaseService purchaseService;
	//setter Method ���� ����
	

		
	public PurchaseRestController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping( value="json/getPurchase/{tranNo}", method=RequestMethod.GET)
	public Purchase getPurchase( @PathVariable int tranNo ) throws Exception {
		
			System.out.println("json/getPurchase/{tranNo}");
		
			Purchase purchase =purchaseService.getPurchase(tranNo);
			System.out.println(purchase);
		return purchase;
	}
	
	//���߿� ����
	@RequestMapping( value="json/getPurchaseList", method=RequestMethod.POST)
	public Map<String,Object> getPurchaseList( @RequestBody Map<String, Object> map) throws Exception {
			System.out.println("ó�� ������ �� : \n"+map);
			ObjectMapper objectMapper = new ObjectMapper();
			Search search =objectMapper.convertValue(map.get("search"), Search.class);
			String buyer = objectMapper.convertValue(map.get("userId"), String.class);
			map = purchaseService.getPurchaseList(search, buyer);
			System.out.println(map);
		return map;
	}
	
	@RequestMapping ( value="json/updatePurchase", method=RequestMethod.POST)
	public void updatePurchase( @RequestBody Purchase purchase) throws Exception {
		
		int i =purchaseService.updatePurchase(purchase);
		
		if(i==1) {
			System.out.println("update ����");
		}else {
			System.out.println("update ����");
		}
	}
	
	@RequestMapping ( value="json/addPurchase", method=RequestMethod.POST)
	public void addPurhcase( @RequestBody Purchase purchase ) throws Exception {
		
		purchaseService.addPurchase(purchase);
		
		System.out.println("�Ϸ�");
	}
}
