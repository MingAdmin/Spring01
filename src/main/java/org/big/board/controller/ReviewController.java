package org.big.board.controller;

import java.util.List;

import org.big.board.dto.ReviewDto;
import org.big.board.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    @RequestMapping("/review/reviewList.do")
    public ModelAndView reviewopenBoardList() throws Exception {
        ModelAndView mv = new ModelAndView("thymeleaf/review/reviewList");

        List<ReviewDto> list = reviewService.selectReviewList();
        mv.addObject("list", list);
        return mv;
    }

    @RequestMapping("/review/reviewWrite.do")
    public String reviewopenBoardWrite() throws Exception {
        return "thymeleaf/review/reviewWrite";
    }

    @RequestMapping("/review/insertReview.do")
    public String insertReview(ReviewDto reviewboard) throws Exception {
        reviewService.insertReview(reviewboard);
        return "redirect:/review/reviewList.do";
    }

    @RequestMapping("/review/reviewDetail.do")
    public ModelAndView reviewopenBoardDetail(@RequestParam int rboardidx) throws Exception {
        ModelAndView mv = new ModelAndView("thymeleaf/review/reviewDetail");
        ReviewDto review = reviewService.selectReviewDetail(rboardidx);
        mv.addObject("review", review); 
        return mv;
    }

    @RequestMapping("/review/updateReview.do")
    public String updateReview(ReviewDto board) throws Exception {
        reviewService.updateReview(board);
        return "redirect:/review/reviewList.do";
    }

    @RequestMapping("/review/deleteReview.do")
    public String deleteReview(int rboardidx) throws Exception {
        reviewService.deleteReview(rboardidx);
        return "redirect:/review/reviewList.do";
    }
}
