package com.pna.system;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.eclipse.jdt.internal.compiler.batch.Main;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pna.dto.codeManageDto;
import com.pna.dto.userManageDto;
import com.pna.system.service.systemService;
import com.pna.dto.loginDto;
import com.pna.dto.db.pnauserDto;
import com.pna.common.service.commonService;

@Controller
public class systemController {
	
	@Resource(name = "systemService")
	private systemService systemService;
	
	@Resource(name = "commonService")
	private commonService commonService;
	
	protected static Logger logger = Logger.getLogger(Main.class.getName());
	
	@RequestMapping(value = "/system/userManageList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String userManage(ModelMap model) throws Exception{
		
		List<codeManageDto> systemGrade = commonService.selectCodeList("00003");
		model.addAttribute("systemGrade", systemGrade);
		
		model.addAttribute("pageUrl", "/system/userManageList.jsp");		
		return "main";
	}
	
	@RequestMapping(value = "/system/userManageList.ajax", method={RequestMethod.POST})
	public ModelAndView selectUserManageList(@ModelAttribute("userManageDto") userManageDto userManageDto, HttpSession session, Model model) throws Exception {
				
		Map<String, Object> map = systemService.selectUserManageList(userManageDto);
		ModelAndView modelAndView = new ModelAndView("jsonView",map);

		return modelAndView;
	}
	
	@RequestMapping(value="/system/userPwUpdate.ajax", method={RequestMethod.POST})
    public ResponseEntity<String> userPwUpdate(@ModelAttribute("pnauserDto") pnauserDto pnauserDto, HttpSession session, Model model) throws Exception {

    	loginDto loginDto = (loginDto) session.getAttribute("loginDto");
    	String userId = loginDto.getUserId();

    	pnauserDto.setUserId(userId);

		int rtn = systemService.pnauserPwUpdate(pnauserDto);

		logger.info("rtn =>" + rtn);
		ResponseEntity<String> resRtn = null;
   		if (rtn == 1) {
   			resRtn = new ResponseEntity<>(HttpStatus.OK);
   		} else {
   			resRtn = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
   		}

   		return resRtn;
    }
	
	 // 반환값이 클라이언트에 그대로 반환된다.
	@RequestMapping(value="/system/userExistCheck.ajax", method={RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String userExistCheck(@ModelAttribute("pnauserDto") pnauserDto pnauserDto, HttpSession session, Model model) throws Exception {
		logger.info("userCheck call");
		String rtn = systemService.userExistCheck(pnauserDto);
		logger.info(rtn);
		return rtn;
	}
	
	@RequestMapping(value="/system/userManageUpdate.ajax", method={RequestMethod.POST})
    public ResponseEntity<String> userMangeUpdate(@ModelAttribute("pnauserDto") pnauserDto pnauserDto, HttpSession session, Model model) throws Exception {
		logger.info("userMangeUpdate call");
		int rtn = systemService.pnauserUpdate(pnauserDto);

		logger.info("rtn =>" + rtn);
		ResponseEntity<String> resRtn = null;
   		if (rtn == 1) {
   			resRtn = new ResponseEntity<>(HttpStatus.OK);
   		} else {
   			resRtn = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
   		}

   		return resRtn;
    }

}
