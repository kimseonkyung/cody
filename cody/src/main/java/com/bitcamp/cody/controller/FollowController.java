package com.bitcamp.cody.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cody.dto.FollowDto;
import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.service.FollowService;
import com.bitcamp.cody.service.MemberService;

@Controller
public class FollowController {

	@Autowired
	FollowService requestandnresponse;

	@Autowired
	MemberService memberService;
	
	
		// 신청하는 사람
	@RequestMapping(value = "/followinsert", method = RequestMethod.GET,produces = "application/text; charset=utf8")
	@ResponseBody
	public String followrequest( @RequestParam(value="member_idx") int m_response, HttpSession session, Model model) {
			System.out.println(m_response);
		
		MemberDto member = (MemberDto) session.getAttribute("loginInfo"); // 로그인된 아이디값 가져오기

		System.out.println(member);
		
		int m_request = member.getMember_idx();

		System.out.println("memberIdx : " + m_request);
		HashMap<String, Integer> map = new HashMap();
	

		map.put("m_request", m_request);
		map.put("m_response", m_response);// 변경해야됨
		
		int resultCnt = requestandnresponse.insertFollow(map);
		
		String msg = "정상적 팔로우가 신청되었습니다.";

		if (resultCnt < 1)

			msg = "비정상";

		model.addAttribute("msg", msg);

		return "time/codyTimeList";
		
		
		/*return "follow/followinsert";*/
	}

	// 받는 사람 팔로워

	@RequestMapping(value = "/myFollowerrp",method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String followresponse(HttpSession session/*, Model model*/) {

		MemberDto member = (MemberDto) session.getAttribute("loginInfo");
										
		int m_response = member.getMember_idx();// session에서 idx 구하기
		
		
	 	System.out.println("memberIdx: " + m_response);

		List<FollowDto> responseList = requestandnresponse.getListrespons(m_response);
		JSONArray arr = new JSONArray();
		
		
		for (FollowDto response : responseList) {
			MemberDto memberrequst = requestandnresponse.selectrequest(response.getM_request());
		 	JSONObject obj = new JSONObject();
			obj.put("followrp_idx", memberrequst.getMember_idx());
			obj.put("followrp_id", memberrequst.getMember_id());
			obj.put("followrp_imag",memberrequst.getMember_photo());
			obj.put("followrp_birth",memberrequst.getMember_birth());
			obj.put("followinfop",response.getFollowinfo());
			obj.put("followidxp", response.getFollow_idx());
			arr.put(obj);
		
		}
		
		System.out.println("arr : " + arr);
		
		
		return arr.toString();
			
				
		
		/*	ArrayList<HashMap<Object, Object>> irr = new ArrayList<>();

		System.out.println("response: " + responseList.toString());

		for (FollowDto response : responseList) {

			@SuppressWarnings("unused")
			MemberDto memberrequst = requestandnresponse.selectrequest(response.getM_request());

			HashMap<Object, Object> map = new HashMap<>();

			map.put(response.getM_response(), memberrequst);

			irr.add(map);*/
		}

		/*System.out.println("irr: " + irr.toString());

		model.addAttribute("irr", irr);

		return "follow/followListrp";*/
		

	
	// 하는 사람 팔로우

	@RequestMapping(value="/myFollowerrq", method= RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String requestList(/*Model model,*/ HttpSession session) {

		MemberDto member = (MemberDto) session.getAttribute("loginInfo");

		int m_request = member.getMember_idx();

		List<FollowDto> requestLsit = requestandnresponse.getListrequet(m_request);		
		JSONArray arr = new JSONArray();
		
		for(FollowDto request : requestLsit) {
			MemberDto memberrespons = requestandnresponse.selectresponse(request.getM_response());
			JSONObject obj = new JSONObject();
			
			obj.put("followrq_idx",memberrespons.getMember_idx());
			obj.put("followrq_id",memberrespons.getMember_id());
			obj.put("followrq_imge",memberrespons.getMember_photo());
			obj.put("followrq_birth",memberrespons.getMember_birth());
			obj.put("followinfoq",request.getFollowinfo());
			obj.put("followidxq", request.getFollow_idx());
			arr.put(obj);			
		}		
		System.out.println("arr : " + arr);
				
		return arr.toString();
		
		
	/*	ArrayList<HashMap<Object, Object>> irr = new ArrayList<>();
		
	    System.out.println("request: "+ requestLsit.toString());

		for (FollowDto request : requestLsit) {
						
			@SuppressWarnings("unused")
			MemberDto memberrespons = requestandnresponse.selectresponse(request.getM_response());	
			HashMap<Object, Object> map = new HashMap<>();

			map.put(request.getM_request(), memberrespons);
			irr.add(map);
		}
		model.addAttribute("irr", irr);

		return "follow/followListrq";*/

	}

	// 수정

	@RequestMapping(value = "/followUpDate", method = RequestMethod.GET)
	public String utdatefallow(Model model, HttpSession Session ,@RequestParam("member_idx") int m_request ) {

		MemberDto member = (MemberDto) Session.getAttribute("loginInfo");

		int m_response = member.getMember_idx();

		System.out.println("m_response : " + m_response);
		System.out.println("m_request : " + m_request);
		HashMap<String, Integer> map = new HashMap();

		map.put("m_response", m_response);
		map.put("m_request", m_request);// 변경해야됨

		int resultCnt = requestandnresponse.getfollowUpdate(map);

		String msg = "팔로우 수락";

		if (resultCnt == 0)
			msg = "팔로우 에러";

		model.addAttribute("msg", msg);

		return "cody/myPage";

	}
	// 팔로우 삭제

	@RequestMapping(value="/followDelete",method = RequestMethod.GET)
	public String deleteFollow(Model model , @RequestParam("fallow_idx") int followidx ) {

		int resultCnt = requestandnresponse.getdeleteFollow(followidx);
		
		System.out.println(resultCnt);
		
		String msg1 = "삭제 완료 되었습니다.";

		if (resultCnt == 0)
			msg1 = "삭제 실패 되었습니다/";

		model.addAttribute("msg1", msg1);

		System.out.println(msg1.toString());

		return "cody/myPage";

	}
}
