package com.bitcamp.cody;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.dto.FollowDto;
import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.dto.MemberDto;
import com.bitcamp.cody.service.CodyItemListService;
import com.bitcamp.cody.service.CodyTimeListService;
import com.bitcamp.cody.service.FollowService;
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
	@Autowired
	FollowService followService;
		
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
	public String main(Locale locale, Model model, HttpSession session) {
		
		MemberDto loginInfo = (MemberDto)session.getAttribute("loginInfo");
		
		/*랭킹 출력*/
		List<CodyDto> rankings = rankingSerivce.getRanking();
		ArrayList<HashMap<Object, Object>> arr = new ArrayList<>();
		
		
		for(int i = 0; i<rankings.size(); i++) {
			HashMap<Object, Object> map = new HashMap<Object, Object>();
			List<ItemDto> itemtime = new ArrayList<>();		
			MemberDto member = rankingSerivce.getId(rankings.get(i).getMember_idx());
			FollowDto follow = new FollowDto();
			FollowDto accept = new FollowDto();
			if(loginInfo !=null) {
				follow = followService.getfollowfo(loginInfo.getMember_idx(),member.getMember_idx());
				accept = followService.accept(loginInfo.getMember_idx(),member.getMember_idx());
				if(follow != null) {
					map.put("followInfo", follow.getFollowinfo());
					map.put("followIdx", follow.getFollow_idx());
				}
				if(accept != null) {
					map.put("acceptInfo", accept.getFollowinfo());
					map.put("acceptIdx", accept.getFollow_idx());
				}
				
			}
			itemtime = codyItemListService.getCodyItemList(rankings.get(i).getCody_idx());
			map.put("cody_height", rankings.get(i).getCody_height() );
			map.put("cody_gender", rankings.get(i).isCody_gender() );
			map.put("cody_age", rankings.get(i).getCody_age() );
			map.put("cody_idx", rankings.get(i).getCody_idx() );
			map.put("cody_image", rankings.get(i).getCody_image() );
			map.put("member_idx", rankings.get(i).getMember_idx() );
			map.put("member_id", member.getMember_id() );
			map.put("member_photo", member.getMember_photo() );
			map.put(rankings.get(i), itemtime);
			map.put("follow", follow);
			map.put("accept", accept);
			arr.add(map);
		
		}	
		
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
			FollowDto follow = new FollowDto();
			FollowDto accept = new FollowDto();
			if(loginInfo !=null) {
				follow = followService.getfollowfo(loginInfo.getMember_idx(),member.getMember_idx());
				accept = followService.accept(loginInfo.getMember_idx(),member.getMember_idx());
				if(follow != null) {
					map.put("followInfo", follow.getFollowinfo());
					map.put("followIdx", follow.getFollow_idx());
				}
				if(accept != null) {
					map.put("acceptInfo", accept.getFollowinfo());
					map.put("acceptIdx", accept.getFollow_idx());
				}
				
			}
			map.put(time.getCody_idx(),itemtime);	
			map.put("codytitle",time.getCody_title());
			map.put("codyimage",time.getCody_image());
			map.put("codyage", time.getCody_age());
			map.put("codyheight",time.getCody_height());
			map.put("cody_idx",time.getCody_idx());		
			map.put("id", member.getMember_id() );
			map.put("member_idx", time.getMember_idx() );			
			map.put("photo", member.getMember_photo() );
			map.put(time, itemtime);
			map.put("follow", follow);
			map.put("accept", accept);
			irr.add(map);		
		}
		
		model.addAttribute("irr", irr);
	
		return "home";
	}
}
