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

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.dto.RepleDto;
import com.bitcamp.cody.service.CodyListService;
import com.bitcamp.cody.service.MemberListService;
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

	// 댓글 리스트 가져오기
	@RequestMapping("/repleList")
	public String repleList(Model model, @RequestParam("cody_idx") int cIdx) {

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");

		List<RepleDto> list_r = repleService.listAll(cIdx);
		ArrayList<HashMap<String, Object>> arr = new ArrayList<>();

		for (RepleDto reple : list_r) {
			HashMap<String, Object> map = new HashMap<>();
			MemberDto member = memberService.selectByIdx(reple.getMember_idx());
			String date = df.format(reple.getReple_date());
			map.put("reple_contents", reple.getReple_contents());
			map.put("reple_date", date);
			map.put("member_id", member.getMember_id());
			map.put("reple_idx", reple.getReple_idx());
			map.put("regroup", reple.getRegroup());
			map.put("reparent", reple.getReparent());
			map.put("redepth", reple.getRedepth());
			map.put("reorder", reple.getReorder());
			arr.add(map);
		}
		System.out.println("arr : " + arr.toString());
		model.addAttribute("arr", arr);

		return "cody/reple";
	}

	// 첫댓글 입력
	@RequestMapping(value = "/repleInsert")
	@ResponseBody
	public String insertReple(RepleDto reple) {

		int resultCnt = repleService.repleInsert(reple);

		return "";
	}

	// 대댓글
	@RequestMapping(value = "/re_repleInsert")
	@ResponseBody
	public String re_RepleInsert(Model model, RepleDto reple, HttpSession session) {

		String user = "a";
		// String user = (String) session.getAttribute("id");
		
		MemberDto member = memberService.selectById(user);
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
		String user = "a";
		// String user = (String) session.getAttribute("id");

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		
		List<RepleDto> list = repleService.noticeList(user);

		ArrayList<HashMap<String, Object>> arr = new ArrayList<>();

		for (RepleDto notice : list) {
			HashMap<String, Object> map = new HashMap<>();
			
			MemberDto member = memberService.selectByIdx(notice.getMember_idx());
			CodyDto cody = codyListService.CodyListView(notice.getCody_idx());
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
