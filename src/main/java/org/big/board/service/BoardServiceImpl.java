package org.big.board.service;

import java.util.List;

import org.big.board.common.FileUtils;
import org.big.board.dto.BoardDto;
import org.big.board.dto.BoardFileDto;
import org.big.board.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private FileUtils fileUtils;
	
	@Override
	public List<BoardDto> selectBoardList() throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.selectBoardList();
	}
	
	@Override
	public void insertBoard(BoardDto board, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		boardMapper.insertBoard(board);
		List<BoardFileDto> list = fileUtils.parseFileInfo(board.getNboardidx(), multipartHttpServletRequest);
		if(CollectionUtils.isEmpty(list) == false){
			boardMapper.insertBoardFileList(list);
		}

	}
	
	@Override
	public void updateHitCount(int nboardidx) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.updateHitCount(nboardidx);
	}
	
	@Override
	public BoardDto selectBoardDetail(int nboardidx) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.updateHitCount(nboardidx);
		BoardDto board=boardMapper.selectBoardDetail(nboardidx);
		return board;
	}
	
	@Override
	public void updateBoard(BoardDto board) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.updateBoard(board);
	}
	
	@Override
	public void deleteBoard(int nboardidx) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.deleteBoard(nboardidx);
	}
	@Override
	public BoardFileDto selectBoardFileInformation(int nidx, int nboardidx) throws Exception {
		return boardMapper.selectBoardFileInformation(nidx, nboardidx);
	}
	
}