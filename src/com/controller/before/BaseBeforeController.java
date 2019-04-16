package com.controller.before;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.exception.UserNoLoginException;

@Controller
public class BaseBeforeController {
	@ModelAttribute
	public void isLogin(HttpSession session, HttpServletRequest request)throws UserNoLoginException{
		if(session.getAttribute("consumer") == null) {
			throw new UserNoLoginException("Äú»¹Ã»ÓÐµÇÂ½£¡");
		}
	}
}
