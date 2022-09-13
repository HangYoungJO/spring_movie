package com.spring_movie01.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring_movie01.dto.MovieDto;
import com.spring_movie01.dto.SchedulesDto;
import com.spring_movie01.dto.TheatersDto;

public interface AdminDao {

	ArrayList<MovieDto> selectAdminMovieList();

	int updateMvState(@Param("mvcode") String mvcode, @Param("mvstate") int mvstate);

	MovieDto selectMvInfo(String mvcode);
	
	ArrayList<TheatersDto> selectAdminTheaterList();

	int updateThState(@Param("thcode") String thcode, @Param("thstate") int thstate);

	TheatersDto selectThInfo(String thcode);

	int updateThInfo(TheatersDto theater);

	ArrayList<SchedulesDto> selectadminSchedulesList();

	void deleteSchedules(String scroom);

	ArrayList<MovieDto> selectReserveMvList();

	

	

	

	

}
