package com.pna.login;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.eclipse.jdt.internal.compiler.batch.Main;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pna.dto.loginDto;
import com.pna.login.service.loginService;

import egovframework.example.cmmn.EgovMessageSource;
import egovframework.example.cmmn.EgovUserDetailsHelper;

@Controller
public class loginController {
	
	@Resource(name="loginService")
	private loginService loginService;
	
	@Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
	
	protected static Logger logger = Logger.getLogger(Main.class.getName());
	
	@RequestMapping(value = "/login.do")
	public String login() throws Exception{
		loginDto loginDto = (loginDto) EgovUserDetailsHelper.getAuthenticatedUser(); // 로그인한 사용자 정보를 가져오는 함수

		if (loginDto.getUserId() != null) {
			return "redirect:/main.do";
		} else {
			return "login";
		}
	}
	
	@RequestMapping(value="/loginCheck.do", method={RequestMethod.POST}) 
	public String loginCheck(HttpServletRequest request, HttpServletResponse reponse, @ModelAttribute("loginDto") loginDto loginDto, HttpSession session, ModelMap model) throws Exception{
		logger.info("loginCheck call");
		logger.info(loginDto.getUserId());
		
		int rtn = loginService.selectLoginCheck(loginDto); // 입력된 아이디와 비밀번호가 db에 존재하는 지 검색

    	logger.info("rtn => "+ rtn);

		if (rtn == 1) {
			loginDto loginInfoDto = loginService.selectLoginInfo(loginDto); // loginInfoDto에 로그인한 id의 데이터를 넣어줌 

			logger.info("getUserid => "+ loginInfoDto.getUserId());
			logger.info("getUsername => "+ loginInfoDto.getUserName());
			logger.info("getUsergrade => "+ loginInfoDto.getUserGrade());			

			session.setAttribute("loginDto", loginInfoDto); // 세션에 로그인 정보 저장

           	return "redirect:/main.do";

		} else {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login")); // 입력된 id나 비밀번호가 db와 다를 경우 오류 메시지 보내줌
	    	return "login";
		}
	}
	
	@RequestMapping(value="/logout.do", method={RequestMethod.GET,RequestMethod.POST})
    public String logout(HttpServletRequest request, HttpServletResponse reponse, HttpSession session, ModelMap model) throws Exception {

    	session.invalidate(); // 세션을 없애고 세션에 속해있는 값들을 모두 없앤다.
   		return "forward:/login.do";
    }

}
