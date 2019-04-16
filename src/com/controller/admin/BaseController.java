package com.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.exception.AdminNoLoginException;

//作为判断管理员是否登陆的基类
@Controller
public class BaseController {
	//判断是否登陆，会先被控制器执行
	@ModelAttribute
	public void isLogin(HttpSession session, HttpServletRequest request)throws AdminNoLoginException{
		if(session.getAttribute("admin") == null) {
			throw new AdminNoLoginException("您还没有登陆！");
		}
	}
}
