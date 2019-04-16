package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.Consumer;

@Repository("userDao")
@Mapper
public interface UserDao {
	public int register(Consumer buser);
	public List<Consumer> login(Consumer buser);
}
