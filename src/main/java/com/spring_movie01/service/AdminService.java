package com.spring_movie01.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.spring_movie01.dao.AdminDao;
import com.spring_movie01.dto.MovieDto;
import com.spring_movie01.dto.SchedulesDto;
import com.spring_movie01.dto.TheatersDto;




@Service
public class AdminService {

	@Autowired
	private AdminDao amdao;
	
	public ModelAndView AdminMovieList() {
		System.out.println("AdminService.AdminMovieList() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<MovieDto> adminMovieList = amdao.selectAdminMovieList();
		mav.addObject("mvList", adminMovieList);
		mav.setViewName("admin/AdminMovieList");
		return mav;
	}

	public ModelAndView adminModifyMvState1(String mvcode, int mvstate) {
		System.out.println("AdminService.adminMovieList1() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("mvcode : " + mvcode);
		System.out.println("mvstate : " + mvstate);
		
		int updateResult = amdao.updateMvState(mvcode, mvstate);
		System.out.println("updateResult : " + updateResult);
		
		mav.setViewName("redirect:/adminMovieList");
		return mav;
	}

	public String adminModifyMvState2(String mvcode, int mvstate) {
		System.out.println("AdminService.adminMovieList2() 호출");
		System.out.println("mvcode : " + mvcode);
		System.out.println("mvstate : " + mvstate);
		
		int updateResult = amdao.updateMvState(mvcode, mvstate);
		System.out.println("updateResult : " + updateResult);
		return updateResult+"";
	}

	public ModelAndView adminModifyMv(MovieDto movie) {
		System.out.println("AdminService.adminModifyMv() 호출");
		ModelAndView mav = new ModelAndView();
		
		System.out.println("수정할 영화 정보");
		System.out.println(movie);
		
		mav.setViewName("redirect:/adminMovieList");
		return mav;
	}

	public String getAdminMvInfo(String mvcode) {
		System.out.println("AdminService.getAdminMvInfo() 호출");
		MovieDto movie = amdao.selectMvInfo(mvcode);
		Gson gson = new Gson();
		String mvInfo_Json = gson.toJson(movie);
		System.out.println(mvInfo_Json);
		return mvInfo_Json;
	}

	public ModelAndView AdminTheaterList() {
		System.out.println("AdminService.AdminMovieList() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<TheatersDto> adminTheaterList = amdao.selectAdminTheaterList();
		mav.addObject("thList", adminTheaterList);
		mav.setViewName("admin/AdminTheaterList");
		return mav;
	}

	public String adminModifyThState(String thcode, int thstate) {
		System.out.println("AdminService.adminModifyThState() 호출");
		System.out.println("thcode : " + thcode);
		System.out.println("thstate : " + thstate);
		
		int updateResult = amdao.updateThState(thcode, thstate);
		System.out.println("updateResult : " + updateResult);
		return updateResult+"";
	}

	public String adminGetThInfo(String thcode) {
		System.out.println("AdminService.adminGetThInfo() 호출");
		System.out.println("조회할 극장 코드 : " + thcode);
		
		TheatersDto theater = amdao.selectThInfo(thcode);
		
		Gson gson = new Gson();
		String theater_json = gson.toJson(theater);
		System.out.println(theater_json);
		return theater_json;		
	}

	public String adminModifyThInfo(TheatersDto theater) {
		System.out.println("AdminService.adminModifyThInfo() 호출");
		System.out.println("수정할 극장정보");
		System.out.println(theater);
		
		int updateResult = amdao.updateThInfo(theater);
		System.out.println("updateResult : " + updateResult);
		return updateResult+"";
	}

	public ModelAndView adminSchedulesPage() {
		System.out.println("AdminService.adminSchedulesPage() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<SchedulesDto> adminSchedulesList = amdao.selectadminSchedulesList();
		mav.addObject("scList", adminSchedulesList);
		mav.setViewName("admin/AdminSchedulesPage");
		return mav;
	}

	public ModelAndView SchedulesCancel(RedirectAttributes ra, String scroom) {
			System.out.println("AdminService.SchedulesCancel() 호출");
			ModelAndView mav = new ModelAndView();
			
			System.out.println("취소할 상영관코드 : " + scroom);
			
			amdao.deleteSchedules(scroom);
			
			ra.addFlashAttribute("msg", "상영스케줄이 삭제되었습니다.");
			
			mav.setViewName("redirect:/adminAddSchedules");
			
			return mav;
		
	}

	public ModelAndView adminAddSchedules() {
		System.out.println("AdminService.adminAddSchedules() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<MovieDto> mvList = amdao.selectReserveMvList();
		mav.addObject("mvList", mvList);
		mav.setViewName("admin/AdminAddSchedules");
		return mav;
	}
	
	

	

	

	

	

	

}
