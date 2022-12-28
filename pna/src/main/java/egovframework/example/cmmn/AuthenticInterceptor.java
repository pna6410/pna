package egovframework.example.cmmn;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.WebContentInterceptor;

import com.pna.dto.loginDto;


public class AuthenticInterceptor extends WebContentInterceptor  {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException {
    	
    	loginDto loginDto = (loginDto) EgovUserDetailsHelper.getAuthenticatedUser();

		if (loginDto.getUserId() != null) {
			return true;
		} else {
			ModelAndView modelAndView = new ModelAndView("forward:/login.do");
			modelAndView.addObject("message", "세션이 만료되어 로그아웃 되었습니다. 다시 로그인 해주세요.");
			throw new ModelAndViewDefiningException(modelAndView);
		}
    }
 
	/*
	 * @Override public void postHandle(HttpServletRequest request,
	 * HttpServletResponse response, Object handler, ModelAndView modeAndView)
	 * throws Exception { System.out.println("postHandle >>>  Controller 실행 후 실행");
	 * }
	 * 
	 * @Override public void afterCompletion(HttpServletRequest request,
	 * HttpServletResponse response, Object handler, Exception ex){
	 * System.out.println("afterCompletion >>>  preHandle 메소드 return값이 true일 때 실행");
	 * }
	 */
 
}