package com.bitcamp.cody.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.dto.ItemList;
import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.service.CodyListService;
import com.bitcamp.cody.service.CodyService;
import com.bitcamp.cody.service.ItemListService;
import com.bitcamp.cody.service.ItemService;
import com.bitcamp.cody.service.MemberService;

/*-----------입력---------------*/
@Controller
public class CodyController {

	@Autowired
	CodyService codyservice;
	@Autowired
	CodyListService codyListService;
	@Autowired
	ItemService itemService;
	@Autowired
	ItemListService itemListService;
	@Autowired
	MemberService memberService;
	

	@RequestMapping(value = "/codyForm", method = RequestMethod.GET)
	public String codyForm(Model model, HttpSession session) {
		String user = "a";
		// String user = (String) session.getAttribute("id");    // 로그인된 아이디값 가져오기
		
		MemberDto member = memberService.selectById(user);	// 아이디로 member정보 가져오기
		int memberIdx = member.getMember_idx();
		
		List<ItemDto> item = itemListService.selectByMemberIdx(memberIdx);
		model.addAttribute("items", item);
		
		return "cody/codyForm";
	}

	@RequestMapping(value = "/codyForm", method = RequestMethod.POST)
	public String codyInsert(Model model, HttpSession session, CodyDto cody, ItemList list)
			throws IllegalStateException, IOException {
		
		String user = "a";
		// String user = (String) session.getAttribute("id");    // 로그인된 아이디값 가져오기
		
		// 서비스에 회원 데이터 저장 요청
		// 결과 : 1 / 0
		// model 에 저장
		System.out.println("cody : "+ cody);
		System.out.println("item : "+ list);
		MemberDto member = memberService.selectById(user);	// 아이디로 member정보 가져오기
		int memberIdx = member.getMember_idx();
		
		System.out.println("member : "+ member);
		
		cody.setMember_idx(memberIdx);
		int resultCnt = codyservice.codyInsert(cody, session);
		int codyIdx = codyservice.maxCodyIdx();					// 최근에 등록한 코디 idx 찾기
		ArrayList<ItemDto> arr = new ArrayList<>();
		for(ItemDto item  : list.getItemList()) {
			item.setCody_idx(codyIdx);
			item.setMember_idx(memberIdx);
			arr.add(item);
		}
		
		itemService.itemListInsert(arr);

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

	/*-----------리스트---------------*/
	
	@RequestMapping("/codyList")
	public String codyList(Model model) {

		List<CodyDto> codys = codyListService.CodyList();
		
		model.addAttribute("codys", codys);
		

		return "cody/codyList";
	}

	@RequestMapping("/codyListView")
	public String CodylistView(Model model, @RequestParam("cody_idx") int idx) {

		CodyDto cody = codyListService.CodyListView(idx);
		model.addAttribute("cody", cody);

		return "cody/codyListView";
	}
	
	@RequestMapping("/codyListSearch")
	public String CodylistSearch(Model model, @RequestParam("cody_title") String title) {

		List<CodyDto> codys = codyListService.CodyListSearch(title);
		System.out.println("검색: " + codys.toString());
		model.addAttribute("codys", codys);

		return "cody/codyListSearch";
	}

/*--------------수정-----------------*/


	@RequestMapping(value="/codyUpdate", method = RequestMethod.GET)
	public String codyUpdate(Model model, @RequestParam("cody_idx") int idx) {

		CodyDto cody = codyListService.CodyListView(idx);

		model.addAttribute("cody", cody);

		return "cody/codyUpdate";
	}

	@RequestMapping(value="/codyUpdate", method = RequestMethod.POST)
	public String updateOk(CodyDto cody, Model model, HttpSession session)
			throws IllegalStateException, IOException {

		int resultCnt = codyservice.codyUpdate(cody, session);

		String msg = "코디수정 완료";

		if (resultCnt == 0)
			msg = "수정 실패";

		model.addAttribute("msg", msg);

		return "cody/codyFormOk";
	}
/*-----------------삭제----------------*/


	@RequestMapping("/codyDelete")
	public String codyDelete(Model model, @RequestParam("cody_idx") int idx) {

		int resultCnt = codyservice.codyDelete(idx);

		String msg = "코디삭제 완료";

		if (resultCnt == 0)
			msg = "삭제 실패";

		model.addAttribute("msg", msg);

		return "cody/codyFormOk";

	}
	
	
}