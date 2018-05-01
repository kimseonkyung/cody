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

import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.service.ItemListService;
import com.bitcamp.cody.service.ItemService;

@Controller
public class ItemController {

	@Autowired
	ItemService itemService;
	@Autowired
	ItemListService itemListService;

	/*-------------------------------- 입력 ------------------------------*/
	@RequestMapping(value = "/itemForm", method = RequestMethod.GET)
	public String itemForm() {
		return "cody/itemForm";
	}

	@RequestMapping(value = "/itemForm", method = RequestMethod.POST)
	public String itemInsert(ItemDto item, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		// 서비스에 회원 데이터 저장 요청
		// 결과 : 1 / 0
		// item 에 저장
		System.out.println(item);

		int resultCnt = itemService.itemInsert(item, request);

		String msg = "입력이 정상적으로 처리되었습니다.";

		if (resultCnt == 0)
			msg = "입력 처리가 되지 않았습니다. 담당자에게 문의 해주세요.";

		model.addAttribute("msg", msg);

		return "cody/itemFormOk";
	}

	@ExceptionHandler(IOException.class)
	public String ex1(IOException e) {
		return "error/ex1";
	}

	@ExceptionHandler(IllegalStateException.class)
	public String ex2(IllegalStateException e) {
		return "error/ex2";
	}

	/*-------------------------------- 리스트 ------------------------------*/
	@RequestMapping("/itemList")
	public String itemList(Model model) {

		List<ItemDto> items = itemListService.getItemList();

		System.out.println("전체리스트 : " + items.toString());
		model.addAttribute("items", items);

		return "cody/itemFormOk";
	}

	@RequestMapping("/itemListView")
	public String listView(Model model, @RequestParam("item_idx") int idx) {

		ItemDto item = itemListService.getListView(idx);

		System.out.println("상세보기 : " + item.toString());
		model.addAttribute("item", item);

		return "cody/itemFormOk";
	}

	@RequestMapping("/itemSearch")
	public String listSearch(Model model, @RequestParam("item_name") String name) {

		List<ItemDto> items = itemListService.getListSearch(name);

		System.out.println("검색 : " + items.toString());
		model.addAttribute("items", items);

		return "cody/itemFormOk";
	}

	/*-------------------------------- 수정 ------------------------------*/
	@RequestMapping("itemUpdate")
	public String itemUpdate(ItemDto item, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {

		int resultCnt = itemService.itemUpdate(item, request);

		String msg = "정보수정 완료";

		if (resultCnt == 0)
			msg = "정보수정 실패";

		model.addAttribute("msg", msg);

		return "cody/itemFormOk";
	}

	/*-------------------------------- 삭제 ------------------------------*/
	@RequestMapping("/itemDelete")
	public String itemDelete(Model model, @RequestParam("item_idx") int idx) {

		int resultCnt = itemService.itemDelete(idx);

		String msg = "정보삭제 완료";

		if (resultCnt == 0)
			msg = "정보삭제 실패";

		model.addAttribute("msg", msg);

		return "cody/itemFormOk";

	}   
 
}
