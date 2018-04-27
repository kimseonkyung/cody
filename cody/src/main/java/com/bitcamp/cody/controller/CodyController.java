package com.bitcamp.cody.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.cody.dto.CodyDto;
import com.bitcamp.cody.service.CodyService;

@Controller
@RequestMapping("/codyForm")
public class CodyController {

		@Autowired
		CodyService service;
		
		@RequestMapping(method=RequestMethod.GET)
		public String codyForm() {
			return "cody/codyForm";
		}

		@RequestMapping(method=RequestMethod.POST)
		public String codyInsert(CodyDto cody, Model model, HttpServletRequest request ) 
				throws IllegalStateException, IOException {
			// 서비스에  회원 데이터 저장 요청
			// 결과 : 1 / 0
			// model 에 저장
			System.out.println(cody);
			
			int resultCnt = service.codyInsert(cody, request);
			
			String msg = "정상적으로 등록되었습니다.";
			
			if(resultCnt == 0)
				msg = "등록이 되지 않았습니다. 담당자에게 문의 해주세요.";		
			
			model.addAttribute("msg", msg);
			
			return "cody/codyFormOk";
	}
		@ExceptionHandler(IOException.class)
		public String ex1(IOException e) {
			return "error/ex1";
		}
		
		@ExceptionHandler(IllegalStateException.class)
		public String ex2(IllegalStateException e) {
			return "error/ex2";
		}
		
	}

