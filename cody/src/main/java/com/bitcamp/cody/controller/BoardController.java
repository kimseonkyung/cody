package com.bitcamp.cody.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.cody.dto.BoardDto;
import com.bitcamp.cody.dto.PageDto;
import com.bitcamp.cody.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	// 게시글 목록
	@RequestMapping("/boardList")
	public String boardList(Model model, HttpServletRequest req) {

		int currentPageNo = 1; // /(localhost:8080)페이지로 오면 처음에 표시할 페이지 (1 = 첫번째 페이지)
		int maxPost = 5; // 페이지당 표시될 게시물 최대 갯수

		if (req.getParameter("pages") != null) // 게시물이 1개도없으면(=페이지가 생성이 안되었으면)이 아니라면 == 페이징이 생성되었다면
			currentPageNo = Integer.parseInt(req.getParameter("pages")); // pages에있는 string 타입 변수를 int형으로 바꾸어서
																			// currentPageNo에 담는다.

		PageDto paging = new PageDto(currentPageNo, maxPost); // Paging.java에있는 currentPageNo, maxPost를 paging변수에 담는다.

		int offset = (paging.getCurrentPageNo() - 1) * paging.getMaxPost(); // query.xml에서 select를 할때 사용하기위한 offset 변수의
																			// 선언.
		int noOfRecords = paging.getMaxPost();
		int totalCnt = boardService.totalCount();
		// 현재 3페이지 이고, 그 페이지에 게시물이 10개가 있다면 offset값은 (3-1) * 10 = 20이 된다.

		/*
		 * 중요공지사항을 사용하기 위한 것 ArrayList<WriteInfo> infolist = new ArrayList<WriteInfo>();
		 * infolist = (ArrayList<WriteInfo>) writeService.writeInfoList();
		 */
		List<BoardDto> page = boardService.listAll(offset, noOfRecords);

		paging.setNumberOfRecords(totalCnt); // 페이지를 표시하기 위해 전체 게시물 수를 파악하기 위한것
		paging.makePaging(); //

		// model.addAttribute("infolist", infolist); 중요 공지사항을 사용하기 위한 것.
		model.addAttribute("paging", paging);
		model.addAttribute("page", page);
		model.addAttribute("offset", offset);
		model.addAttribute("noOfRecords", noOfRecords);
		model.addAttribute("totalCnt", totalCnt);

		return "board/boardList";
	}

	// 게시글 작성화면
	@RequestMapping("/boardForm")
	public String boardWrite() {
		return "board/boardForm";
	}

	// 게시글 입력하기
	@RequestMapping("/boardInsert")
	public String Write(HttpSession session, @RequestParam String title, @RequestParam String content,
			@RequestParam String man_idx) throws Exception {
		String page = "redirect:/boardList";
		String user = "관리자";
		// String user = (String) session.getAttribute("id");

		/* if(user != null){ */
		HashMap<String, String> insertValue = new HashMap<String, String>();
		insertValue.put("title", title); // 글 제목
		insertValue.put("content", content.replaceAll("\r\n", "<br>"));// .replaceAll("\r\n", "<br>")
		insertValue.put("name", user); // 작성자
		insertValue.put("idx", man_idx);
		boardService.boardInsert(insertValue); // insert.Service는 InsertService.impl에 선언할 @Service(insertService)이고,
												// insertPost는 query.xml에 정의한 insert 쿼리의 id값.
		/*
		 * }else if (user== null) { page ="redirect:/boardList"; }
		 */

		return page;
	}

	// 게시글 상세보기
	@RequestMapping("/boardListView")
	public String listView(Model model, @RequestParam("board_idx") int idx, @RequestParam("board_click") int count) {

		// 게시글 조회수 증가
		HashMap<String, Object> countPlus = new HashMap<String, Object>();
		countPlus.put("idx", idx);
		countPlus.put("count", count);
		boardService.countAdd(countPlus);

		// 상세보기
		BoardDto board = boardService.getListView(idx);

		System.out.println("상세보기 : " + board.toString());
		model.addAttribute("board", board);

		return "board/boardListView";
	}

	// 게시글 수정화면
	@RequestMapping("/boardUpdateForm")
	public String boardUpdateForm(Model model, BoardDto board) {

		model.addAttribute("board", board);

		return "board/boardUpdateForm";
	}

	// 게시글 수정하기
	@RequestMapping("/boardUpdate")
	public String boardUpdate(Model model, BoardDto board) {

		int resultCnt = boardService.boardUpdate(board);

		System.out.println("오케이!!");
		return "board/boardList";
	}

	// 게시글 삭제하기
	@RequestMapping("/boardDelete")
	@ResponseBody
	public String boardDelete(Model model, @RequestParam("board_idx") int idx) {

		int resultCnt = boardService.boardDelete(idx);


		return "board/boardList";

	}

}
