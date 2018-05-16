package com.bitcamp.cody.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.service.RankingSerivce;

@Controller
public class RankingController {

	@Autowired
	RankingSerivce rankingSerivce;
	
	// 리스트
	@RequestMapping("ranking")
	public String ranking(Model model) {
		
		List<CodyDto> rankings = rankingSerivce.getRanking();
		
		Map<Integer, Object> map = new HashMap<Integer, Object>();
		
		for(int i = 0; i<rankings.size(); i++) {
			
			map.put(rankings.get(i).getBoard_click(), rankingSerivce.getRanking());
		}
		System.out.println("전체리스트 : " + rankings.toString());
		System.out.println("map"+map.toString());
		
		model.addAttribute("rankings", rankings);
		model.addAttribute("map", map);
		
		
		return "ranking/ranking";
		
		
	}
	
}
