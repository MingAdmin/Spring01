package org.big.board.controller;

import org.big.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
public class LoginController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/login/login.do")
	public String login() {
		return "login/login";
	}
	@RequestMapping("/login/login_ok.do")
	public String login_ok() {
		return "login/login_ok";
	}
	@RequestMapping("/login/idfind.do")
	public String idfind() {
		return "login/idfind";
	}
	@RequestMapping("/login/idfind_ok.do")
	public String idfind_ok() {
		return "login/idfind_ok";
	}
	@RequestMapping("/login/passwdfind.do")
	public String passwdfind() {
		return "login/passwdfind";
	}
	@RequestMapping("/login/passwdfind_ok.do")
	public String passwdfind_ok() {
		return "login/passwdfind_ok";
	}
	@RequestMapping("/login/logout.do")
	public String logout() {
		return "login/logout";
	}
}
