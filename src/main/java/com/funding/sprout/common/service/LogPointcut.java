package com.funding.sprout.common.service;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class LogPointcut {
	@Pointcut("execution(* com.funding.sprout..*Impl.*(..))")
	public void allPointcut() {}
	
	@Pointcut("execution(* com.funding.sprout..*Impl.insert*(..))")
	public void insertPointcut() {}
	
	@Pointcut("execution(* com.funding.sprout..*Impl.modify*(..))")
	public void modifyPointcut() {}
	
	@Pointcut("execution(* com.funding.sprout..*Impl.update*(..))")
	public void updatePointcut() {}
	
	@Pointcut("execution(* com.funding.sprout..*Impl.delete*(..))")
	public void deletePointcut() {}
}
