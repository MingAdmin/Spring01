package org.big.board.service;

import java.util.List;

import org.big.board.dto.BoardFileDto;
import org.big.board.dto.ReviewDto;

public interface ReviewService {

    List<ReviewDto> selectReviewList() throws Exception;

    void insertReview(ReviewDto review) throws Exception;

    void updateReviewHitCount(int rboardidx) throws Exception;

    ReviewDto selectReviewDetail(int rboardidx) throws Exception;

    void updateReview(ReviewDto review) throws Exception;

    void deleteReview(int rboardidx) throws Exception;

    BoardFileDto selectBoardFileInformation(int ridx, int rboardidx) throws Exception;
}
