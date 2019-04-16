package com.service.before;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.po.Consumer;

public interface UserService {
	public String register(Consumer buser,Model model, HttpSession session, String code);
	public String login(Consumer buser,Model model, HttpSession session, String code);
}
