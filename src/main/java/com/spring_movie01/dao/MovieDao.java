package com.spring_movie01.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.spring_movie01.dto.MovieDto;
import com.spring_movie01.dto.ReservationDto;
import com.spring_movie01.dto.ReserveInfoDto;
import com.spring_movie01.dto.ReviewDto;
import com.spring_movie01.dto.SchedulesDto;
import com.spring_movie01.dto.TheatersDto;

public interface MovieDao {

int selectMvCheck(@Param("mvname") String mvname, @Param("mvopen") String mvopen);
	
	@Select("SELECT MAX(MVCODE) FROM MOVIES ")
	String selectMaxMvCode();
	
	@Insert("INSERT INTO MOVIES(MVCODE, MVNAME, MVPD, MVACTOR, MVGENRE, MVAGE, MVTIME, MVOPEN, MVPOSTER) "
			+ "VALUES(#{mvcode}, #{mvname}, #{mvpd}, #{mvactor}, #{mvgenre}, #{mvage}, #{mvtime}, TO_DATE(#{mvopen},'YYYY.MM.DD'), #{mvposter} )")
	void insertMovieInfo(MovieDto movieDto);
	
	ArrayList<MovieDto> selectMovieList();

	MovieDto selectMovieInfo(String mvcode);

	ArrayList<MovieDto> selectReserveMvList();

	ArrayList<TheatersDto> selectReserveThList(String mvcode);

	ArrayList<SchedulesDto> selectReserveScList(@Param("mvcode") String mvcode, @Param("thcode") String thcode);

	ArrayList<SchedulesDto> selectReserveScrtList(@Param("mvcode") String mvcode, @Param("thcode") String thcode, @Param("scdate") String scdate);

	String getMaxRecode();

	void insertReservationInfo(ReservationDto reInfo);
	
	ArrayList<ReserveInfoDto> selectReservationList(String remid);
	
	ReserveInfoDto selectResevationInfo(String recode);

	void deleteReservation(String recode);

	void insertReview(ReviewDto review);

	String selectReviewWriteCheck(String recode);

	ReviewDto selectReviewInfo(String recode);

	ArrayList<ReviewDto> selectReviewList(String mvcode);

	int selectCountReservation();
	
	int selectMvCountReservation(String mvcode);

	ArrayList<MovieDto> selectMovieSearch(@Param("searchText") String searchText, @Param("checkWhere") String checkWhere);

	

	
	

	

	

	

	

	

	

	


}
