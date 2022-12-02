package com.pna.main;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pna.main.service.mainService;
import com.pna.dto.loginDto;
import com.pna.dto.menuManageDto;


@Controller
public class mainContorller {
	
	@Resource(name = "mainService")
	private mainService mainService;
	
	@RequestMapping(value = "/main.do")
	public String mainPage(HttpSession session, ModelMap model) throws Exception {
	
		loginDto loginDto = (loginDto)session.getAttribute("loginDto");

    	String userId = loginDto.getUserId();
    	
		List<menuManageDto> sideMenuList = mainService.selectSideMenu(userId);
		
		session.setAttribute("sideMenuList", sideMenuList);		 		 
		
		return "main";
	}
	
	@RequestMapping(value = "/test.do")
	public String test(HttpSession session, ModelMap model) throws Exception {
		
		loginDto loginDto = (loginDto)session.getAttribute("loginDto");

    	String userId = loginDto.getUserId();
    	
		List<menuManageDto> sideMenuList = mainService.selectSideMenu(userId);
		
		session.setAttribute("sideMenuList", sideMenuList);	
		
		
		model.addAttribute("pageUrl", "/test.jsp");
		return "main";
	}
	
	@RequestMapping(value = "/test2.do")
	public String test2(ModelMap model) throws Exception {
		
		model.addAttribute("pageUrl", "/test2.jsp");
		return "main";
	}

}
