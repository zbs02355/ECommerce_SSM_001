package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.Consumer;

@Repository("adminUserDao")
@Mapper
public interface AdminUserDao {
	public List<Consumer> userInfo();
	public int deleteuserManager(Integer id);
}
