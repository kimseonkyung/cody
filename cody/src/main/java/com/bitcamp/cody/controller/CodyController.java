package com.bitcamp.cody.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.service.CodyListService;
import com.bitcamp.cody.service.CodyService;


@Controller
public class CodyController {

	@Autowired
	CodyService codyservice;
	@Autowired
	CodyListService codyListService;

	@RequestMapping(value = "/codyForm", method = RequestMethod.GET)
	
	public String codyForm() {
		return "cody/codyForm";
	}

	@RequestMapping(value = "/codyForm", method = RequestMethod.POST)
	public String codyInsert(CodyDto cody, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		// 서비스에 회원 데이터 저장 요청
		// 결과 : 1 / 0
		// model 에 저장
		System.out.println(cody);

		int resultCnt = codyservice.codyInsert(cody, request);

		String msg = "정상적으로 등록되었습니다.";

		if (resultCnt == 0)
			msg = "등록이 되지 않았습니다. 담당자에게 문의 해주세요.";

		model.addAttribute("msg", msg);

		return "cody/codyFormOk";
	}

	@ExceptionHandler(IOException.class)
	public String ex1(IOException e) {
		return "error/ex1";
	}

	@ExceptionHandler(IllegalStateException.class)
	public String ex2(IllegalStateException e) {
		return "error/ex2";
	}

	//-----------리스트---------------//
	
	@RequestMapping("/codyList")
	public String codyList(Model model) {

		List<CodyDto> codys = codyListService.CodyList();
		
		System.out.println("전체리스트: " + codys.toString());

		model.addAttribute("codys", codys);

		return "cody/codyList";
	}

	@RequestMapping("/listView")
	public String CodylistView(Model model, @RequestParam("cody_idx") int idx) {

		CodyDto cody = codyListService.CodyListView(idx);
		System.out.println("상세보기: " + cody.toString());
		model.addAttribute("cody", cody);

		return "cody/codyListView";
	}
	
	@RequestMapping("/listSearch")
	public String CodylistSearch(Model model, @RequestParam("cody_title") String title) {

		List<CodyDto> codys = codyListService.CodyListSearch(title);
		System.out.println("검색: " + codys.toString());
		model.addAttribute("codys", codys);

		return "cody/codyListSearch";
	}

//--------------수정-----------------//


	@RequestMapping(value = "/codyList", method = RequestMethod.GET)
	public String updateCody(Model model, @RequestParam("cody_idx") int idx) {

		CodyDto cody = codyListService.CodyListView(idx);

		model.addAttribute("cody", cody);

		return "cody/codyUpdate";
	}

	@RequestMapping(value = "/codyList", method = RequestMethod.POST)
	public String updateOk(CodyDto cody, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {

		int resultCnt = codyservice.codyUpdate(cody, request);

		String msg = "코디수정 완료";

		if (resultCnt == 0)
			msg = "수정 실패";

		model.addAttribute("msg", msg);

		return "cody/codyFormOk";
	}
//-----------------삭제----------------//


	@RequestMapping("/codyDelete")
	public String deleteCody(Model model, @RequestParam("cody_idx") int idx) {

		int resultCnt = codyservice.codyDelete(idx);

		String msg = "코디삭제 완료";

		if (resultCnt == 0)
			msg = "삭제 실패";

		model.addAttribute("msg", msg);

		return "cody/codyFormOk";

	}
}
