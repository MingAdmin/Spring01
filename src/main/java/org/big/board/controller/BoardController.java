package org.big.board.controller;

import java.util.List;

import org.big.board.dto.BoardDto;
import org.big.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	@Autowired
	private BoardService BoardService;
	
	@RequestMapping("/board/index.do")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/board/test.do")
	public String test() {
		return "test";
	}
	
	@RequestMapping("/board/introduce.do")
	public String introduce() {
		return "introduce";
	}
	
	@RequestMapping("/board/map.do")
	public String map() {
		return "map";
	}
	
	@RequestMapping("/board/openBoardList.do")
	public ModelAndView openBoardList() throws Exception {
		ModelAndView mv=new ModelAndView("thymeleaf/board/boardList");
		
		List<BoardDto> list=BoardService.selectBoardList();
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping("/board/openBoardWrite.do")
	public String openBoardWrite() throws Exception {
		return "thymeleaf/board/boardWrite";
	}
	
	@RequestMapping("/board/insertBoard.do")
	public String insertBoard(BoardDto board, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		BoardService.insertBoard(board, multipartHttpServletRequest);
		return "redirect:/board/openBoardList.do";
	}
	
	@RequestMapping("/board/openBoardDetail.do")
	public ModelAndView openBoardDetail(@RequestParam int nboardidx) throws Exception {
		ModelAndView mv=new ModelAndView("thymeleaf/board/boardDetail");
		BoardDto board=BoardService.selectBoardDetail(nboardidx);
		mv.addObject("board", board);
		return mv;
	}
	
	@RequestMapping("/board/updateBoard.do")
	public String updateBoard(BoardDto board) throws Exception {
		BoardService.updateBoard(board);
		return "redirect:/board/openBoardList.do";
	}
	
	@RequestMapping("/board/deleteBoard.do")
	public String deleteBoard(int nboardidx) throws Exception {
		BoardService.deleteBoard(nboardidx);
		return "redirect:/board/openBoardList.do";
	}
}