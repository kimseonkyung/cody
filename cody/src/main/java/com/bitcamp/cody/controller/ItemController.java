package com.bitcamp.cody.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.service.ItemListService;
import com.bitcamp.cody.service.ItemService;
import com.bitcamp.cody.service.MemberService;
import com.bitcamp.cody.service.NeverItemService;

@Controller
public class ItemController {

	@Autowired
	ItemService itemService;
	@Autowired
	ItemListService itemListService;
	@Autowired
	NeverItemService naverItemService; 
	@Autowired
	MemberService memberService; 



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
	@RequestMapping(value="/itemListMan", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String itemListMan(Model model) {

		List<ItemDto> items = itemListService.getItemListMan();
        JSONArray arr = new JSONArray();
		
		for (ItemDto item : items) {
			JSONObject obj = new JSONObject();
			obj.put("item_idx", item.getItem_idx());
			obj.put("item_image", item.getItem_image());
			obj.put("item_name", item.getItem_name());
			obj.put("item_category", item.getItem_category());
			obj.put("item_price", item.getItem_price());
			obj.put("item_link", item.getItem_link());
			arr.put(obj);
		}
		
		System.out.println("arr : " + arr);
		
		return arr.toString();
	}
	@RequestMapping(value="/itemListWoman", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String itemListWoman(Model model) {
		
		List<ItemDto> items = itemListService.getItemListWoman();
        JSONArray arr = new JSONArray();
		
		for (ItemDto item : items) {
			JSONObject obj = new JSONObject();
			obj.put("item_idx", item.getItem_idx());
			obj.put("item_image", item.getItem_image());
			obj.put("item_name", item.getItem_name());
			obj.put("item_category", item.getItem_category());
			obj.put("item_price", item.getItem_price());
			obj.put("item_link", item.getItem_link());
			arr.put(obj);
		}
		
		System.out.println("arr : " + arr);
		
		return arr.toString();
	}
	@RequestMapping("/itemListCap")
	public String itemListCap(Model model) {

		List<ItemDto> items = itemListService.getItemListCap();

		
		System.out.println("전체리스트 : " + items.toString());
		model.addAttribute("items", items);

		return "item/itemListCap";
	}
	@RequestMapping(value="/itemListCapMan", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String itemListCapMan(Model model) {

		List<ItemDto> items = itemListService.getItemListCapMan();
        JSONArray arr = new JSONArray();
		
		for (ItemDto item : items) {
			JSONObject obj = new JSONObject();
			obj.put("item_idx", item.getItem_idx());
			obj.put("item_image", item.getItem_image());
			obj.put("item_name", item.getItem_name());
			obj.put("item_category", item.getItem_category());
			obj.put("item_price", item.getItem_price());
			obj.put("item_link", item.getItem_link());
			arr.put(obj);
		}
		
		System.out.println("arr : " + arr);
		
		return arr.toString();
	}
	@RequestMapping(value="/itemListCapWoman", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String itemListCapWoman(Model model) {

		List<ItemDto> items = itemListService.getItemListCapWoman();
        JSONArray arr = new JSONArray();
		
        for (ItemDto item : items) {
			JSONObject obj = new JSONObject();
			obj.put("item_idx", item.getItem_idx());
			obj.put("item_image", item.getItem_image());
			obj.put("item_name", item.getItem_name());
			obj.put("item_category", item.getItem_category());
			obj.put("item_price", item.getItem_price());
			obj.put("item_link", item.getItem_link());
			arr.put(obj);
		}
		
		System.out.println("arr : " + arr);
		
		return arr.toString();
	}
	@RequestMapping("/itemListTop")
	public String itemListTop(Model model) {

		List<ItemDto> items = itemListService.getItemListTop();

		
		System.out.println("전체리스트 : " + items.toString());
		model.addAttribute("items", items);

		return "item/itemListTop";
	}
	@RequestMapping(value="/itemListTopMan", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String itemListTopMan(Model model) {

		List<ItemDto> items = itemListService.getItemListTopMan();
		JSONArray arr = new JSONArray();
		
		for (ItemDto item : items) {
			JSONObject obj = new JSONObject();
			obj.put("item_idx", item.getItem_idx());
			obj.put("item_image", item.getItem_image());
			obj.put("item_name", item.getItem_name());
			obj.put("item_category", item.getItem_category());
			obj.put("item_price", item.getItem_price());
			obj.put("item_link", item.getItem_link());
			arr.put(obj);
		}
		
		System.out.println("arr : " + arr);
		
		return arr.toString();
	}
	@RequestMapping(value="/itemListTopWoman", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String itemListTopWoman(Model model) {

		List<ItemDto> items = itemListService.getItemListTopWoman();
		JSONArray arr = new JSONArray();
		
		for (ItemDto item : items) {
			JSONObject obj = new JSONObject();
			obj.put("item_idx", item.getItem_idx());
			obj.put("item_image", item.getItem_image());
			obj.put("item_name", item.getItem_name());
			obj.put("item_category", item.getItem_category());
			obj.put("item_price", item.getItem_price());
			obj.put("item_link", item.getItem_link());
			arr.put(obj);
		}
		
		System.out.println("arr : " + arr);
		
		return arr.toString();
	}
	@RequestMapping("/itemListBot")
	public String itemListBot(Model model) {

		List<ItemDto> items = itemListService.getItemListBot();

		
		System.out.println("전체리스트 : " + items.toString());
		model.addAttribute("items", items);

		return "item/itemListBot";
	}
	@RequestMapping(value="/itemListBotMan", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String itemListBotMan(Model model) {

		List<ItemDto> items = itemListService.getItemListBotMan();
		JSONArray arr = new JSONArray();
		
		for (ItemDto item : items) {
			JSONObject obj = new JSONObject();
			obj.put("item_idx", item.getItem_idx());
			obj.put("item_image", item.getItem_image());
			obj.put("item_name", item.getItem_name());
			obj.put("item_category", item.getItem_category());
			obj.put("item_price", item.getItem_price());
			obj.put("item_link", item.getItem_link());
			arr.put(obj);
		}
		
		System.out.println("arr : " + arr);
		
		return arr.toString();
	}
	@RequestMapping(value="/itemListBotWoman", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String itemListBotWoman(Model model) {

		List<ItemDto> items = itemListService.getItemListBotWoman();
		JSONArray arr = new JSONArray();
		
		for (ItemDto item : items) {
			JSONObject obj = new JSONObject();
			obj.put("item_idx", item.getItem_idx());
			obj.put("item_image", item.getItem_image());
			obj.put("item_name", item.getItem_name());
			obj.put("item_category", item.getItem_category());
			obj.put("item_price", item.getItem_price());
			obj.put("item_link", item.getItem_link());
			arr.put(obj);
		}
		
		System.out.println("arr : " + arr);
		
		return arr.toString();
	}
	@RequestMapping("/itemListOut")
	public String itemListOut(Model model) {

		List<ItemDto> items = itemListService.getItemListOut();

		
		System.out.println("전체리스트 : " + items.toString());
		model.addAttribute("items", items);

		return "item/itemListOut";
	}
	@RequestMapping(value="/itemListOutMan", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String itemListOutMan(Model model) {

		List<ItemDto> items = itemListService.getItemListOutMan();
		JSONArray arr = new JSONArray();
		
		for (ItemDto item : items) {
			JSONObject obj = new JSONObject();
			obj.put("item_idx", item.getItem_idx());
			obj.put("item_image", item.getItem_image());
			obj.put("item_name", item.getItem_name());
			obj.put("item_category", item.getItem_category());
			obj.put("item_price", item.getItem_price());
			obj.put("item_link", item.getItem_link());
			arr.put(obj);
		}
		
		System.out.println("arr : " + arr);
		
		return arr.toString();
	}
	@RequestMapping(value="/itemListOutWoman", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String itemListOutWoman(Model model) {

		List<ItemDto> items = itemListService.getItemListOutWoman();
		JSONArray arr = new JSONArray();
		
		for (ItemDto item : items) {
			JSONObject obj = new JSONObject();
			obj.put("item_idx", item.getItem_idx());
			obj.put("item_image", item.getItem_image());
			obj.put("item_name", item.getItem_name());
			obj.put("item_category", item.getItem_category());
			obj.put("item_price", item.getItem_price());
			obj.put("item_link", item.getItem_link());
			arr.put(obj);
		}
		
		System.out.println("arr : " + arr);
		
		return arr.toString();
	}
	@RequestMapping("/itemListShoe")
	public String itemListShoe(Model model) {

		List<ItemDto> items = itemListService.getItemListShoe();

		
		System.out.println("전체리스트 : " + items.toString());
		model.addAttribute("items", items);

		return "item/itemListShoe";
	}
	@RequestMapping(value="/itemListShoeMan", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String itemListShoeMan(Model model) {

		List<ItemDto> items = itemListService.getItemListShoeMan();
		JSONArray arr = new JSONArray();
		
		for (ItemDto item : items) {
			JSONObject obj = new JSONObject();
			obj.put("item_idx", item.getItem_idx());
			obj.put("item_image", item.getItem_image());
			obj.put("item_name", item.getItem_name());
			obj.put("item_category", item.getItem_category());
			obj.put("item_price", item.getItem_price());
			obj.put("item_link", item.getItem_link());
			arr.put(obj);
		}
		
		System.out.println("arr : " + arr);
		
		return arr.toString();
	}
	@RequestMapping(value="/itemListShoeWoman", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String itemListShoeWoman(Model model) {

		List<ItemDto> items = itemListService.getItemListShoeWoman();
		JSONArray arr = new JSONArray();
		
		for (ItemDto item : items) {
			JSONObject obj = new JSONObject();
			obj.put("item_idx", item.getItem_idx());
			obj.put("item_image", item.getItem_image());
			obj.put("item_name", item.getItem_name());
			obj.put("item_category", item.getItem_category());
			obj.put("item_price", item.getItem_price());
			obj.put("item_link", item.getItem_link());
			arr.put(obj);
		}
		
		System.out.println("arr : " + arr);
		
		return arr.toString();
	}
	@RequestMapping("/itemListAcc")
	public String itemListAcc(Model model) {

		List<ItemDto> items = itemListService.getItemListAcc();

		
		System.out.println("전체리스트 : " + items.toString());
		model.addAttribute("items", items);

		return "item/itemListAcc";
	}
	@RequestMapping(value="/itemListAccMan", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String itemListAccMan(Model model) {

		List<ItemDto> items = itemListService.getItemListAccMan();
		JSONArray arr = new JSONArray();
		
		for (ItemDto item : items) {
			JSONObject obj = new JSONObject();
			obj.put("item_idx", item.getItem_idx());
			obj.put("item_image", item.getItem_image());
			obj.put("item_name", item.getItem_name());
			obj.put("item_category", item.getItem_category());
			obj.put("item_price", item.getItem_price());
			obj.put("item_link", item.getItem_link());
			arr.put(obj);
		}
		
		System.out.println("arr : " + arr);
		
		return arr.toString();
	}
	@RequestMapping(value="/itemListAccWoman", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String itemListAccWoman(Model model) {

		List<ItemDto> items = itemListService.getItemListAccWoman();
		JSONArray arr = new JSONArray();
		
		for (ItemDto item : items) {
			JSONObject obj = new JSONObject();
			obj.put("item_idx", item.getItem_idx());
			obj.put("item_image", item.getItem_image());
			obj.put("item_name", item.getItem_name());
			obj.put("item_category", item.getItem_category());
			obj.put("item_price", item.getItem_price());
			obj.put("item_link", item.getItem_link());
			arr.put(obj);
		}
		
		System.out.println("arr : " + arr);
		
		return arr.toString();
	}
	
	@RequestMapping("/itemListView")
	public String listView(Model model, @RequestParam("item_idx") int idx) {

		ItemDto item = itemListService.getListView(idx);
		// 아이템주인 정보 가져오기
		MemberDto member = memberService.selectByIdx(item.getMember_idx());

		System.out.println("상세보기 : " + item.toString());
		model.addAttribute("item", item);
		model.addAttribute("member", member);

		return "item/itemListView";
	}

	/*@RequestMapping("/itemSearch")
	public String listSearch(Model model, @RequestParam("item_name") String name) {

		List<ItemDto> items = itemListService.getListSearch(name);

		System.out.println("검색 : " + items.toString());
		model.addAttribute("items", items);

		return "item/itemFormOk";
	}
*/
	/*-------------------------------- 수정 ------------------------------*/
	@RequestMapping("itemUpdate")
	public String itemUpdate(ItemDto item, Model model)
			throws IllegalStateException, IOException {

		int resultCnt = itemService.itemUpdate(item);

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
	// 아이템 검색
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

	// 아이템 선택후 확인
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
