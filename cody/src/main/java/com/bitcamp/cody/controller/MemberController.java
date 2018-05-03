package com.bitcamp.cody.controller;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.service.MemberListService;
import com.bitcamp.cody.service.MemberService;


@Controller
public class MemberController {
	
	
	@Autowired
	private MemberService service;

	@Autowired
	private MemberListService listservice;
	
	
	
	
	
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String loginForm() {
		return "member/loginForm";
	}

	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String login(@RequestParam(value = "member_id", defaultValue = "0") String id,
			            @RequestParam(value = "member_pw", required = false) String pw, HttpSession session) {

		System.out.println(id);
		System.out.println(pw);

		// 정상적으로 로그인 처리가 되면 리다이렉트 처리 : mypage로 이동
		String view = "redirect:mypage"; // /member/mypage

		MemberDto member = service.loginChk(id, pw);
		// null / Member 객체

		if (member == null) {
			return "member/loginFail";
			
		}

		member.setMember_pw("");

		// 세션에 데이터 저장
		session.setAttribute("loginInfo", member);

/*System.out.println(session.getAttribute("loginInfo"));
		
		notifier.sendMail(member.getMember_id(), "로그인이 성공적으로 처리되었습니다.");*/

		return view;
	}
	
	
	

	@RequestMapping(value = "/member/modifyForm", method = RequestMethod.GET)
	public String modifyMember(Model model, @RequestParam("id") String id) {

		MemberDto member = listservice.getlistView(id);

		model.addAttribute("member", member);

		return "member/modifyForm";
	}

	@RequestMapping(value = "/member/modifyForm", method = RequestMethod.POST)
	public String modifyOk(MemberDto member, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {

		int resultCnt = service.memberModify(member, request);

		String msg = "정보수정 완료";

		if (resultCnt == 0)
			msg = "정보수정 실패";

		model.addAttribute("msg", msg);

		return "member/modify";
	}
	
	
	
	
	@RequestMapping("/member/mypage")
	public String mypage(HttpSession session, Model model) {
		
		MemberDto member = (MemberDto) session.getAttribute("loginInfo");
		
		model.addAttribute("member", member);
		
		return "member/mypage";
		
	}
	
	
	// 같은 type을 찾아서 주입
		
		
		@RequestMapping(value = "/member/memberReg", method=RequestMethod.GET)
		public String memberRegForm() {
			return "member/memberRegForm";
		}
		
		@RequestMapping(value = "/member/memberReg", method=RequestMethod.POST)
		public String memberReg(MemberDto member, Model model, HttpServletRequest request) 
				throws IllegalStateException, IOException {
			// 서비스에  회원 데이터 저장 요청
			// 결과 : 1 / 0
			// model 에 저장
			System.out.println(member);
			
			
			String msg = "정상적으로 처리되었습니다.";
			
			
			
			int resultCnt = service.memberReg(member, request);
			
			if(resultCnt == 0)
				msg = "가입 처리가 되지 않았습니다. 담당자에게 문의 해주세요.";		
			
			
			// 응답페이지에 데이터 전달
			model.addAttribute("msg", msg);
			
			
			return "member/memberReg";
		}
		
		@ExceptionHandler(IOException.class)
		public String ex1(IOException e) {
			return "error/ex1";
		}
		
		@ExceptionHandler(IllegalStateException.class)
		public String ex2(IllegalStateException e) {
			return "error/ex2";
		}
		
	
	   
		
		@RequestMapping(value="/member/idchk", method=RequestMethod.POST)
		@ResponseBody
		public String idChk(@RequestParam("userid") String id) {
			
			// Y : 사용 가능
			// N : 사용 불가
			return service.idChk(id);
		}
	
	
		
		
		
		@RequestMapping("/member/memberDelete")
		public String deleteMember(Model model, @RequestParam("id") String id) {
			
			int resultCnt = service.deleteMember(id);
			
			String msg = "정보삭제 완료";

			if (resultCnt == 0)
				msg = "정보삭제 실패";

			model.addAttribute("msg", msg);
			
			return "member/memberDelete";
			
					
					
		}
		
		
		
		
		
		
		
		
		
		
		
		
		

}

