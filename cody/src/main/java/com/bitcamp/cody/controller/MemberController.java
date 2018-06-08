package com.bitcamp.cody.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.service.MemberListService;
import com.bitcamp.cody.service.MemberService;



@Controller
public class MemberController {
	
	
	@Autowired
	private MemberService service;

	
	
	
	
	/*회원 로그인*/
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		return "member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam(value = "member_id", defaultValue = "0") String id,
			            @RequestParam(value = "member_pw", required = false) String pw, HttpSession session, HttpServletRequest request) {

		 String referer = request.getHeader("Referer");
		
		System.out.println(id);
		System.out.println(pw);

		

		MemberDto member = service.loginChk(id, pw);
		// null / Member 객체

		if (member == null) {
			return "member/loginFail";
			
		}else {

		member.setMember_pw("");

		// 세션에 데이터 저장
		session.setAttribute("loginInfo", member);
		
		System.out.println(session.getAttribute("loginInfo"));
		
		/*notifier.sendMail(member.getMember_id(), "로그인이 성공적으로 처리되었습니다.");*/

		
		}
		return "redirect:"+ referer;
	}
	
	
	
	
	
	
	
	
	
	
	/*회원정보 수정*/

  /* @RequestMapping(value = "/member/modify", method = RequestMethod.GET)
	public String modifyMember(Model model, @RequestParam("id") String id) {

		MemberDto member = listservice.getlistView(id);

		model.addAttribute("member", member);

		return "member/modify";
	}*/
   
	@RequestMapping(value = "/member/modify", method = RequestMethod.POST)
	public String modifyOk(MemberDto member, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {

		
		int resultCnt = service.memberModify(member, request);

		String msg = "정보수정 완료";

		if (resultCnt == 0)
			msg = "정보수정 실패";

		model.addAttribute("msg", msg);

		return "member/modify";
	}
	
	
	
	
	/*회원가입*/
		
		
		@RequestMapping(value = "/member/memberReg", method=RequestMethod.GET)
		public String memberRegForm() {
			return "home";
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
		
	
	  
		/*회원탈퇴*/
		
		
		@RequestMapping("/member/memberDelete")
		public String deleteMember(Model model, @RequestParam("id") String id, HttpSession session) {
			
			int resultCnt = service.deleteMember(id);
			session.removeAttribute("loginInfo");
			String msg = "정보삭제 완료";

			if (resultCnt == 0)
				msg = "정보삭제 실패";

			model.addAttribute("msg", msg);
			
			return "member/memberDelete";
					
		}
		
		
		
		
		/*회원 로그아웃*/
		
		@RequestMapping("/member/memberlogout")
		public String logout(HttpSession session) {
			session.removeAttribute("loginInfo");
			return "redirect:/";
		}
		
		
		
		
		
		
		/*카카오 로그인*/
		/*@RequestMapping(value = "/kakaologin", method=RequestMethod.GET)
		public String kakaologinform() {
			return "member/kakaologin";
		}*/
		
		
		
		
		@RequestMapping(value = "/kakaologin", method = RequestMethod.POST)
		public String kakaoLogin(@RequestParam(name="kakaoEmail") String email, 
				                 @RequestParam(name="id") String id,                             
				                 @RequestParam(name="profile_image") String profile, 
				                 @RequestParam(name="nickname") String name, HttpSession session) {
			                     
			
	
			System.out.println(email);
			System.out.println(id);
			System.out.println(profile);
			System.out.println(name);
			
		

			// 세션에 데이터 저장
			session.setAttribute("loginInfo", email);
			
			System.out.println(session.getAttribute("loginInfo"));
			
			/*notifier.sendMail(member.getMember_id(), "로그인이 성공적으로 처리되었습니다.");*/

			
			
			return"home";
		}

		
		
		
	
		
		/*아이디 찾기*/
		
		@RequestMapping(value = "/findId", method=RequestMethod.GET)
		public String findIdform() {
			return "member/findid";
		}
		
		
		
		
		@RequestMapping(value = "/findId" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
		public @ResponseBody String findId(@ModelAttribute MemberDto member, Model model , HttpServletResponse response)throws Exception {

			System.out.println(member.toString());


			ArrayList <String> emailList = service.findId(member);
			System.out.println(emailList.toString());
			System.out.println(emailList.get(0));
			String findEmail = "{\"member_email\":\""+emailList+"\"}";

			System.out.println(findEmail);

			return findEmail;
		}
		
		
		/*아이디 유무 체크*/
		@RequestMapping(value = "/idchk" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
		public @ResponseBody String checkDuplicate(HttpServletResponse response,  @RequestParam("memberForm_id") String id, Model model)throws Exception {

		  String msg = service.idchk(id);
		  System.out.println(msg);
		  String responseMsg;


		  if(msg == "T") {
		        responseMsg = "{\"msg\":\""+"사용이 가능한 아이디 입니다."+"\"}";
		  }else {
		    responseMsg = "{\"msg\":\""+"사용이 불가한 아이디 입니다."+"\"}";
		  }


		   URLEncoder.encode(responseMsg , "UTF-8");


//			model.addAttribute("msg", service.authenticate(email));
		  System.out.println(id);
		  return responseMsg;

		}
		
		
		

}
