package org.big.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.big.board.dto.BoardFileDto;
import org.big.board.dto.ReviewDto;

@Mapper
public interface ReviewMapper {

    List<ReviewDto> selectReviewList() throws Exception;

    void insertReview(ReviewDto review) throws Exception;

    void updateReviewHitCount(int rboardidx) throws Exception;

    ReviewDto selectReviewDetail(int rboardidx) throws Exception;

    void updateReview(ReviewDto review) throws Exception;

    void deleteReview(int rboardidx) throws Exception;

    void insertBoardFileList(List<BoardFileDto> list) throws Exception;

    List<BoardFileDto> selectBoardFileList(int rboardidx) throws Exception;

    BoardFileDto selectBoardFileInformation(@Param("ridx") int ridx, @Param("rboardidx") int rboardidx);
}
