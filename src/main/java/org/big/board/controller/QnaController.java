package org.big.board.controller;

import java.util.List;

import org.big.board.dto.QnaDto;
import org.big.board.service.QnaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QnaController {

    @Autowired
    private QnaService qnaService;

    @RequestMapping("/qna/qnaList.do")
    public ModelAndView qnaOpenBoardList() throws Exception {
        ModelAndView mv = new ModelAndView("thymeleaf/qna/qnaList");

        List<QnaDto> list = qnaService.qnaSelectBoardList();
        mv.addObject("list", list);
        return mv;
    }

    @RequestMapping("/qna/qnaWrite.do")
    public String qnaOpenBoardWrite() throws Exception {
        return "thymeleaf/qna/qnaWrite";
    }

    @RequestMapping("/qna/qnaInsert.do")
    public String qnaInsertBoard(QnaDto qnaboard) throws Exception {
        qnaService.qnaInsertBoard(qnaboard);
        return "redirect:/qna/qnaList.do";
    }

    @RequestMapping("/qna/qnaDetail.do")
    public ModelAndView qnaOpenBoardDetail(int qboardidx) throws Exception {
        ModelAndView mv = new ModelAndView("thymeleaf/qna/qnaDetail");
        QnaDto board = qnaService.qnaSelectBoardDetail(qboardidx);
        mv.addObject("board", board);
        return mv;
    }

    @RequestMapping("/qna/qnaUpdate.do")
    public String updateBoard(QnaDto board) throws Exception {
        qnaService.qnaUpdateBoard(board);
        return "redirect:/qna/qnaList.do";
    }

    @RequestMapping("/qna/deleteBoard.do")
    public String deleteBoard(int qboardidx) throws Exception {
        qnaService.qnaDeleteBoard(qboardidx);
        return "redirect:/qna/qnaList.do";
    }
}
