package com.bitcamp.cody.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.dto.RepleDto;
import com.bitcamp.cody.service.CodyListService;
import com.bitcamp.cody.service.MemberService;
import com.bitcamp.cody.service.RepleService;

@Controller
public class RepleController {

	@Autowired
	RepleService repleService;

	@Autowired
	MemberService memberService;
	
	@Autowired
	CodyListService codyListService;

	// 첫댓글 입력
	@RequestMapping(value = "/repleInsert")
	@ResponseBody
	public String insertReple(RepleDto reple) {

		int resultCnt = repleService.repleInsert(reple);
		
		// 날짜 포멧 변경
		SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd hh:mm");
				
		RepleDto lateReple = repleService.selectinfo(reple);
		System.out.println("lateReple : " + lateReple);
		JSONObject obj = new JSONObject();
		obj.put("date", df.format(lateReple.getReple_date()));
		
		return obj.toString();
	}

	// 대댓글
	@RequestMapping(value = "/re_repleInsert")
	@ResponseBody
	public String re_RepleInsert(Model model, RepleDto reple, HttpSession session) {

		MemberDto member = (MemberDto) session.getAttribute("loginInfo");
		reple.setMember_idx(member.getMember_idx());
		
		System.out.println("대댓글 : "+reple);
		repleService.re_repleInsert(reple);

		return "cody/repleOk";
	}

	// 댓글 삭제
	@RequestMapping(value = "/repleDelete", method = RequestMethod.GET)
	@ResponseBody
	public String repleDelete(Model model, @RequestParam("reple_idx") int idx) {

		System.out.println("reple_idx : " + idx);

		
		List<RepleDto> reple =  repleService.childReple(idx);
		System.out.println("reple : " + reple);
		if(reple.size() == 0) {
			repleService.repleDelete(idx);
		} else {
			RepleDto re = new RepleDto();
			re.setReple_idx(idx);
			re.setReple_contents("댓글이 삭제되었습니다.");
			repleService.repleUpdate(re);
		}

		return "cody/repleOk";

	}

	// 알림 페이지로 이동
	@RequestMapping("/noticeList")
	public String notice(Model model, HttpSession session) {
		MemberDto myMember = (MemberDto) session.getAttribute("loginInfo");
		int idx = myMember.getMember_idx();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		
		// 내 코디에 작성된 댓글리스트 가져오기
		List<RepleDto> list = repleService.noticeList(idx);

		ArrayList<HashMap<String, Object>> arr = new ArrayList<>();

		for (RepleDto notice : list) {
			HashMap<String, Object> map = new HashMap<>();
			
			// 내코디에 댓글단 작성자 정보 가져오기
			MemberDto member = memberService.selectByIdx(notice.getMember_idx());
			
			// 댓글이 작성된 코디 정보가져오기
			CodyDto cody = codyListService.CodyListView(notice.getCody_idx());
			
			// 날짜 포멧변경
			String date = df.format(notice.getReple_date());
			
			map.put("cody_title", cody.getCody_title());
			map.put("cody_image", cody.getCody_image());
			map.put("reple_date", date);
			map.put("member_id", member.getMember_id());
			arr.add(map);
		}

		System.out.println("arr : " + arr.toString());
		model.addAttribute("arr", arr);

		return "cody/noticeList";
	}

	// 수신 여부
	@RequestMapping(value="/reception", method=RequestMethod.POST)
	@ResponseBody
	public int reception() {

		int cnt = repleService.selectReception();

		return cnt;
	}

	// 수신 확인
	@RequestMapping("/receptionOk")
	@ResponseBody
	public String receptionOK() {

		// 수신여부 true로 변경
		repleService.receptionUpdate();

		return "";
	}

}
