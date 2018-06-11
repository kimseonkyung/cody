package com.bitcamp.cody.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.bitcamp.cody.dto.RepleDto;
import com.bitcamp.cody.service.CodyListService;
import com.bitcamp.cody.service.CodyService;
import com.bitcamp.cody.service.ItemListService;
import com.bitcamp.cody.service.ItemService;
import com.bitcamp.cody.service.MemberService;
import com.bitcamp.cody.service.RepleService;

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
	@Autowired
	RepleService repleService;
	
	
	/*-----------입력---------------*/
	@RequestMapping(value = "/codyForm", method = RequestMethod.GET)
	public String codyForm(Model model, HttpSession session) {
		MemberDto member = (MemberDto) session.getAttribute("loginInfo"); 
		int memberIdx = member.getMember_idx();
		
		List<ItemDto> items = itemListService.selectByMemberIdx(memberIdx);
		
		model.addAttribute("items", items);
		
		return "cody/codyForm";
	}

	@RequestMapping(value = "/codyForm", method = RequestMethod.POST)
	public String codyInsert(Model model, HttpSession session, CodyDto cody)
			throws IllegalStateException, IOException {
		
		List<ItemDto> itemList = cody.getItemList();
		System.out.println("list테스트 : " + itemList);
		for(int i=0; i<itemList.size(); i++) {
			if(itemList.get(i).getItem_name() == null) {
				itemList.remove(i);
			}
		}
		
		System.out.println("itemList테스트 : " + itemList);
		
		MemberDto member = (MemberDto) session.getAttribute("loginInfo"); 
		int memberIdx = member.getMember_idx();
		
		// 서비스에 회원 데이터 저장 요청
		// 결과 : 1 / 0
		// model 에 저장
		
		
		cody.setMember_idx(memberIdx);
		int resultCnt = codyservice.codyInsert(cody, session);
		int codyIdx = codyservice.maxCodyIdx();					// 최근에 등록한 코디 idx 찾기
		List<ItemDto> arr = new ArrayList<>();
		for(ItemDto item  : itemList) {	
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

	/*---------------------코디 상세보기----------------------*/
	@RequestMapping("/codyListView")
	public String CodylistView(Model model, @RequestParam("cody_idx") int idx) {
		
		// 코디정보 가져오기
		CodyDto cody = codyListService.CodyListView(idx);
		
		// 코디주인 정보 가져오기
		MemberDto member = memberService.selectByIdx(cody.getMember_idx());
		
		// 코디에 등록된 아이템 가져오기
		List<ItemDto> items = itemListService.selectByCodyIdx(idx);
		
		// 댓글 가져오기
		// 날짜 포멧 변경
		SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd hh:mm");

		List<RepleDto> list_r = repleService.listAll(idx);
		
		ArrayList<HashMap<String, Object>> repleList = new ArrayList<>();

		for (RepleDto reple : list_r) {
			MemberDto writer = memberService.selectByIdx(reple.getMember_idx());
			HashMap<String, Object> map = new HashMap<>();
			String date = df.format(reple.getReple_date());
			map.put("reple_contents", reple.getReple_contents());
			map.put("reple_date", date);
			map.put("member_idx", writer.getMember_idx());
			map.put("member_id", writer.getMember_id());
			map.put("member_photo", writer.getMember_photo());
			map.put("reple_idx", reple.getReple_idx());
			map.put("regroup", reple.getRegroup());
			map.put("reparent", reple.getReparent());
			map.put("redepth", reple.getRedepth());
			map.put("reorder", reple.getReorder());
			repleList.add(map);
		}
		
		// 조회수 증가
		int result = codyListService.countAdd3(cody);
		
		// 모델객체에 담기
		model.addAttribute("cody", cody);
		model.addAttribute("member", member);
		model.addAttribute("items", items);
		model.addAttribute("itemSize", items.size());
		model.addAttribute("repleList", repleList);
		
		

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


	@RequestMapping(value="/codyUpdate")
	public String codyUpdate(Model model,HttpSession session , @RequestParam("cody_idx") int idx) {
		
		
		MemberDto member = (MemberDto) session.getAttribute("loginInfo"); 
		int memberIdx = member.getMember_idx();
		
		List<ItemDto> items = itemListService.selectByMemberIdx(memberIdx);
		
		CodyDto cody = codyListService.CodyListView(idx);
		List<ItemDto> codyItems = itemListService.selectByCodyIdx(idx);
		
		model.addAttribute("items", items);
		model.addAttribute("cody", cody);
		model.addAttribute("codyItems", codyItems);
		
		return "cody/codyUpdate";
	}
	@RequestMapping(value = "/codyUpdateOk")
	public String codyUpdate(Model model, HttpSession session, CodyDto cody) throws IllegalStateException, IOException {
		
		System.out.println("cody 수정 : " + cody);
		System.out.println("ItemList 수정 : " + cody.getItemList());
		
		List<ItemDto> itemList = cody.getItemList();
		for(int i=0; i<itemList.size(); i++) {
			if(itemList.get(i).getItem_name() == null) {
				itemList.remove(i);
			}
		}
		
		codyservice.codyUpdate(cody, session);
		
		List<ItemDto> arr = new ArrayList<>();
		for(ItemDto item  : itemList) {	
			item.setCody_idx(cody.getCody_idx());
			item.setMember_idx(cody.getMember_idx());
			arr.add(item);
		}
		
		itemService.itemCodyDelete(cody.getCody_idx());
		itemService.itemListInsert(arr);

		return "cody/codyFormOk";
	}
	
/*-----------------삭제----------------*/


	@RequestMapping("/codyDelete")
	public String codyDelete(Model model, @RequestParam("cody_idx") int idx) {

		repleService.repleAllDelete(idx);
		itemService.itemCodyDelete(idx);
		int resultCnt = codyservice.codyDelete(idx);

		String msg = "코디삭제 완료";

		if (resultCnt == 0)
			msg = "삭제 실패";

		model.addAttribute("msg", msg);

		return "cody/codyFormOk";

	}
	
	
}