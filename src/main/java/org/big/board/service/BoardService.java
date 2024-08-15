package org.big.board.service;

import java.util.List;

import org.big.board.dto.BoardDto;
import org.big.board.dto.BoardFileDto;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface BoardService {

	List<BoardDto> selectBoardList() throws Exception;
	void insertBoard(BoardDto board, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception;
	void updateHitCount(int nboardidx) throws Exception;
	BoardDto selectBoardDetail(int nboardidx) throws Exception;
	void updateBoard(BoardDto board) throws Exception;
	void deleteBoard(int nboardidx) throws Exception;
	
	BoardFileDto selectBoardFileInformation(int nidx, int nboardidx) throws Exception;
	 
	
}