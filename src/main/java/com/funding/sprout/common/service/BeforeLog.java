package com.funding.sprout.common.service;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class BeforeLog {
	
	private static final Logger logger = LoggerFactory.getLogger(AfterThrowingLog.class);
	
	@Before("execution(* com.funding.sprout..*Impl.*(..))")
	public void beforeMethod(JoinPoint jp) {
		
		
		String methodName = jp.getSignature().getName();
		Object[] args = jp.getArgs();
		logger.info("before " + methodName + "() 메소드");

		logger.info("before " + methodName + "() args: " + args.toString());
		
	}
}
