package org.big.board.controller;

import java.util.List;

import org.big.board.dto.OrderDto;
import org.big.board.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	@RequestMapping("/orders/orderList.do")
	public ModelAndView openOrderList() throws Exception {
		ModelAndView mv = new ModelAndView("thymeleaf/order/orderList");

		List<OrderDto> list = orderService.getEnrolledCourses();
		mv.addObject("list", list);
		return mv;
	}

	/*
	 * @RequestMapping("/orders/orderEnroll.do") public String openOrderEnroll()
	 * throws Exception { return "thymeleaf/orders/orderEnroll"; }
	 * 
	 * @RequestMapping("/orders/insertOrder.do") public String insertOrder(OrderDto
	 * order) throws Exception { orderService.enrollCourse(order); return
	 * "redirect:/orders/orderList.do"; }
	 * 
	 * @RequestMapping("/orders/orderDetail.do") public ModelAndView
	 * openOrderDetail(@RequestParam int orderNo) throws Exception { ModelAndView mv
	 * = new ModelAndView("thymeleaf/orders/orderDetail"); OrderDto order =
	 * orderService.selectOrderDetail(orderNo); mv.addObject("order", order); return
	 * mv; }
	 * 
	 * @RequestMapping("/orders/cancelOrder.do") public String cancelOrder(int
	 * orderNo) throws Exception { orderService.cancelCourse(orderNo); return
	 * "redirect:/orders/orderList.do"; }
	 */
}
