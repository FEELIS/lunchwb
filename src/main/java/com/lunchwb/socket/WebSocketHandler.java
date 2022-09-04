package com.lunchwb.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketHandler extends TextWebSocketHandler {
			
	private static final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	//로그인 한 인원 전체
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1:1로 할 경우
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {//클라이언트와 서버가 연결
		// TODO Auto-generated method stub
		logger.info("Socket 연결");
		sessions.add(session);
		logger.info(currentUserName(session));//현재 접속한 사람
		userSessionsMap.put(currentUserName(session),session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// 메시지
		// TODO Auto-generated method stub
		String msg = message.getPayload();//자바스크립트에서 넘어온 Msg
		
		if(msg != null) {
			String[] msgs = msg.split(",");
			if(msgs != null && msgs.length ==3) {
				String receiver = msgs[0];//수신인
				String groupName = msgs[1];//그룹이름
				String notiType = msgs[2];//알림종류
				String comment = "";
				if(notiType.equals("2")) {
					comment = "의 초대를 수락했습니다.";
				}else if(notiType.equals("3")) {
					comment = "의 초대를 거절했습니다.";
				}
				String mid = currentUserName(session);//발신인
				
				WebSocketSession receiversession = userSessionsMap.get(receiver);//수신인이 현재 접속중인가 체크
				
				if(receiversession !=null) {
					TextMessage txtmsg = new TextMessage(mid+"님이" + groupName + comment);
					receiversession.sendMessage(txtmsg);//보내기
				}else {
					TextMessage txtmsg = new TextMessage(mid+"님이" + groupName + comment);
					session.sendMessage(txtmsg);//보내지는지 체크하기
				}
				
			}
			
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {//연결 해제
		// TODO Auto-generated method stub
		logger.info("Socket 끊음");
		sessions.remove(session);
		userSessionsMap.remove(currentUserName(session),session);
	}
	
	
	private String currentUserName(WebSocketSession session) {
		String mid = session.getPrincipal().getName();
		return mid;
	}
}