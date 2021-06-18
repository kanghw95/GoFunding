package com.funding.sprout.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SmartEditorController {
	@RequestMapping("/smarteditor")
	public String smartEditor() {
		return "smartEditor";
	}
}
