package org.big.board.service;

import java.util.List;

import org.big.board.dto.QnaDto;
import org.big.board.mapper.QnaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class QnaServiceImpl implements QnaService {

    @Autowired
    private QnaMapper qnaMapper;

    @Override
    public List<QnaDto> qnaSelectBoardList() throws Exception {
        return qnaMapper.qnaSelectBoardList();
    }

    @Override
    public void qnaInsertBoard(QnaDto board) throws Exception {
        qnaMapper.qnaInsertBoard(board);
    }

    @Override
    public void qnaUpdateHitCount(int qboardidx) throws Exception {
        qnaMapper.qnaUpdateHitCount(qboardidx);
    }

    @Override
    public QnaDto qnaSelectBoardDetail(int qboardidx) throws Exception {
        qnaUpdateHitCount(qboardidx);
        QnaDto board = qnaMapper.qnaSelectBoardDetail(qboardidx);
        return board;
    }

    @Override
    public void qnaUpdateBoard(QnaDto board) throws Exception {
        qnaMapper.qnaUpdateBoard(board);
    }

    @Override
    public void qnaDeleteBoard(int qboardidx) throws Exception {
        qnaMapper.qnaDeleteBoard(qboardidx);
    }
}
