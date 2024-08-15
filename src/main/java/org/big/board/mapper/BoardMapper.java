package org.big.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.big.board.dto.BoardDto;
import org.big.board.dto.BoardFileDto;

@Mapper
public interface BoardMapper {

	List<BoardDto> selectBoardList() throws Exception;
	void insertBoard(BoardDto board) throws Exception;
	void updateHitCount(int nboardidx) throws Exception;
	BoardDto selectBoardDetail(int nboardidx) throws Exception;
	void updateBoard(BoardDto board) throws Exception;
	void deleteBoard(int nboardidx) throws Exception;
	
	void insertBoardFileList(List<BoardFileDto> list) throws Exception;
	List<BoardFileDto> selectBoardFileList(int nboardidx) throws Exception;
	BoardFileDto selectBoardFileInformation(@Param("nidx") int nidx, @Param("nboardidx") int nboardidx);
}