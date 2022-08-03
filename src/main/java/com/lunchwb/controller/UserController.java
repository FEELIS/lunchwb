package com.lunchwb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lunchwb.service.UserService;
import com.lunchwb.vo.UserVo;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@GetMapping("/login")
	public String loginForm() {
		logger.info("user > loginForm()");
		return "user/loginForm";
	}

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

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		logger.info("user > logout()");
		session.removeAttribute("authUser");
		session.invalidate();
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
	
	
	@ResponseBody
	@PostMapping("/user/checkEmail")
	public String checkEmail(@RequestBody String Email) {
		String result = userService.checkEmail(Email);
		
		return result;
	}
}
