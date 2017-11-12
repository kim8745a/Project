package com.terrier.logging;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Aspect
public class AuditAspect {
	protected Logger log = LoggerFactory.getLogger(AuditAspect.class);
	static String name = "";
	static String type = "";
	
	@Around("execution(* com..controller.*Controller.*(..))")
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable{
		type = joinPoint.getSignature().getDeclaringTypeName();
		
		if(type.indexOf("Controller") > -1){
			name = "Controller \t :   ";
		}
		log.info(name + type + "." + joinPoint.getSignature().getName() + "()");
		return joinPoint.proceed();
	}
}
