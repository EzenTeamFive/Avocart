package com.avo.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.avo.www.service.JoongoBoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/joongo/**")
public class JoongoBoardController {

	private JoongoBoardService jbsv;
	
	@GetMapping("/register")
	public void register() {
	}
	
}
