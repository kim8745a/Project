package com.terrier.websocket;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class L_mgt_socketHandler extends TextWebSocketHandler implements InitializingBean

{
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	
	public L_mgt_socketHandler()
    {
		super();
    }

    @Override//브라우저가 종료했을때
    public void afterConnectionClosed(WebSocketSession session,CloseStatus status) throws Exception {
    	super.afterConnectionClosed(session, status);
    	sessionSet.remove(session);
    }

    @Override//브라우저가 연결했을때
    public void afterConnectionEstablished(WebSocketSession session)throws Exception
    {
    	super.afterConnectionEstablished(session);
    	sessionSet.add(session);
    	System.out.println("웹소켓 연결");
    }

    
    //메세지 보낼떄 클라이언트에게
    public void sendMessage (String message){
          for (WebSocketSession session: this.sessionSet){
                 if (session.isOpen())
                 {
                        try
                        {
                              session.sendMessage(new TextMessage(message));
                        }
                        catch (Exception ignored)
                        {
                              ignored.printStackTrace();
                        }
                 }
          }
    }
    
    
    
    
    @Override // 안쓰면 지우기
    public boolean supportsPartialMessages() {          
    	return super.supportsPartialMessages();
    }
     
    @Override
	public void afterPropertiesSet() throws Exception {}
}
