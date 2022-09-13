package com.spring_movie01.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.spring_movie01.dto.MemberDto;
import com.spring_movie01.service.MemberService;

@Controller
public class MemberController {
	
	private ModelAndView mav;
	
	@Autowired
	private MemberService msvc;
	
	@RequestMapping(value="/MemberJoinForm")
	public String MemberJoinForm() {
		
		System.out.println("회원가입 페이지 이동요청");
		return "Member/MemberJoinForm";
	}
	
	@RequestMapping(value="/memberJoin")
	public ModelAndView memberJoin(MemberDto member) throws IllegalStateException, IOException {
		System.out.println("회원가입 요청");
		System.out.println(member);
		// 카카오 아이디 이메일 닉네임 프로필 로그인처리
		
		mav = msvc.memberJoin(member);
		return mav;
	}
	@RequestMapping(value="/memberIdCheck")
	public @ResponseBody String memberIdCheck(String inputId) {
		System.out.println("아이디 중복 확인 요청");
		System.out.println("입력한 아이디 : " + inputId);
		String idCheckResult = msvc.memberIdCheck(inputId);
		return idCheckResult; 
	}
	@RequestMapping(value="/MemberLoginForm")
	public String memberLoginForm() {
		System.out.println("로그인 페이지 이동요청");
		
		return "Member/MemberLoginForm";
	}
	@RequestMapping(value="/memberLogin")
	public ModelAndView memberLogin (String userId, String userPw, RedirectAttributes ra) {
		System.out.println("로그인 요청");
		mav = msvc.memberLogin(userId, userPw, ra);
		return mav;
	}
	@RequestMapping(value="/MemberLogout")
	public ModelAndView memberLogout(RedirectAttributes ra) {
		System.out.println("로그아웃 요청");
		
		mav = msvc.memberLogout(ra);
		return mav;
	}
	
	@RequestMapping(value="/MemberInfo")
	public ModelAndView memberInfo() {
		System.out.println("내정보 조회페이지 이동요청");	
		
		mav = msvc.memberInfo();
		return mav;
	}
	
	@RequestMapping(value="/memberkakaoLogin")
	public ModelAndView memberkakaoLogin(MemberDto member, RedirectAttributes ra) {
		System.out.println("카카오톡 로그인 요청");
		System.out.println(member);
		ModelAndView mav = msvc.memberkakaoLogin(member, ra);
		return mav;
	}
	
}
