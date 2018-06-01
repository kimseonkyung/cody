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
import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.service.RankingSerivce;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	RankingSerivce rankingSerivce;
	
	
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
		
        /*랭킹 출력*/
		List<CodyDto> rankings = rankingSerivce.getRanking();
		ArrayList<HashMap<String, Object>> arr = new ArrayList<>();
			
		
		for(int i = 0; i<rankings.size(); i++) {
			MemberDto member = rankingSerivce.getId(rankings.get(i).getMember_idx());
			HashMap<String, Object> map = new HashMap<String, Object>();
			System.out.println("member : "+ member);
			map.put("cody_height", rankings.get(i).getCody_height() );
			map.put("cody_gender", rankings.get(i).isCody_gender() );
			map.put("cody_age", rankings.get(i).getCody_age() );
			map.put("cody_idx", rankings.get(i).getCody_idx() );
			map.put("cody_image", rankings.get(i).getCody_image() );
			map.put("id", member.getMember_id() );
			arr.add(map);
		}		
			
		System.out.println("전체리스트 : " + rankings.toString());
		
		
		
		model.addAttribute("rankings", rankings);
		model.addAttribute("arr", arr);
		
		return "home";
	}
	
}
