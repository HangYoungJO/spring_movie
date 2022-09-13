package com.spring_movie01.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_movie01.dto.MovieDto;
import com.spring_movie01.dto.TheatersDto;
import com.spring_movie01.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService amsvc;
	
	@RequestMapping(value = "/adminMovieList")
	public ModelAndView adminMovieList() {
		System.out.println("관리자 영화관리목록 요청");
		ModelAndView mav = amsvc.AdminMovieList();
		
		return mav;
	}
	
	@RequestMapping(value = "/adminModifyMvState1")
	public ModelAndView adminModifyMvState1(String mvcode, int mvstate) {
		System.out.println("관리자 영화 상태 변경 요청1");
		ModelAndView mav = amsvc.adminModifyMvState1(mvcode, mvstate);
		
		return mav;
	}
	
	
	@RequestMapping(value = "/adminModifyMvState2")
	public @ResponseBody String adminModifyMvState2(String mvcode, int mvstate) {
		System.out.println("관리자 영화 상태 변경 요청2");	
		String updateResult = amsvc.adminModifyMvState2(mvcode, mvstate);
		
		return updateResult;
	}
	
	@RequestMapping(value = "/adminModifyMv")
	public ModelAndView adminModifyMovie(MovieDto movie) {
		System.out.println("관리자 영화 정보 수정 요청");
		
		ModelAndView mav = amsvc.adminModifyMv(movie);
		return mav;
		
	}
	
	@RequestMapping(value = "/adminGetMvInfo")
	public @ResponseBody String adminGetMvInfo(String mvcode) {
		System.out.println("관리자 영화정보 조회 요청");
		String mvInfo = amsvc.getAdminMvInfo(mvcode);
		
		return mvInfo;
	}
	
	@RequestMapping(value = "/adminTheaterList")
	public ModelAndView adminTheaterList() {
		System.out.println("관리자 극장 목록 요청");
		ModelAndView mav = amsvc.AdminTheaterList();
		
		return mav;
	}
	
	@RequestMapping(value = "/adminModifyThState")
	public @ResponseBody String adminModifyThState(String thcode, int thstate) {
		System.out.println("관리자 극장 상태 변경 요청");
		String updateResult = amsvc.adminModifyThState(thcode, thstate);
		
		return updateResult;
	}
	
	@RequestMapping(value = "/adminGetThInfo")
	public @ResponseBody String adminGetThInfo(String thcode) {
		System.out.println("관리자 극장 정보 조회 요청");
		
		String thInfo = amsvc.adminGetThInfo(thcode);
		return thInfo;
	}
	
	@RequestMapping(value = "/adminModifyThInfo")
	public @ResponseBody String adminModifyThInfo(TheatersDto theater) {
		System.out.println("관리자 극장 상세정보 수정 요청");
		
		String result = amsvc.adminModifyThInfo(theater);
		return result;
	}
	
	@RequestMapping(value = "/adminSchedulesPage")
	public ModelAndView adminSchedulesPage() {
		System.out.println("관리자 영화 스케줄등록 페이지이동 요청");
		
		ModelAndView mav = amsvc.adminSchedulesPage();
		return mav;
	}
	
	@RequestMapping(value="/SchedulesCancel")
	public ModelAndView SchedulesCancel(RedirectAttributes ra, String scroom) {
		System.out.println("예매내역 삭제 요청");
		ModelAndView mav = amsvc.SchedulesCancel(ra, scroom);
		return mav;
	}
	
	@RequestMapping(value="/adminAddSchedules")
	public ModelAndView adminAddSchedules() {
		System.out.println("관리자 영화 스케줄 추가 요청");
		ModelAndView mav = amsvc.adminAddSchedules();
		return mav;
	}
	
	
}
