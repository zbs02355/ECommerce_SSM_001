package com.service.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.AdminTypeDao;

@Service("adminTypeService")
@Transactional
public class AdminTypeServiceImp1 implements AdminTypeService{
	@Autowired
	private AdminTypeDao adminTypeDao;

	//转到添加商品页
	@Override
	public String toAddType(Model model) {
		model.addAttribute("allTypes", adminTypeDao.selectGoodsType());
		return "admin/addType";
	}

	//添加商品
	@Override
	public String addType(String typename, Model model, HttpSession session) {
		adminTypeDao.addType(typename);
		session.setAttribute("goodsType", adminTypeDao.selectGoodsType());
		return "forward:/adminType/toAddType";
	}

	//转到删除商品页面
	@Override
	public String toDeleteType(Model model) {
		model.addAttribute("allTypes", adminTypeDao.selectGoodsType());
		return "admin/deleteType";
	}

	//删除商品
	@Override
	public String deleteType(Integer id, Model model) {
		//类型有关联
		if(adminTypeDao.selectGoodsByType(id).size() > 0) {
			model.addAttribute("msg", "删除失败！");
			return "forward:/adminType/toDeleteType";
		}
		if(adminTypeDao.deleteType(id) > 0) 
			model.addAttribute("msg", "删除成功！");
		//转发到删除页面
		return "forward:/adminType/toDeleteType";
	}
	
}
