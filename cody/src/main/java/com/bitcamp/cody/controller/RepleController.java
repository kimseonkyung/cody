package com.bitcamp.cody.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.dto.RepleDto;
import com.bitcamp.cody.service.MemberListService;
import com.bitcamp.cody.service.MemberService;
import com.bitcamp.cody.service.RepleService;

@Controller
public class RepleController {

	@Autowired
	RepleService repleService;

	@Autowired
	MemberListService memberListService;
	
	@Autowired
	MemberService memberService;

	// 댓글 리스트 가져오기
	@RequestMapping("/repleList")
	public String repleList(Model model, @RequestParam("cody_idx") int cIdx) {

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		
		List<RepleDto> list_r = repleService.listAll(cIdx);
		ArrayList<HashMap<String, Object>> arr = new ArrayList<>();
		
		for(RepleDto reple : list_r) {
			HashMap<String, Object> map = new HashMap<>();
			MemberDto member = new MemberDto();
			member=memberService.selectByIdx(reple.getMember_idx());
			String date = df.format(reple.getReple_date());
			map.put("reple_contents", reple.getReple_contents());
			map.put("reple_date", date);
			map.put("member_id", member.getMember_id());
			map.put("reple_idx", reple.getReple_idx());
			arr.add(map);
		}
		System.out.println("arr : " + arr.toString());
		model.addAttribute("arr", arr);

		return "cody/reple";
	}

	// 첫댓글 입력
	@RequestMapping(value = "/repleInsert", method = RequestMethod.POST)
	@ResponseBody
	public String insertReple(Model model, RepleDto repleDto) {
		
		
		int resultCnt = repleService.repleInsert(repleDto);

		return "cody/repleOk";
	}

	// 대댓글
	@RequestMapping(value = "/repleInsert", method = RequestMethod.GET)
	public String re_RepleInsert(Model model, @RequestParam("reple_idx") int idx,
			@RequestParam("reple_contents") String contents, @RequestParam("member_idx") int member_idx) {

		RepleDto reple = repleService.selectByIdx(idx);
		reple.setReple_contents(contents);
		reple.setMember_idx(member_idx);
		int resultCnt = repleService.re_repleInsert(reple);

		String msg = "입력이 정상적으로 처리되었습니다.";

		if (resultCnt == 0)
			msg = "입력 처리가 되지 않았습니다. 담당자에게 문의 해주세요.";

		model.addAttribute("msg", msg);

		return "cody/repleOk";
	}

	// 댓글 삭제
	@RequestMapping(value = "/repleDelete", method = RequestMethod.GET)
	@ResponseBody
	public String repleDelete(Model model, @RequestParam("reple_idx") int idx) {

		System.out.println("reple_idx : " + idx);

		int resultCnt = repleService.repleDelete(idx);

		String msg = "정보삭제 완료";

		if (resultCnt == 0)
			msg = "정보삭제 실패";

		model.addAttribute("msg", msg);

		return "cody/repleOk";

	}
	
	
	// 알림 페이지로 이동
	@RequestMapping("/noticeList")
	public String notice(Model model, HttpSession session) {
		String user = "sk";
		// String user = (String) session.getAttribute("id");
		
		return "cody/noticeList";
	}
	
	
	// 수신 여부
	@RequestMapping("/reception")
	@ResponseBody
	public int reception(Model model) {

		
		int cnt = repleService.selectReception();
		
		return cnt;
	}

	// 수신 확인
	@RequestMapping("/receptionOk")
	@ResponseBody
	public String receptionOK(Model model) {

		repleService.receptionUpdate();

		return "";
	}

}
