package com.bitcamp.cody.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.dto.RepleDto;
import com.bitcamp.cody.service.MemberListService;
import com.bitcamp.cody.service.RepleService;

@Controller
public class RepleController {

	@Autowired
	RepleService repleService;

	@Autowired
	MemberListService memberListService;

	// 댓글 리스트 가져오기
	@RequestMapping("cody/repleList")
	public String repleList(Model model, @RequestParam("cody_idx") int cIdx, @RequestParam("member_id") int mIdx) {
		List<RepleDto> list_r = repleService.listAll(cIdx, mIdx);
		List<MemberDto> list_m = memberListService.getListSearch(mIdx);

		model.addAttribute("list_r", list_r);
		model.addAttribute("list_m", list_m);

		return "cody/reple";
	}

	// 첫댓글 입력
	public String insertReple(Model model, RepleDto repleDto) {

		int resultCnt = repleService.repleInsert(repleDto);

		String msg = "입력이 정상적으로 처리되었습니다.";

		if (resultCnt == 0)
			msg = "입력 처리가 되지 않았습니다. 담당자에게 문의 해주세요.";

		model.addAttribute("msg", msg);

		return "";
	}

	// 대댓글
	@RequestMapping("cody/reple")
	public String re_RepleInsert(Model model, @RequestParam("reple_idx") int idx) {

		RepleDto reple = repleService.selectByIdx(idx);

		int resultCnt = repleService.re_repleInsert(reple);

		String msg = "입력이 정상적으로 처리되었습니다.";

		if (resultCnt == 0)
			msg = "입력 처리가 되지 않았습니다. 담당자에게 문의 해주세요.";

		model.addAttribute("msg", msg);

		return "";
	}

}
