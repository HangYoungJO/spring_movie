package com.spring_movie01.dto;

import lombok.Data;

@Data
public class MovieDto {

	
	private String mvcode;   //영화코드
	private String mvname;   //영화이름
	private String mvpd;     //영화감독
	private String mvactor;  //배우
	private String mvgenre;  //장르
	private String mvage;    //관람연령
	private String mvtime;   //시간
	private String mvopen;   //개봉일
	private String mvposter; //포스터
	
	private String thcode;
	private String thname;
	private String thaddr;
	private String thtel;
	
	private String scroom;
	private String scdate;
	private String scthcode;
	private String scmvcode;
	
	private int mvstate; // 영화상태 1 : 사용 0: 중단
	
	private int goodlike;
	private int badlike;
	
	private double reservationRatio;
	
	
}
