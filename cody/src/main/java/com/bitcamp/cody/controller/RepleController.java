package com.bitcamp.cody.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.bitcamp.cody.dto.PageDto;
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

		System.out.println("대댓글 : " + reple);
		repleService.re_repleInsert(reple);

		return "cody/repleOk";
	}

	// 댓글 삭제
	@RequestMapping(value = "/repleDelete", method = RequestMethod.GET)
	@ResponseBody
	public String repleDelete(Model model, @RequestParam("reple_idx") int idx) {

		System.out.println("reple_idx : " + idx);

		List<RepleDto> reple = repleService.childReple(idx);
		System.out.println("reple : " + reple);
		if (reple.size() == 0) {
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
	public String notice(Model model, HttpSession session, HttpServletRequest req) {
		MemberDto myMember = (MemberDto) session.getAttribute("loginInfo");
		int idx = myMember.getMember_idx();

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");

		// 페이징 처리
		int currentPageNo = 1; // /(localhost:8080)페이지로 오면 처음에 표시할 페이지 (1 = 첫번째 페이지)
		int maxPost = 5; // 페이지당 표시될 게시물 최대 갯수

		if (req.getParameter("pages") != null) // 게시물이 1개도없으면(=페이지가 생성이 안되었으면)이 아니라면 == 페이징이 생성되었다면
			currentPageNo = Integer.parseInt(req.getParameter("pages")); // pages에있는 string 타입 변수를 int형으로 바꾸어서
																			// currentPageNo에 담는다.
		PageDto paging = new PageDto(currentPageNo, maxPost);

		int offset = (paging.getCurrentPageNo() - 1) * paging.getMaxPost(); // 게시물 몇번부터 가져올지

		int noOfRecords = paging.getMaxPost();
		int totalCnt = repleService.totalCount();
		
		// 내 코디에 작성된 댓글리스트 가져오기
		List<RepleDto> list = repleService.noticeList(idx, offset, noOfRecords);

		paging.setNumberOfRecords(totalCnt); // 페이지를 표시하기 위해 전체 게시물 수를 파악하기 위한것
		paging.makePaging(); 
		
		ArrayList<HashMap<String, Object>> page = new ArrayList<>();

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
			page.add(map);
		}

		model.addAttribute("paging", paging);
		model.addAttribute("page", page);
		model.addAttribute("offset", offset);
		model.addAttribute("noOfRecords", noOfRecords);
		model.addAttribute("totalCnt", totalCnt);
		
		return "cody/noticeList";
	}

	// 수신 여부
	@RequestMapping(value = "/reception", method = RequestMethod.POST)
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
