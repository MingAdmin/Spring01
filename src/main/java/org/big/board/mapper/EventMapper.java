package org.big.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.big.board.dto.BoardFileDto;
import org.big.board.dto.EventDto;

@Mapper
public interface EventMapper {

	List<EventDto> eventselectBoardList() throws Exception;
	void EventinsertBoard(EventDto board) throws Exception;
	void EventupdateHitCount(int eboardidx) throws Exception;
	EventDto EventselectBoardDetail(int eboardidx) throws Exception;
	void EventupdateBoard(EventDto board) throws Exception;
	void EventdeleteBoard(int eboardidx) throws Exception;

	void insertBoardFileList(List<BoardFileDto> list) throws Exception;
	List<BoardFileDto> selectBoardFileList(int eboardidx) throws Exception;
	BoardFileDto selectBoardFileInformation(@Param("eidx") int eidx, @Param("eboardidx") int eboardidx);
	 
}
