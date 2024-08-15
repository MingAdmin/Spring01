package org.big.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerController {
	
	@RequestMapping("/customer/regist.do")
	public String regist() {
		return "customer/regist";
	}
	@RequestMapping("/customer/regist_ok.do")
    public String regist_ok(HttpServletRequest request) {
        return "customer/regist_ok";
    }
	@RequestMapping("/customer/idsearch.do")
	public String idsearch() {
		return "customer/idsearch";	
	}
	@RequestMapping("/customer/idsearch_ok.do")
    public String idsearch_ok(HttpServletRequest request) {
        return "customer/idsearch_ok";
	}
	@RequestMapping("/customer/list.do")
	public String list() {
		return "customer/list";	
	}
	@RequestMapping("/customer/joinexplanation.do")
	public String joinexplanation() {
		return "customer/joinexplanation";
	}
	@RequestMapping("/customer/jusoPopup.do")
	public String jusoPopup() {
		return "customer/jusoPopup";	
	}
	@RequestMapping("/customer/edit.do")
	public String edit() {
		return "customer/edit";	
	}
	@RequestMapping("/customer/edit_ok.do")
	public String edit_ok() {
		return "customer/edit_ok";
	}
	@RequestMapping("/customer/delete.do")
	public String delete() {
		return "customer/delete";	
	}
	@RequestMapping("/customer/delete_ok.do")
	public String delete_ok() {
		return "customer/delete_ok";	
	}
}
