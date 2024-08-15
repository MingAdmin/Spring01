package org.big.board.service;

import java.util.List;

import org.big.board.dto.OrderDto;
import org.springframework.stereotype.Service;

@Service
public interface OrderService {

    List<OrderDto> getEnrolledCourses() throws Exception;
	/*
	 * void enrollCourse(OrderDto order) throws Exception; void cancelCourse(int
	 * orderNo) throws Exception;
	 */

}