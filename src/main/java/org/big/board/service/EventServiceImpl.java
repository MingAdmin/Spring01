package org.big.board.service;

import java.util.List;

import org.big.board.dto.BoardFileDto;
import org.big.board.dto.EventDto;
import org.big.board.mapper.EventMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class EventServiceImpl implements EventService {

	@Autowired
	private EventMapper eventMapper;

	@Override
	public List<EventDto> eventselectBoardList() throws Exception {
		return eventMapper.eventselectBoardList();
	}

	@Override
    public void eventinsertBoard(EventDto board) throws Exception {
        eventMapper.EventinsertBoard(board);
    }

	@Override
	public void eventupdateHitCount(int eboardidx) throws Exception {
		eventMapper.EventupdateHitCount(eboardidx);
	}

	@Override
	public EventDto eventselectBoardDetail(int eboardidx) throws Exception {
		eventupdateHitCount(eboardidx);
		EventDto board = eventMapper.EventselectBoardDetail(eboardidx);
		return board;
	}

	@Override
	public void eventupdateBoard(EventDto board) throws Exception {
		eventMapper.EventupdateBoard(board);
	}

	@Override
	public void eventdeleteBoard(int eboardidx) throws Exception {
		eventMapper.EventdeleteBoard(eboardidx);
	}

	
	@Override public BoardFileDto selectBoardFileInformation(int eidx, int
	eboardidx) throws Exception { return
	eventMapper.selectBoardFileInformation(eidx, eboardidx); }
	 
}
