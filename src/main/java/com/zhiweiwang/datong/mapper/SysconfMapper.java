package com.zhiweiwang.datong.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface SysconfMapper {

	@Select("select confvalue from sysconf where confname=#{confname}")
	public String getValue(@Param("confname") String confname);
	
	@Update("update sysconf set confvalue=#{confvalue} where confname=#{confname}")
	public void setValue(@Param("confname") String confname, @Param("confvalue") String confvalue);

}
