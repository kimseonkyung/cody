package com.bitcamp.cody.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.cody.dto.ItemDto;
import com.bitcamp.cody.dto.Notice_allDto;
import com.bitcamp.cody.service.BoardService;

@Controller
public class NoticeController {

	@Autowired
	BoardService boardService;

	
	// 게시글 목록
	public String boardList(Model model) {
		List<Notice_allDto> list = boardService.listAll();
		
		model.addAttribute("list",list);
		
		return "";
	}
	
	// 게시글 작성화면
	public String boardWrite() {
		return "";
	}
	
	// 게시글 입력하기
	public String boardInsert(Notice_allDto notiAll, Model model ) {
		
		int resultCnt = boardService.boardInsert(notiAll);
		
		String msg = "입력이 정상적으로 처리되었습니다.";

		if (resultCnt == 0)
			msg = "입력 처리가 되지 않았습니다. 담당자에게 문의 해주세요.";

		model.addAttribute("msg", msg);
		
		return "";
	}
	

	
	
	// 게시글 상세보기
	public String listView(Model model, @RequestParam("notice_idx") int idx, @RequestParam("board_click") int count) {

		// 게시글 조회수 증가
		boardService.countAdd(count, idx);
		
		Notice_allDto notiAll = boardService.getListView(idx);
		

		System.out.println("상세보기 : " + notiAll.toString());
		model.addAttribute("notiAll", notiAll);

		return "";
	}
	
	
	// 게시글 수정하기
	public int boardUpdate(Model model, Notice_allDto notiAll) {

		int resultCnt = boardService.boardUpdate(notiAll);

		String msg = "게시글수정 완료";

		if (resultCnt == 0)
			msg = "게시글수정 실패";

		model.addAttribute("msg", msg);

		return resultCnt;
	}
	
	
	// 게시글 삭제하기
	public String boardDelete(Model model, @RequestParam("notice_idx") int idx) {

		int resultCnt = boardService.boardDelete(idx);

		String msg = "게시글삭제 완료";

		if (resultCnt == 0)
			msg = "게시글삭제 실패";

		model.addAttribute("msg", msg);

		return "cody/itemFormOk";

	}   
	
	
}
