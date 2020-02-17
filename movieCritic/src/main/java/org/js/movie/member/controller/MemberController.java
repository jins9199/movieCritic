package org.js.movie.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.js.movie.member.dao.CustomService;
import org.js.movie.member.domain.CustomMember;
import org.js.movie.member.domain.MemberVO;
import org.js.movie.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {

	//private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService service;
	
	@Autowired
	CustomService customService;
	
	//myPage Get
	@RequestMapping(value="/my_page" , method=RequestMethod.GET)
	public String getMyPage() {
		
		log.info("myPage입니다.");
		return "my_page";
	}
	
	
	
	
	//sign_up Get
	@RequestMapping(value="/sign_up" , method=RequestMethod.GET)
	public String getSignUp() {
		
		log.info("sign_up.do");
		return "member/sign_up";
	}
	
	//sign_up Post
	@RequestMapping(value="/sign_up" , method=RequestMethod.POST)
	public String postSignUp(MemberVO vo) {
		log.info("############ 가입처리");
		log.info("############vo: " + vo);
		
		service.insert(vo);
		log.info("############ 가입완료 잠시후 로그인");
		
		log.info("############ 로그인 성공");

		return "redirect:/";
	}
	
//	//login Get
//	@RequestMapping(value="/login.do", method=RequestMethod.GET)
//	public String getLogin() {
//		return "member/login";
//	}
//	
//	//login Post
//	@RequestMapping(value="/login.do" , method=RequestMethod.POST)
//	public String postLogin() {
//		
//		
//		return "redirect:/";
//	}
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String getlogin() {
		return "member/login";
	}
	
	@RequestMapping(value="/loginProc", method = RequestMethod.POST)
	public String login(String memberId, HttpServletRequest req) {
		log.info("#####################post login");
		
		HttpSession session = req.getSession();
		
		CustomMember cMember = (CustomMember) customService.loadUserByUsername(memberId);
		
		if(cMember == null) {
			session.setAttribute("member", null);
		} else
			session.setAttribute("member", cMember);
		return "redirect:/";
		
	}
	
}

