package org.big.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.big.board.dto.OrderDto;

@Mapper
public interface OrderMapper {

    List<OrderDto> getEnrolledCourses() throws Exception;
	/*
	 * void enrollCourse(OrderDto order) throws Exception; void cancelCourse(int
	 * orderNo) throws Exception;
	 */

}