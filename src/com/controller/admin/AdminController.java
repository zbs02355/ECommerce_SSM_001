package com.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.Admin;
import com.service.admin.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	@RequestMapping("/admin")
	public String toLogin(@ModelAttribute Admin admin) {
		return "admin/login";
	}
	@RequestMapping("/admin/login")
	public String login(@ModelAttribute Admin admin, Model model, HttpSession session) {
		return adminService.login(admin, model, session);
	}
	@RequestMapping("/exit")
	public String exit(@ModelAttribute Admin admin,HttpSession session) {
		session.invalidate();
		return "admin/login";
	}
}
