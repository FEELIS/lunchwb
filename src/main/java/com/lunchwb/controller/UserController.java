package com.lunchwb.controller;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.lunchwb.api.NaverLoginBo;
import com.lunchwb.service.UserService;
import com.lunchwb.vo.UserVo;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	NaverLoginBo naverLoginBo;
	@Autowired
	@Qualifier("bcryptPasswordEncoder")
	private PasswordEncoder pwEncoder;
	
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@GetMapping("/login")
	public String loginForm(Model model, HttpSession session) {
		logger.info("user > loginForm()");
		String naverAuthUrl = naverLoginBo.getAuthorizationUrl(session);
		model.addAttribute("naverUrl", naverAuthUrl);
		return "user/loginForm";
	}
	
	@PostMapping("/login")
	public String autoLogin(HttpSession session, UserVo userVo, HttpServletResponse response){
		logger.info("loginPost...UserVo={}", userVo);
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
	
	/* SNS 로그인 네이버 */
	@RequestMapping(value="/naverLoginCallback",  method = {RequestMethod.GET,RequestMethod.POST})
	public String userNaverLoginPro(Model model,@RequestParam Map<String,Object> paramMap, @RequestParam String code, @RequestParam String state,HttpSession session) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBo.getAccessToken(session, code, state);
		//로그인 사용자 정보를 읽어온다.
		String apiResult = naverLoginBo.getUserProfile(oauthToken);
		ObjectMapper objectMapper =new ObjectMapper();
		
		Map<String, Object> apiJson = (Map<String, Object>) objectMapper.readValue(apiResult, Map.class).get("response");
		System.out.println("apiJson =>"+apiJson);
		
		UserVo naverConnectionCheck = userService.naverConnectionCheck(apiJson.get("email"));
		
		if(naverConnectionCheck == null) { //일치하는 이메일 없으면 가입
			Integer registerCheck = userService.userNaverRegisterPro(apiJson);
			
			if(registerCheck != null && registerCheck > 0) {
				UserVo loginCheck = userService.naverLogin(apiJson);
				session.setAttribute("authUser", loginCheck);
			}else {
			}
			
			return "redirect:./";
		}else if(naverConnectionCheck.getNaverLogin() == null && naverConnectionCheck.getUserEmail() != null) { //이메일 가입 되어있고 네이버 연동 안되어 있을시
			userService.setNaverConnection(apiJson);
			UserVo loginCheck = userService.naverLogin(apiJson);
			session.setAttribute("authUser", loginCheck);
		}else { //모두 연동 되어있을시
			UserVo loginCheck = userService.naverLogin(apiJson);
			session.setAttribute("authUser", loginCheck);
		}
		
		return "redirect:./";
	}
	
	/* SNS 로그인 카카오 */
	@RequestMapping(value="/kakaoLoginCallback",  method = {RequestMethod.GET,RequestMethod.POST})
	public String userKakaoLoginPro(Model model,@RequestParam Map<String,Object> paramMap, @RequestParam String code, @RequestParam String state,HttpSession session) throws SQLException, Exception {
		
		
		return "redirect:./";
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
			return "redirect:/lunchwb";
		} else {
			return "user/joinForm";
		}
	}

	@PostMapping("/join")
	public String join(@ModelAttribute UserVo userVo, HttpSession session) {
		logger.info("joinPost...UserVo={}",userVo);
		
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
		
		if (loginUser != null) { // 로그인 했다면
			UserVo checkSNSUser = userService.checkSNS(loginUser.getUserEmail());
			System.out.println(checkSNSUser);
			if(checkSNSUser.getNaverLogin() != null) {
				session.setAttribute("userInfo", checkSNSUser);
				return "user/userInfoSNS";
			}else {
				
				session.setAttribute("userInfo", loginUser);
				return "user/checkUserInfo";
			}
		} else { // 로그인을 하지 않았다면 로그인 화면으로
			return "redirect:/lunchwb/login";
		}
		
	}

	@PostMapping("/user/userInfo/")
	public String userInfo(HttpSession session,
							@RequestParam("userPassword") String password) {
		logger.info("user > checkUser()");
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		UserVo checkUser = new UserVo();
		UserVo userInfo;
		
		String returnURL = "";
		System.out.println(authUser.getUserEmail());
		checkUser = userService.login(authUser);
		System.out.println("checkUser = " + checkUser);
		
		System.out.println("비밀번호 일치 : " + pwEncoder.matches(password, checkUser.getUserPassword()));
		
		if(authUser != null) { 
			if(true == pwEncoder.matches(password, checkUser.getUserPassword())) { 
				userInfo = userService.getUserInfo(checkUser);
				if (userInfo != null) {
					checkUser.setUserPassword("");
					session.setAttribute("userInfo", userInfo);
					returnURL = "user/userInfo";
				} else {
					returnURL = "redirect:../checkUser";
				}
			}
		}
		return returnURL;
	}
	
	/* 회원가입 유저 회원정보 수정 */
	@PostMapping("user/modifyUser")
	public String modifyUser(@ModelAttribute UserVo userVo, HttpSession session) {
		logger.info("modifyUser...Uservo={}", userVo);
		System.out.println(userVo);
		
		String rawPw = userVo.getUserPassword();		// 복호화 전 비밀번호
		String encodePw = pwEncoder.encode(rawPw);	// 복호화 후 비밀번호
		
		userVo.setUserPassword(encodePw);
		
		UserVo authUser = userService.modifyUser(userVo);
		
		if(authUser != null) {
			session.setAttribute("authUser", authUser);
			session.removeAttribute("userInfo");
			return "redirect:./checkUser";
		}else {
			return "redirect:./";
		}
	}

	/* SNS 유저 회원정보 수정 */
	@PostMapping("user/modifySNSUser")
	public String modifySNSUser(@ModelAttribute UserVo userVo, HttpSession session) {
		logger.info("modifySNSUser...Uservo={}", userVo);
		System.out.println("before = " + userVo);
		UserVo SNSID = (UserVo)session.getAttribute("userInfo");
		userVo.setNaverLogin(SNSID.getNaverLogin());
		System.out.println("after = " + userVo);
		UserVo authUser = userService.modifySNSUser(userVo);
		
		
		if(authUser != null) {
			session.setAttribute("authUser", authUser);
			session.removeAttribute("userInfo");
			return "redirect:../";
		}else {
			return "redirect:../";
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
