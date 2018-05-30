package com.bitcamp.cody;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.cody.dto.CodyDto;
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
		
		Map<Integer, Object> map = new HashMap<Integer, Object>();
		
		for(int i = 0; i<rankings.size(); i++) {
			
			map.put(rankings.get(i).getBoard_click(), rankingSerivce.getRanking());
		}
		System.out.println("전체리스트 : " + rankings.toString());
		System.out.println("map"+map.toString());
		
		model.addAttribute("rankings", rankings);
		model.addAttribute("map", map);
		
		return "home";
	}
	
}
