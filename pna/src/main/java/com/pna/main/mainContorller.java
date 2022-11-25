package com.pna.main;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pna.main.service.mainService;
import com.pna.dto.mainManageDto;


@Controller
public class mainContorller {
	
	@Resource(name = "mainService")
	private mainService mainService;
	
	@RequestMapping(value = "/main.do")
	public String mainPage(ModelMap model) throws Exception {
	
		
		List<mainManageDto> testList = mainService.listUp();
		model.addAttribute("resultList", testList);
		 
		
		return "main";
	}

}
