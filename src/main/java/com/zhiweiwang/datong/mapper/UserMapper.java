package com.zhiweiwang.datong.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.zhiweiwang.datong.model.User;

public interface UserMapper {

	@Insert("insert into dt_users(username, passwd, email) values (#{username},#{passwd},#{email})")
	void insertRow(@Param("username") String username, @Param("passwd") String passwd, @Param("email") String email);

//	@Insert("insert into dt_users(username, passwd, email) values (#{username},#{passwd},#{email})")
//	void insertRow(Map<String, Object> map);
	
	@Select("select * FROM dt_users WHERE username = #{username}")
	User get_user(String username);

	@Select("select * FROM dt_users WHERE id = #{id}")
	User get_userById(int id);

	@Update("update dt_users set passwd=#{passwd} where username=#{username}")
	void updatPasswd(@Param("username") String username, @Param("passwd") String passwd);
	
	@Update("update dt_users set role=#{role} where username=#{username}")
	void updatRole(@Param("username") String username, @Param("role") String role);
}