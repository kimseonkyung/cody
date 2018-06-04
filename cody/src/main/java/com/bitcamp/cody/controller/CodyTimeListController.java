package com.bitcamp.cody.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.service.CodyItemListService;
import com.bitcamp.cody.service.CodyTimeListService;
import com.bitcamp.cody.service.RankingSerivce;

@Controller
public class CodyTimeListController {

	
	@Autowired
	RankingSerivce rankingSerivce;
	@Autowired
	CodyTimeListService codyTimeListService;
	@Autowired
	CodyItemListService codyItemListService;

	/* -------------------------------- 리스트 ------------------------------ */
	@RequestMapping("/codyTimeList")

	public String codyTimeList(Model model) {
		
		List<CodyDto> codytimes = codyTimeListService.getCodyTimeList();
		ArrayList<HashMap<Object, Object>> irr = new ArrayList<>();

		for (CodyDto time : codytimes) {	
			MemberDto member = rankingSerivce.getId(time.getMember_idx());		
			HashMap<Object, Object> map = new HashMap<>();
			List<ItemDto> itemtime = new ArrayList<>();		
			itemtime = codyItemListService.getCodyItemList(time.getCody_idx());
			map.put(time.getCody_idx(),itemtime);	
			map.put("codytitle",time.getCody_title());
			map.put("codyimage",time.getCody_image());
			map.put("id", member.getMember_id() );
			map.put("photo", member.getMember_photo() );
			map.put(time, itemtime);
			irr.add(map);		
		}
		System.out.println("irr : " + irr.toString());
		
		model.addAttribute("irr", irr);
		return "time/codyTimeList";
	}
}
