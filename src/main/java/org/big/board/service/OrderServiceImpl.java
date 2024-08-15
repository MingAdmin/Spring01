package org.big.board.service;

import java.util.List;

import org.big.board.dto.OrderDto;
import org.big.board.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<OrderDto> getEnrolledCourses() throws Exception {
        return orderMapper.getEnrolledCourses();
    }
    
	/*
	 * @Override public void enrollCourse(OrderDto order) throws Exception {
	 * orderMapper.enrollCourse(order); }
	 * 
	 * @Override public void cancelCourse(int orderNo) throws Exception {
	 * orderMapper.cancelCourse(orderNo); }
	 */
}
