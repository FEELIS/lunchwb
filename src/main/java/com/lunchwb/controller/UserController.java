package com.lunchwb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	@GetMapping("/user/userInfo/{userPassword}")
	public String userInfo(HttpSession session,
							@PathVariable("userPassword") String password) {
		logger.info("user > checkUser()");
		UserVo checkUser = new UserVo();
		
		checkUser.setUserEmail(((UserVo) session.getAttribute("authUser")).getUserEmail());
		checkUser.setUserPassword(password);
		
		UserVo userInfo = userService.getUserInfo(checkUser);

		if (userInfo != null) {
			session.setAttribute("userInfo", userInfo);
			return "user/userInfo";
		} else {
			return "redirect:../";
		}

	}

}
