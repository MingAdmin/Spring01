
package org.big.board.service;

import java.util.List;

import org.big.board.dto.QnaDto;
import org.springframework.stereotype.Service;

@Service
public interface QnaService {

    List<QnaDto> qnaSelectBoardList() throws Exception;
    void qnaInsertBoard(QnaDto board) throws Exception;
    void qnaUpdateHitCount(int qboardidx) throws Exception;
    QnaDto qnaSelectBoardDetail(int qboardidx) throws Exception;
    void qnaUpdateBoard(QnaDto board) throws Exception;
    void qnaDeleteBoard(int qboardidx) throws Exception;
}