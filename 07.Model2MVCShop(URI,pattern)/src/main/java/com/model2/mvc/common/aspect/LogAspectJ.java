package com.model2.mvc.common.aspect;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/*
 * FileName : PojoAspectJ.java
 *	:: XML �� ���������� aspect �� ����   
  */
public class LogAspectJ {

	///Constructor
	public LogAspectJ() {
		System.out.println("\nCommon :: "+this.getClass()+"\n");
	}
	
	//Around  Advice
	public Object invoke(ProceedingJoinPoint joinPoint) throws Throwable {
			
		System.out.println("");
		System.out.println("[Around before] Ÿ����ü.�޼��� :"+
													joinPoint.getTarget().getClass().getName() +"."+
												joinPoint.getSignature().getName());
//		HttpServletRequest request = ((ServletRequestAttributes) 
//				RequestContextHolder.getRequestAttributes()).getRequest();
		if(joinPoint.getArgs().length !=0){
			System.out.println("[Around before]method�� ���޵Ǵ� ���� : "+ joinPoint.getArgs()[0]);
		}
		//==> Ÿ�� ��ü�� Method �� ȣ�� �ϴ� �κ� 
		Object obj = joinPoint.proceed();

		System.out.println("[Around after] Ÿ�� ��üreturn value  : "+obj);
		System.out.println("");
		
		return obj;
	}
	
}//end of class