package com.lunchwb.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import com.lunchwb.dao.UserDao;
import com.lunchwb.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	public UserVo login(UserVo userVo) {
		UserVo authUser = userDao.login(userVo);
		return authUser;
	}

	public UserVo getUserInfo(UserVo userVo) {
		UserVo userInfo = userDao.getUser(userVo);
		return userInfo;
	}

	public UserVo join(UserVo userVo) {
		userDao.join(userVo);
		UserVo authUser = userDao.login(userVo);
		return authUser;
	}

	public UserVo modifyUser(UserVo userVo) {
		int count = userDao.modifyUser(userVo);

		if (count > 0) {
			UserVo authUser = userDao.login(userVo);
			return authUser;
		} else {
			return null;
		}
	}

	/* 자동로그인 */
	public void autoLogin(String sessionId, Date limitDate, String userEmail) {

		Map<String, Object> map = new HashMap<>();
		map.put("sessionId", sessionId);
		map.put("limitDate", limitDate);
		map.put("userEmail", userEmail);

		userDao.autoLogin(map);

	}

	public UserVo selectSession(String sessionId) {
		UserVo autoLogin = userDao.selectSession(sessionId);
		return autoLogin;
	}

	/* SNS 로그인 */
	/* 네이버 */
	public UserVo naverConnectionCheck(Object userEmail) {
		UserVo naverCheck = userDao.naverConnectionCheck(userEmail);
		return naverCheck;
	}

	public UserVo naverLogin(Map<String, Object> apiJson) {
		UserVo naverLogin = userDao.naverLogin(apiJson);
		return naverLogin;
	}

	public void setNaverConnection(Map<String, Object> apiJson) {
		userDao.setNaverConnection(apiJson);
	}

	public int userNaverRegisterPro(Map<String, Object> apiJson) {

		int count = userDao.userNaverRegisterPro(apiJson);
		return count;
	}

	/* SNS 회원 가입 유저 확인 */
	public UserVo checkSNS(String userEmail) {
		UserVo checkSNSUser = userDao.checkSNSUser(userEmail);
		return checkSNSUser;
	}

	/* SNS 회원 회원정보 수정 */
	public UserVo modifySNSUser(UserVo userVo) {
		int count = userDao.modifySNSUser(userVo);
		System.out.println("userVo = " + userVo);
		if (count > 0) {
			UserVo authUser = userDao.modifyAfterNaverLogin(userVo);
			return authUser;
		} else {
			return null;
		}
	}

	/* JSON */
	public String checkEmail(String userEmail) {

		UserVo emailCheck = userDao.checkEmail(userEmail);

		String result;

		if (emailCheck == null) {
			result = "success";
		} else {
			result = "fail";
		}

		return result;
	}

	/* 카카오 SNS 로그인 */
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=76831635e5a5685d3617238b00847def"); // 본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8088/lunchwb/kakaoLoginCallback"); // 본인이 설정해 놓은 경로
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return access_Token;
	}

	public UserVo getUserInfo(String access_Token) {

		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			System.out.println("kakao_account = " + kakao_account);
			String email = kakao_account.getAsJsonObject().get("email").getAsString();

			userInfo.put("email", email);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// catch 아래 코드 추가.
		UserVo result = userDao.checkSNSUser((String) userInfo.get("email"));
		// 위 코드는 먼저 정보가 저장되있는지 확인하는 코드.
		System.out.println("S:" + result);
		if (result == null) {
			// result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
			userDao.userNaverRegisterPro(userInfo);
			// 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.
			return userDao.checkSNSUser((String) userInfo.get("email"));
			// 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
			// result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
		} else {
			return result;
			// 정보가 이미 있기 때문에 result를 리턴함.
		}
	}

	public void kakaoLogout(String access_Token) {
		String reqURL = "https://kapi.kakao.com/v1/user/logout";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String result = "";
			String line = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
