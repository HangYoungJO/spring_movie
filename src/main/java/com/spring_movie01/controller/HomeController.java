package com.spring_movie01.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_movie01.dao.MemberDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Autowired
	MemberDao mdao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		

		return "Main";
	}
	
	@RequestMapping(value = "/movieMain", method = RequestMethod.GET)
	public String movieMain() {
		

		return "MovieMain";
	
	}
	
	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public String adminMain(String inputPw, RedirectAttributes ra) {
		String pw = "1111";
		if(pw.equals(inputPw)) {
			return "AdminMain";
		} else {
			ra.addFlashAttribute("msg", "관리자 비밀번호가 일치하지않습니다.");
			return "redirect:/";
		}
		
	}
	@RequestMapping(value = "/adminMainPage")
	public String adminMainPage() {
		
		return "AdminMain";
	}
}
	
