package org.big.board.controller;

import java.util.List;

import org.big.board.dto.EventDto;
import org.big.board.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EventController {

	@Autowired
	private EventService eventService;

	@RequestMapping("/event/eventList.do")
	public ModelAndView eventopenBoardList() throws Exception {
		ModelAndView mv = new ModelAndView("thymeleaf/event/eventList");

		List<EventDto> list = eventService.eventselectBoardList();
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping("/event/eventWrite.do")
	public String eventopenBoardWrite() throws Exception {
		return "thymeleaf/event/eventWrite";
	}

	@RequestMapping("/event/eventinsert.do")
    public String eventinsertBoard(EventDto eventboard) throws Exception {
        eventService.eventinsertBoard(eventboard);
        return "redirect:/event/eventList.do";
    }

	@RequestMapping("/event/eventDetail.do")
	public ModelAndView eventopenBoardDetail(@RequestParam int eboardidx) throws Exception {
		ModelAndView mv = new ModelAndView("thymeleaf/event/eventDetail");
		EventDto board = eventService.eventselectBoardDetail(eboardidx);
		mv.addObject("board", board);
		return mv;
	}

	@RequestMapping("/event/eventupdate.do")
	public String updateBoard(EventDto board) throws Exception {
		eventService.eventupdateBoard(board);
		return "redirect:/event/eventList.do";
	}

	@RequestMapping("/event/deleteBoard.do")
	public String deleteBoard(int eboardidx) throws Exception {
		eventService.eventdeleteBoard(eboardidx);
		return "redirect:/event/eventList.do";
	}
}
