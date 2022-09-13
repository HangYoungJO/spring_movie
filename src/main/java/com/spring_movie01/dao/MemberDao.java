package com.spring_movie01.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.spring_movie01.dto.MemberDto;

public interface MemberDao {

	
	@Insert("INSERT INTO SPMEMBERS(MID, MPW, MNAME, MBIRTH, MEMAIL, MADDRESS, MPROFILE, MSTATE) "
			+ "VALUES(#{mid}, #{mpw}, #{mname}, TO_DATE(#{mbirth}, 'YYYY-MM-DD'), #{memail}, #{maddress}, #{mprofile}, 0 )")
	int insertMember(MemberDto member);

	@Select("SELECT MID FROM SPMEMBERS WHERE MID = #{inputId}")
	String selectCheckId(String inputId);

	@Select("SELECT MID, MPROFILE FROM SPMEMBERS WHERE MID = #{userId} AND MPW = #{userPw}")
	MemberDto selectMemberLogin(@Param("userId") String userId,  @Param("userPw") String userPw);

	@Select("SELECT MID, MPW, MNAME, TO_CHAR(MBIRTH, 'YYYY-MM-DD')AS MBIRTH, MEMAIL, MADDRESS FROM SPMEMBERS WHERE MID = #{loginId}")
	MemberDto selectMemberInfo(String loginId);

	@Select("SELECT MID, MPROFILE FROM SPMEMBERS WHERE MID = #{mid}")
	MemberDto selectMemberkakaoLogin(String mid);

	@Insert("INSERT INTO SPMEMBERS(MID, MPW, MNAME, MEMAIL, MPROFILE, MSTATE) "
			+ "VALUES(#{mid}, #{mpw}, #{mname}, #{memail}, #{mprofile}, 2 )")
	void insertMemberkakao(MemberDto member);

	
	
	

}
