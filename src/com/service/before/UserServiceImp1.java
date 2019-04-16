package com.service.before;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.UserDao;
import com.po.Consumer;

@Service("userService")
@Transactional
public class UserServiceImp1 implements UserService{
	@Autowired
	private UserDao userDao;
	
	@Override
	public String register(Consumer buser, Model model, HttpSession session, String code) {
		if(!code.equalsIgnoreCase(session.getAttribute("code").toString())) {
			model.addAttribute("codeError", "验证码错误！");
			return "front/register";
		}
		int n = userDao.register(buser);
		if(n > 0) {
			return "front/login";
		}else {
			model.addAttribute("msg", "注册失败！");
			return "front/register";
		}
	}
	@Override
	public String login(Consumer buser, Model model, HttpSession session, String code) {
		if(!code.equalsIgnoreCase(session.getAttribute("code").toString())) {
			model.addAttribute("msg", "验证码错误！");
			return "front/login";
		}
		Consumer ruser = null;
		List<Consumer> list = userDao.login(buser);
		if(list.size() > 0) {
			ruser = list.get(0);
		}
		if(ruser != null) {
			session.setAttribute("consumer", ruser);
			return "forward:/before";
		}else {
			model.addAttribute("msg", "用户名或密码错误！");
			return "front/login";
		}
	}

}
