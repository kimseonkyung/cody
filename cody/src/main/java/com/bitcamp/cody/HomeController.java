package com.bitcamp.cody;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.service.CodyItemListService;
import com.bitcamp.cody.service.CodyTimeListService;
import com.bitcamp.cody.service.RankingSerivce;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	RankingSerivce rankingSerivce;
	@Autowired
	CodyItemListService codyItemListService;
	@Autowired
	CodyTimeListService codyTimeListService;
		
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		
		return "index";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		
		/*랭킹 출력*/
		List<CodyDto> rankings = rankingSerivce.getRanking();
		ArrayList<HashMap<Object, Object>> arr = new ArrayList<>();
		
		for(int i = 0; i<rankings.size(); i++) {
			MemberDto member = rankingSerivce.getId(rankings.get(i).getMember_idx());
			HashMap<Object, Object> map = new HashMap<Object, Object>();
			List<ItemDto> itemtime = new ArrayList<>();		
			itemtime = codyItemListService.getCodyItemList(rankings.get(i).getCody_idx());
			System.out.println("member : "+ member);
			map.put("cody_height", rankings.get(i).getCody_height() );
			map.put("cody_gender", rankings.get(i).isCody_gender() );
			map.put("cody_age", rankings.get(i).getCody_age() );
			map.put("cody_idx", rankings.get(i).getCody_idx() );
			map.put("cody_image", rankings.get(i).getCody_image() );
			map.put("member_idx", rankings.get(i).getMember_idx() );
			map.put("member_id", member.getMember_id() );
			map.put("member_photo", member.getMember_photo() );
			map.put(rankings.get(i), itemtime);
			arr.add(map);
		}	
		System.out.println("전체리스트 : " + rankings.toString());
		
		model.addAttribute("rankings", rankings);
		model.addAttribute("arr", arr);
		
		/*타임라인 출력*/
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
			map.put("codyage", time.getCody_age());
			map.put("codyheight",time.getCody_height());
			map.put("codyidx",time.getCody_idx());		
			map.put("id", member.getMember_id() );
			map.put("memberidx", time.getMember_idx() );			
			map.put("photo", member.getMember_photo() );
			map.put(time, itemtime);
			irr.add(map);		
		}
		System.out.println("irr : " + irr.toString());
		
		model.addAttribute("irr", irr);
	
		return "home";
	}
}
