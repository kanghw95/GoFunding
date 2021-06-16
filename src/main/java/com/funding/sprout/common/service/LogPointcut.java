package com.funding.sprout.common.service;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class LogPointcut {
	@Pointcut("execution(* com.funding.sprout..*Impl.*(..))")
	public void allPointcut() {}

}
