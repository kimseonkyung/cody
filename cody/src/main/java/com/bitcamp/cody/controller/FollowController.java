package com.bitcamp.cody.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.cody.dto.FollowDto;
import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.service.FollowService;
import com.bitcamp.cody.service.MemberService;
import com.mysql.fabric.xmlrpc.base.Member;

@Controller
public class FollowController {

	@Autowired
	FollowService requestandnresponse;

	@Autowired
	MemberService memberService;

	// 신청하는 사람
	@RequestMapping(value = "/followinsert", method = RequestMethod.GET)
	public String followrequest(/* @RequestParam("member_idx") int m_response, */
			HttpSession session, Model model) {

		MemberDto member = (MemberDto) session.getAttribute("loginInfo"); // 로그인된 아이디값 가져오기

		int m_request = member.getMember_idx();

		System.out.println("memberIdx : " + m_request);
		HashMap<String, Integer> map = new HashMap();

		map.put("m_request", m_request);
		map.put("m_response", 1);// 변경해야됨

		int resultCnt = requestandnresponse.insertFollow(map);

		String msg = "정상적 팔로우가 신청되었습니다.";

		if (resultCnt < 1)

			msg = "비정상";

		model.addAttribute("msg", msg);

		return "follow/followinsert";
	}

	// 받는 사람 팔로워

	@RequestMapping("/followListrp")
	public String followresponse(HttpSession session, Model model) {

		MemberDto member = (MemberDto) session.getAttribute("loginInfo");

		int m_response = member.getMember_idx();// session에서 idx 구하기

		System.out.println("memberIdx: " + m_response);

		List<FollowDto> responseList = requestandnresponse.getListrespons(m_response);
		ArrayList<HashMap<Object, Object>> irr = new ArrayList<>();

		System.out.println("response: " + responseList.toString());

		for (FollowDto response : responseList) {

			@SuppressWarnings("unused")
			MemberDto memberrequst = requestandnresponse.selectrequest(response.getM_request());

			HashMap<Object, Object> map = new HashMap<>();

			map.put(response.getM_response(), memberrequst);

			irr.add(map);
		}

		System.out.println("irr: " + irr.toString());

		model.addAttribute("irr", irr);

		return "follow/followListrp";
	}
	
	// 하는 사람 팔로우

	@RequestMapping("/followListrq")

	public String requestList(Model model, HttpSession session) {

		MemberDto member = (MemberDto) session.getAttribute("loginInfo");

		int m_request = member.getMember_idx();

		List<FollowDto> requestLsit = requestandnresponse.getListrequet(m_request);		
		ArrayList<HashMap<Object, Object>> irr = new ArrayList<>();
		
	    System.out.println("request: "+ requestLsit.toString());

		for (FollowDto request : requestLsit) {
						
			@SuppressWarnings("unused")
			MemberDto memberrespons = requestandnresponse.selectresponse(request.getM_response());	
			HashMap<Object, Object> map = new HashMap<>();

			map.put(request.getM_request(), memberrespons);
			irr.add(map);
		}
		model.addAttribute("irr", irr);

		return "follow/followListrq";

	}

	// 수정

	@RequestMapping(value = "/followUpDate", method = RequestMethod.GET)
	public String utdatefallow(Model model, HttpSession session /* @RequestParam("member_idx") int m_request */) {

		MemberDto member = (MemberDto) session.getAttribute("loginInfo");

		int m_response = member.getMember_idx();

		System.out.println("member : " + m_response);
		HashMap<String, Integer> map = new HashMap();

		map.put("m_response", m_response);
		map.put("m_request", 7);// 변경해야됨

		int resultCnt = requestandnresponse.getfollowUpdate(map);

		String msg = "팔로우 수락";

		if (resultCnt == 0)
			msg = "팔로우 에러";

		model.addAttribute("msg", msg);

		return "follow/followUpDate";

	}
	// 팔로우 삭제

	@RequestMapping("/followDelete")

	public String deleteFollow(Model model/* , @RequestParam("fallow_idx") int followidx */) {

		int resultCnt = requestandnresponse.getdeleteFollow(22);

		String msg1 = "삭제 완료 되었습니다.";

		if (resultCnt == 0)
			msg1 = "삭제 실패 되었습니다/";

		model.addAttribute("msg1", msg1);

		System.out.println(msg1.toString());

		return "follow/followDelete";

	}
}