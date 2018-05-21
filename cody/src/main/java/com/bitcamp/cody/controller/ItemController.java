package com.bitcamp.cody.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.cody.dto.Item;
import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.service.ItemListService;
import com.bitcamp.cody.service.ItemService;
import com.bitcamp.cody.service.NeverItemService;

@Controller
public class ItemController {

	@Autowired
	ItemService itemService;
	@Autowired
	ItemListService itemListService;
	@Autowired
	NeverItemService naverItemService; 



	/*-------------------------------- 입력 ------------------------------*/
	@RequestMapping(value = "/itemForm", method = RequestMethod.GET)
	public String itemForm() {
		return "item/itemForm";
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

		return "item/itemFormOk";
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

		return "item/itemList";
	}

	@RequestMapping("/itemListView")
	public String listView(Model model, @RequestParam("item_idx") int idx) {

		ItemDto item = itemListService.getListView(idx);

		System.out.println("상세보기 : " + item.toString());
		model.addAttribute("item", item);

		return "item/itemListView";
	}

	@RequestMapping("/itemSearch")
	public String listSearch(Model model, @RequestParam("item_name") String name) {

		List<ItemDto> items = itemListService.getListSearch(name);

		System.out.println("검색 : " + items.toString());
		model.addAttribute("items", items);

		return "item/itemFormOk";
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

		return "item/itemFormOk";
	}

	/*-------------------------------- 삭제 ------------------------------*/
	@RequestMapping("/itemDelete")
	public String itemDelete(Model model, @RequestParam("item_idx") int idx) {

		int resultCnt = itemService.itemDelete(idx);

		String msg = "정보삭제 완료";

		if (resultCnt == 0)
			msg = "정보삭제 실패";

		model.addAttribute("msg", msg);

		return "item/itemFormOk";

	}
	
	/*-------------------------------- 네이버쇼핑api ------------------------------*/
	
	/*@RequestMapping(value="/naverItem", produces = "application/text; charset=utf8")
	public ModelAndView naverItem(@RequestParam(required=false)String keyword){
        ModelAndView mav = new ModelAndView();
        
        if(keyword !=null)
        {
            mav.addObject("bookList",naverItemService.searchItem(keyword,10,1));
        }
        mav.setViewName("bookList");
        return mav;
    }*/


	
	@RequestMapping(value="/naverItem", produces = "application/text; charset=utf8")
	@ResponseBody
	public String naverItem(@RequestParam(required=false)String keyword){
        
		
		
        List<Item> items = naverItemService.searchItem(keyword, 10, 1);
		JSONArray arr = new JSONArray();
		
		for (Item item : items) {
			JSONObject obj = new JSONObject();
			obj.put("title", item.getTitle());
			obj.put("link", item.getLink());
			obj.put("image", item.getImage());
			obj.put("lprice", item.getLprice());
			obj.put("productId", item.getProductId());
			
			arr.put(obj);
		}
		
		return arr.toString();
    }


	
	@RequestMapping(value="/naverItemOk", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String naverItemOk(@RequestParam(value="keyword", required=false)String keyword,
			@RequestParam(value="checkArr") List<String> chechArr){
        
		System.out.println("키워드 : " + keyword);
		System.out.println("chechArr : " + chechArr);
		
        List<Item> items = naverItemService.searchItem(keyword, 10, 1);
		JSONArray arr = new JSONArray();
		
		for (Item item : items) {
			for(int i=0; i<chechArr.size(); i++) { 
				if(chechArr.get(i).equals(item.getProductId())) {		// 상품아이디와 같은 상품 찾기
					JSONObject obj = new JSONObject();
					obj.put("title", item.getTitle());
					obj.put("link", item.getLink());
					obj.put("image", item.getImage());
					obj.put("lprice", item.getLprice());
					obj.put("productId", item.getProductId());
					obj.put("mallName", item.getMallName());
					arr.put(obj);
				}
			}
		}
		
		System.out.println("실행후" + arr.toString());
		
		return arr.toString();
    }
	
 
}
