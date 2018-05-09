package com.bitcamp.cody.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cody.dto.RepleDto;
import com.bitcamp.cody.dto.TocDto;
import com.bitcamp.cody.service.MemberListService;
import com.bitcamp.cody.service.RepleService;
import com.bitcamp.cody.service.TocService;

@Controller
public class RepleController {

	@Autowired
	RepleService repleService;

	@Autowired
	TocService tocService;


	@Autowired
	MemberListService memberListService;

	// 댓글 리스트 가져오기
	@RequestMapping("/repleList")
	public String repleList(Model model, @RequestParam("cody_idx") int cIdx) {

		List<RepleDto> list_r = repleService.listAll(cIdx);

		model.addAttribute("list_r", list_r);

		return "cody/reple";
	}

	// 첫댓글 입력
	@RequestMapping(value = "/repleInsert", method = RequestMethod.POST)
	@ResponseBody
	public String insertReple(Model model, RepleDto repleDto, TocDto tocDto) {

		System.out.println("repleDto : " + repleDto);
		int resultCnt = repleService.repleInsert(repleDto);

		String msg="";
		if(resultCnt == 1) {
			tocService.tocInsert(tocDto);
			msg = "입력이 정상적으로 처리되었습니다.";
		}		
		
		if (resultCnt <= 0)
			
			msg = "입력 처리가 되지 않았습니다. 담당자에게 문의 해주세요.";

		model.addAttribute("msg", msg);

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
	
	

}
