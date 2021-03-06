package com.bitcamp.cody.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.FollowDto;
import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.service.CodyItemListService;
import com.bitcamp.cody.service.CodyTimeListService;
import com.bitcamp.cody.service.FollowService;
import com.bitcamp.cody.service.RankingSerivce;

@Controller
public class CodyTimeListManController {

	
	@Autowired
	RankingSerivce rankingSerivce;
	@Autowired
	CodyTimeListService codyTimeListService;
	@Autowired
	CodyItemListService codyItemListService;
	@Autowired
	FollowService requestandnresponse;

	/* -------------------------------- 리스트 ------------------------------ */
	@RequestMapping("/codyTimeListMan")

	public String codyTimeListMan(Model model,HttpSession session) {
		
		MemberDto memberse = (MemberDto) session.getAttribute("loginInfo");
		
		// int m_request = memberse.getMember_idx();
		
		List<CodyDto> codytimesM = codyTimeListService.getCodyTimeListMan();
		
		ArrayList<HashMap<Object, Object>> irrM = new ArrayList<>();

		for (CodyDto time : codytimesM) {	
			MemberDto member = rankingSerivce.getId(time.getMember_idx());
			HashMap<Object, Object> map = new HashMap<>();
			List<ItemDto> itemtime = new ArrayList<>();		
			itemtime = codyItemListService.getCodyItemList(time.getCody_idx());
		 	map.put(time.getCody_idx(),itemtime);	
			map.put("codytitle",time.getCody_title());
			map.put("codyimage",time.getCody_image());
			map.put("codyidx",time.getCody_idx());	
			map.put("codyage", time.getCody_age());
			map.put("codyheight",time.getCody_height());
			map.put("memberid", member.getMember_id());
			map.put("memberidx", time.getMember_idx());
			map.put("memberphoto", member.getMember_photo() );
			map.put(time, itemtime);
			map.put("itemtime", itemtime);
			/*if(memberse != null) {
				FollowDto request = requestandnresponse.getfollowfo(memberse.getMember_idx(),time.getMember_idx());
				map.put("followinfo",request.getFollowinfo());	
			}*/
			irrM.add(map);		
		}

		System.out.println("irrM : " + irrM.toString());
		
		
		model.addAttribute("irrM", irrM);
		return "time/codyTimeListMan";
	}
	
}
