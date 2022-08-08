package com.lunchwb.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.lunchwb.service.UserService;
import com.lunchwb.vo.UserVo;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	@Qualifier("bcryptPasswordEncoder")
	private PasswordEncoder pwEncoder;
	
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@GetMapping("/login")
	public String loginForm() {
		logger.info("user > loginForm()");
		return "user/loginForm";
	}
	
	@PostMapping("/login")
	public String autoLogin(HttpSession session, UserVo userVo, HttpServletResponse response){
		String returnURL = "";
		
		if (session.getAttribute("authUser") != null) {
			session.removeAttribute("authUser");
		}
		
		UserVo authUser = userService.login(userVo); 
		
		if(authUser != null) {
			
			if(true == pwEncoder.matches(userVo.getUserPassword(), authUser.getUserPassword())) {
				authUser.setUserPassword("");
				session.setAttribute("authUser", authUser);
				returnURL = "redirect:./";
				if(userVo.isAutoLogin()) {
					Cookie cookie = new Cookie("loginCookie", session.getId());
					
					cookie.setPath("/");
					cookie.setMaxAge(60*60*24*7);
					response.addCookie(cookie);
				}
				
			}else {
				returnURL = "redirect:./login?result=fail";
			}
		
			
		}else { // 로그인 실패
			returnURL = "redirect:./login?result=fail";
			
		}
		return returnURL;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		logger.info("user > logout()");
		
		Object obj = session.getAttribute("authUser");
		
		if(obj != null) {
			UserVo vo = (UserVo) obj;
			
			session.removeAttribute("authUser");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if( loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				
				Date date = new Date(System.currentTimeMillis());
				userService.autoLogin(vo.getUserEmail(), date, session.getId());
			}
		}
		
		return "redirect:./";

	}

	@GetMapping("/join")
	public String joinForm(HttpServletRequest req) {
		logger.info("user > joinForm()");
		HttpSession session = req.getSession();
		UserVo loginUser = (UserVo) session.getAttribute("authUser");

		if (loginUser != null) {
			return "redirect:./";
		} else {
			return "user/joinForm";
		}
	}

	@PostMapping("/join")
	public String join(@ModelAttribute UserVo userVo, HttpSession session) {
		logger.info("user > joinForm()");
		
		String rawPw = userVo.getUserPassword();		// 복호화 전 비밀번호
		String encodePw = pwEncoder.encode(rawPw);	// 복호화 후 비밀번호
		
		userVo.setUserPassword(encodePw);
		
		System.out.println(userVo);
		
		UserVo authUser = userService.join(userVo);

		if (authUser != null) {
			session.setAttribute("authUser", authUser);
			return "user/joinSuccess";
		} else {
			return "redirect:./join?result=fail";
		}
	}

	@GetMapping("/user/checkUser")
	public String checkUser(HttpSession session) {
		logger.info("user > checkUser()");
		UserVo loginUser = (UserVo) session.getAttribute("authUser");

		if (loginUser != null) {
			return "user/checkUserInfo";
		} else {
			return "redirect:../";
		}
	}

	@PostMapping("/user/userInfo/")
	public String userInfo(HttpSession session,
							@RequestParam("userPassword") String password) {
		logger.info("user > checkUser()");
		UserVo checkUser = new UserVo();
		
		checkUser.setUserEmail(((UserVo) session.getAttribute("authUser")).getUserEmail());
		checkUser.setUserPassword(password);
		
		UserVo userInfo = userService.getUserInfo(checkUser);
		
		
		if (userInfo != null) {
			System.out.println("남자입니까? : " + userInfo.getUserSex().equals("male"));
			session.setAttribute("userInfo", userInfo);
			return "user/userInfo";
		} else {
			return "redirect:../checkUser";
		}

	}
	
	@PostMapping("user/modifyUser")
	public String modifyUser(@ModelAttribute UserVo userVo, HttpSession session) {
		logger.info("user > userInfo()");
		System.out.println(userVo);
	
		
		UserVo authUser = userService.modifyUser(userVo);
		if(authUser != null) {
			session.setAttribute("authUser", authUser);
			session.removeAttribute("userInfo");
			return "redirect:./checkUser";
		}else {
			return "redirect:/";
		}
	}
	
	/* Json */
	@ResponseBody
	@PostMapping("/user/checkEmail")
	public String checkEmail(@RequestBody String Email) {
		String result = userService.checkEmail(Email);
		
		return result;
	}
	
	
	
	//////////////////////////////////////////////////////////////////////////
	///////////////////////////추후 삭제 예정////////////////////////////////////
	/* 과거 ... 이었던 것.*/
	/* 로그인 상태 유지 전 로그인 컨트롤러.
	@PostMapping("/login")
	public String login(@ModelAttribute UserVo userVo, HttpSession session) {
		logger.info("user > login()");
		UserVo authUser = userService.login(userVo);

		if (authUser != null) {
			session.setAttribute("authUser", authUser);
			return "redirect:./";
		} else {
			return "redirect:./login?result=fail";
		}
	}
	*/
	
	/* 로그인 상태 유지 전 로그아웃 컨트롤러
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		logger.info("user > logout()");
		session.removeAttribute("authUser");
		session.invalidate();
		return "redirect:./";

	}*/
}
