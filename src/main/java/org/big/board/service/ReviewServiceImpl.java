package org.big.board.service;

import java.util.List;

import org.big.board.dto.BoardFileDto;
import org.big.board.dto.ReviewDto;
import org.big.board.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewMapper reviewMapper;

    @Override
    public List<ReviewDto> selectReviewList() throws Exception {
        return reviewMapper.selectReviewList();
    }

    @Override
    public void insertReview(ReviewDto review) throws Exception {
        reviewMapper.insertReview(review);
    }

    @Override
    public void updateReviewHitCount(int rboardidx) throws Exception {
        reviewMapper.updateReviewHitCount(rboardidx);
    }

    @Override
    public ReviewDto selectReviewDetail(int rboardidx) throws Exception {
        updateReviewHitCount(rboardidx);
        return reviewMapper.selectReviewDetail(rboardidx);
    }

    @Override
    public void updateReview(ReviewDto review) throws Exception {
        reviewMapper.updateReview(review);
    }

    @Override
    public void deleteReview(int rboardidx) throws Exception {
        reviewMapper.deleteReview(rboardidx);
    }

    @Override
    public BoardFileDto selectBoardFileInformation(int ridx, int rboardidx) throws Exception {
        return reviewMapper.selectBoardFileInformation(ridx, rboardidx);
    }
}
