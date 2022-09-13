package com.spring_movie01.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_movie01.dao.MemberDao;
import com.spring_movie01.dto.MemberDto;

@Service
public class MemberService {

	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private HttpSession session;

	private String savePath = "D:\\sts-4.14.1.RELEASE\\spring_movie01\\src\\main\\webapp\\resources\\mprofileUpLoad";

	public ModelAndView memberJoin(MemberDto member) throws IllegalStateException, IOException {
		System.out.println("MemberService.memberJoin()");
		ModelAndView mav = new ModelAndView();
		MultipartFile mfile = member.getMfile();
		String mprofile = "";

		if (!mfile.isEmpty()) {
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			// 1.파일명 생성
			mprofile = uuid.toString() + "_" + mfile.getOriginalFilename();
			// 포로필 이미지 파일 저장
			mfile.transferTo(new File(savePath, mprofile));
		}
		System.out.println("mprofile : " + mprofile);

		member.setMprofile(mprofile);

		member.setMaddress(member.getMpostcode() + "_" + member.getMaddr() + "_" + member.getMdetailAddr() + "_"
				+ member.getMextraAddr());

		// 회원가입 처리 (dao - insert문)
		int joinResult = mdao.insertMember(member);
		System.out.println(joinResult);
		mav.setViewName("redirect:/movieMain");
		return mav;
	}
	// 아이디 중복처리 
	public String memberIdCheck(String inputId) {
		System.out.println("MemberService.memberIdCheck() 호출");

		String idCheckResult = mdao.selectCheckId(inputId);
		System.out.println(idCheckResult);
		if (idCheckResult == null) {
			return "OK";
		} else {
			return "NO";
		}
	}
	public ModelAndView memberLogin(String userId, String userPw, RedirectAttributes ra) {
		System.out.println("MemberService.memberLogin() 호출");
		System.out.println("입력한 아이디 : " + userId);
		System.out.println("입력한 비밀번호 : " + userPw);
		
		ModelAndView mav = new ModelAndView();
		
		MemberDto loginResult = mdao.selectMemberLogin(userId, userPw);
		System.out.println(loginResult);
		
		if( loginResult != null ) {
			session.setAttribute("loginId", loginResult.getMid());
			session.setAttribute("loginProfile", loginResult.getMprofile());
			mav.setViewName("redirect:/movieMain");
			System.out.println("로그인성공");
		} else {
			ra.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치하지않습니다!");
			mav.setViewName("redirect:/MemberLoginForm");
		}
		return mav;
	}
	public ModelAndView memberLogout(RedirectAttributes ra) {
		System.out.println("MemberService.memberLogout() 호출");
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		ra.addFlashAttribute("msg", "로그아웃되었습니다.");
		mav.setViewName("redirect:/movieMain");
		return mav;
	}
	public ModelAndView memberInfo() {
		System.out.println("MemberService.memberInfo() 호출");
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("로그인된 아이디 : " + loginId);
		MemberDto memberInfo = mdao.selectMemberInfo(loginId);
		ModelAndView mav = new ModelAndView();
		// 주소
		String maddress = memberInfo.getMaddress();
		String[] maddress_arr = maddress.split("_");
		
	if( maddress_arr.length >= 4 ) {	
		memberInfo.setMpostcode(maddress_arr[0]);
		memberInfo.setMaddr(maddress_arr[1]);
		memberInfo.setMdetailAddr(maddress_arr[2]);
		memberInfo.setMextraAddr(maddress_arr[3]);
	}
		mav.addObject("memberInfo", memberInfo);
		mav.setViewName("Member/MemberInfo");
		return mav;
	}
	public ModelAndView memberkakaoLogin(MemberDto member, RedirectAttributes ra) {
		System.out.println("MemberService.memberkakaoLogin() 호출");
		ModelAndView mav = new ModelAndView();
		MemberDto kakaoMember = mdao.selectMemberkakaoLogin(member.getMid());
		System.out.println(kakaoMember);
		if(kakaoMember != null) {
			session.setAttribute("loginId", kakaoMember.getMid());
			session.setAttribute("loginProfile", kakaoMember.getMprofile());
			ra.addFlashAttribute("msg", "카카오계정으로 로그인 되었습니다.");
			mav.setViewName("redirect:/movieMain");
		} else {
			member.setMpw("1234");
			mdao.insertMemberkakao(member);	
			ra.addFlashAttribute("msg", "회원정보가 등록되었습니다, 다시 로그인해주세요!");
			mav.setViewName("redirect:/MemberLoginForm");
		}
		return mav;
	}
}
