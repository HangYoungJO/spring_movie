package com.spring_movie01.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberDto {

	private String mid; 
	private String mpw;
	private String mname; 
	private String mbirth; 
	private String memail; 
	private String maddress; 
	private String mpostcode;
	private String maddr;
	private String mdetailAddr;
	private String mextraAddr;
	private String mprofile; // 프로필파일 이름
	private MultipartFile mfile; // 프로필 파일
	private int mstate;
	
	
	
}
