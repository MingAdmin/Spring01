
package org.big.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.big.board.dto.QnaDto;

@Mapper
public interface QnaMapper {

	List<QnaDto> qnaSelectBoardList() throws Exception;
	void qnaInsertBoard(QnaDto board) throws Exception;
	void qnaUpdateHitCount(int qboardidx) throws Exception;
	QnaDto qnaSelectBoardDetail(int qboardidx) throws Exception;
	void qnaUpdateBoard(QnaDto board) throws Exception;
	void qnaDeleteBoard(int qboardidx) throws Exception;
}