package com.model2.mvc.service.payment;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Payment;
import com.model2.mvc.service.domain.Product;

public interface PaymentService {

	public int addPayment(Payment payment) throws Exception;

	public Payment getPayment(int tranNo) throws Exception;


}
