package com.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.exception.AdminNoLoginException;

//��Ϊ�жϹ���Ա�Ƿ��½�Ļ���
@Controller
public class BaseController {
	//�ж��Ƿ��½�����ȱ�������ִ��
	@ModelAttribute
	public void isLogin(HttpSession session, HttpServletRequest request)throws AdminNoLoginException{
		if(session.getAttribute("admin") == null) {
			throw new AdminNoLoginException("����û�е�½��");
		}
	}
}
