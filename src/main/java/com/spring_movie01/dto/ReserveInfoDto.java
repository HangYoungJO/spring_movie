package com.spring_movie01.dto;

import lombok.Data;

@Data
public class ReserveInfoDto {
	
	private String mvcode;
	private String mvname;
	private String mvposter;
	
	private String thname;
	private String scroom;
	private String scdate;
	
	private String recode; 
	private String reamount;
	
	private ReviewDto review; // 관람평 정보
}
