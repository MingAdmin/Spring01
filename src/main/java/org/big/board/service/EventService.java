
package org.big.board.service;

import java.util.List;

import org.big.board.dto.BoardFileDto;
import org.big.board.dto.EventDto;
import org.springframework.stereotype.Service;

@Service
public interface EventService {

	List<EventDto> eventselectBoardList() throws Exception;

	void eventinsertBoard(EventDto board) throws Exception;

	void eventupdateHitCount(int eboardidx) throws Exception;

	EventDto eventselectBoardDetail(int eboardidx) throws Exception;

	void eventupdateBoard(EventDto board) throws Exception;

	void eventdeleteBoard(int eboardidx) throws Exception;

	BoardFileDto selectBoardFileInformation(int eidx, int eboardidx) throws Exception;

}
