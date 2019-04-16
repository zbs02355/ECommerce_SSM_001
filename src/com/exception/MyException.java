package com.exception;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.po.Admin;
import com.po.Consumer;

public class MyException implements HandlerExceptionResolver{
	@Override
	public ModelAndView resolveException(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2,
			Exception arg3) {
	   	Map<String, Object> model = new HashMap<String, Object>();  
        model.put("ex", arg3); 
        // ���ݲ�ͬ����ת��ͬҳ��  
       if(arg3 instanceof AdminNoLoginException){
        	//��¼ҳ����Ҫadmin����
        	arg0.setAttribute("admin", new Admin());
        	arg0.setAttribute("msg", "û�е�¼�����¼��");
        	return new ModelAndView("/admin/login", model);
        } else if(arg3 instanceof UserNoLoginException){
        	arg0.setAttribute("consumer", new Consumer());
        	arg0.setAttribute("msg", "û�е�¼�����¼��");
        	return new ModelAndView("/before/login", model);
       }else{  
        	return new ModelAndView("/error/error", model);  
        }  
	}
}
