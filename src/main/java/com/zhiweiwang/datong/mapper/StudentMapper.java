package com.zhiweiwang.datong.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface StudentMapper {

	@Insert("insert into dt_students(id,username,name,pid,sex,policy,birthyear,birthmonth,birthday,healthy,city,address,addcode,phone,cell,gradeschool,gradesection,number,daddy,daddyname,daddyjob,daddyphone,mummy,mummyname,mummyjob,mummyphone,prices,history,reason,yuwem1,yuwem2,shuxue1,shuxue2,yingyu1,yingyu2,wuli1,wuli2,huaxue1,huaxue2,zongfen1,zongfen2,paimin1,paimin2,honors) values(#{id},#{username},#{name},#{pid},#{sex},#{policy},#{birthyear},#{birthmonth},#{birthday},#{healthy},#{city},#{address},#{addcode},#{phone},#{cell},#{gradeschool},#{gradesection},#{number},#{daddy},#{daddyname},#{daddyjob},#{daddyphone},#{mummy},#{mummyname},#{mummyjob},#{mummyphone},#{prices},#{history},#{reason},#{yuwem1},#{yuwem2},#{shuxue1},#{shuxue2},#{yingyu1},#{yingyu2},#{wuli1},#{wuli2},#{huaxue1},#{huaxue2},#{zongfen1},#{zongfen2},#{paimin1},#{paimin2},#{honors})")
	void insertRow(Map<String, Object> map);

	@Update("update dt_students set name=#{name},pid=#{pid},sex=#{sex},policy=#{policy},birthyear=#{birthyear},birthmonth=#{birthmonth},birthday=#{birthday},healthy=#{healthy},city=#{city},address=#{address},addcode=#{addcode},phone=#{phone},cell=#{cell},gradeschool=#{gradeschool},gradesection=#{gradesection},number=#{number},daddy=#{daddy},daddyname=#{daddyname},daddyjob=#{daddyjob},daddyphone=#{daddyphone},mummy=#{mummy},mummyname=#{mummyname},mummyjob=#{mummyjob},mummyphone=#{mummyphone},prices=#{prices},history=#{history},reason=#{reason},yuwem1=#{yuwem1},yuwem2=#{yuwem2},shuxue1=#{shuxue1},shuxue2=#{shuxue2},yingyu1=#{yingyu1},yingyu2=#{yingyu2},wuli1=#{wuli1},wuli2=#{wuli2},huaxue1=#{huaxue1},huaxue2=#{huaxue2},zongfen1=#{zongfen1},zongfen2=#{zongfen2},paimin1=#{paimin1},paimin2=#{paimin2},honors=#{honors} where id=#{id}")
	void update(Map<String, Object> map);

	@Update("update dt_students set sts=#{sts},role=#{role},interview=#{interview} where id=#{id}")
	void updateSts(Map<String, Object> map);
	
	@Update("update dt_students set feedback='yes' where id=#{id}")
	void updateFeedback(@Param("id") int id);

	
	@Delete("delete from dt_students where id = #{id}")
	void deleteStudent(@Param("id") int id);

	@Select("select * FROM dt_students WHERE id = #{id}")
	Map<?, ?> getStudent(int id);

//  PostgreSQL 不支持 Limit #,# 
//	@Select("select * FROM dt_students limit #{start},#{limit}  ")
//	List<Map<?,?>> getStudentsLimit(@Param("start") int start, @Param("limit") int limit);
//
//	@Select("select * FROM dt_students where sts=#{sts} limit #{start},#{limit}  ")
//	List<Map<?, ?>> getStudentsBySts(@Param("start")int start,@Param("limit") int limit,@Param("sts") String sts);

	@Select("select * FROM dt_students order by ${order} limit #{limit} offset #{start}")
	List<Map<?,?>> getStudentsLimit(@Param("start") int start, @Param("limit") int limit, @Param("order") String order);

	@Select("select * FROM dt_students where sts=#{sts} order by ${order}  limit #{limit} offset #{start}")
	List<Map<?, ?>> getStudentsBySts(@Param("start")int start,@Param("limit") int limit,@Param("sts") String sts, @Param("order") String order);
	
	@Select("select sts,count(*) as cnt from dt_students group by sts")
	List<Map<String, ?>> getCounting();
	
	@Select("select interview,count(*) as cnt from dt_students where sts='sts_pass' group by interview")
	List<Map<String, ?>> getInterviewing();
	
	@Select("select id,nid,name,pid,sex,gradeschool,sts,role,interview,feedback FROM dt_students where sts='sts_pass' order by nid")
	List<Map<?, ?>> getPassedStudents();
	
	@Select("select id,nid,name,pid,sex,gradeschool,sts,role,interview,feedback FROM dt_students where sts='sts_pass' and interview=#{interview} order by interview,nid")
	List<Map<?, ?>> getPassedStudentsByInterview(@Param("interview") String interview);
	
	@Select("select * FROM dt_students order by nid")
	List<Map<String, ?>> getAllStudents();
	
}