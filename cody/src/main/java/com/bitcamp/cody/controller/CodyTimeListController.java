package com.bitcamp.cody.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.service.CodyItemListService;
import com.bitcamp.cody.service.CodyTimeListService;

@Controller
public class CodyTimeListController {

	@Autowired
	CodyTimeListService codyTimeListService;

	@Autowired
	CodyItemListService codyItemListService;

	/* -------------------------------- 리스트 ------------------------------ */
	@RequestMapping("/codyTimeList")	
	
	public String codyTimeList(Model model){

		List<CodyDto> codytimes = codyTimeListService.getCodyTimeList();
		
		Map<Integer, Object> map = new HashMap<Integer,Object>();
		
		for(int i= 0; i<codytimes.size(); i++) {
			
		  map.put(codytimes.get(i).getCody_idx(), codyItemListService.getCodyItemList(codytimes.get(i).getCody_idx()));	  
		}	
		System.out.println("전체리스트 : " + codytimes.toString());
		System.out.println("map" + map.toString());
		
		model.addAttribute("codytimes",codytimes);
		model.addAttribute("map",map);
		 
		return "time/codyTimeList";
	}
}
 