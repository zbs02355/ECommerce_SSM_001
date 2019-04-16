package com.service.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.AdminDao;
import com.dao.AdminTypeDao;
import com.po.Admin;

@Service("adminService")
@Transactional
public class AdminServiceImp1 implements AdminService{
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private AdminTypeDao adminTypeDao;
	@Override
	public String login(Admin admin, Model model, HttpSession session) {
		if(adminDao.login(admin) != null && adminDao.login(admin).size() > 0) {
			session.setAttribute("admin", admin);
			//�����Ʒ���޸���Ʒҳ��ʹ��
			session.setAttribute("GoodsType", adminTypeDao.selectGoodsType());
			return "admin/main";
		}
		model.addAttribute("msg", "�û������������");
		return "admin/login";
	}
}