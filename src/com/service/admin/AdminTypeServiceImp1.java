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

	//ת�������Ʒҳ
	@Override
	public String toAddType(Model model) {
		model.addAttribute("allTypes", adminTypeDao.selectGoodsType());
		return "admin/addType";
	}

	//�����Ʒ
	@Override
	public String addType(String typename, Model model, HttpSession session) {
		adminTypeDao.addType(typename);
		session.setAttribute("goodsType", adminTypeDao.selectGoodsType());
		return "forward:/adminType/toAddType";
	}

	//ת��ɾ����Ʒҳ��
	@Override
	public String toDeleteType(Model model) {
		model.addAttribute("allTypes", adminTypeDao.selectGoodsType());
		return "admin/deleteType";
	}

	//ɾ����Ʒ
	@Override
	public String deleteType(Integer id, Model model) {
		//�����й���
		if(adminTypeDao.selectGoodsByType(id).size() > 0) {
			model.addAttribute("msg", "ɾ��ʧ�ܣ�");
			return "forward:/adminType/toDeleteType";
		}
		if(adminTypeDao.deleteType(id) > 0) 
			model.addAttribute("msg", "ɾ���ɹ���");
		//ת����ɾ��ҳ��
		return "forward:/adminType/toDeleteType";
	}
	
}
