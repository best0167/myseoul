package controller;

import java.util.Collection;
import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class SessionBindingListner implements HttpSessionBindingListener{
	// 싱글톤 객체를 담을 변수
    private static SessionBindingListner sessionListener = null;
    
    // 로그인한 접속자를 저장한 HashTable
    //(데이터를 해시하여 테이블 내의 주소를 계산하고 데이터를 담는 것 , 해시함수 알고리즘은 나눗셈 법. 자릿수 접기 등등)
    private static Hashtable loginUsers = new Hashtable();
    
    //싱글톤 처리
    public static synchronized SessionBindingListner getInstance() {
        if(sessionListener == null) {
            sessionListener = new SessionBindingListner();
        }
        return sessionListener;
    }
    
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		//세션의 바인딩 동작시 호출됨
		loginUsers.put(event.getSession(), event.getName());
		System.out.println(event.getName()+" 로그인 완료");
		System.out.println("현재 로그인한 접속자 수: " + getUserCount());
		System.out.println("");
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		// 바인딩 끊겼을때 호출됨
		loginUsers.remove(event.getSession());
		System.out.println(event.getName()+" 로그아웃 완료");
		System.out.println("현재 로그인한 접속자 수: " + getUserCount());
		System.out.println("");
	}
	
	// 입력받은 아이디를 해시테이블에서 삭제
	public void removeSession(String userId) {
		Enumeration e = loginUsers.keys();
        HttpSession session = null;
        while(e.hasMoreElements()){
            session = (HttpSession)e.nextElement();
            if(loginUsers.get(session).equals(userId)){
                //세션이 invalidate될때 HttpSessionBindingListener를 
                //구현하는 클레스의 valueUnbound()함수가 호출된다.
                session.invalidate();
            }
        }
	}
	
	 // 해당 아이디의 동시접속 여부 확인
	 public boolean isUsing(String userId){
		 return loginUsers.containsValue(userId);
	}
	 
	 public void setSession(HttpSession session, String userId){
	       //이순간에 Session Binding이벤트가 일어나는 시점
	       //name값으로 userId, value값으로 자기자신(HttpSessionBindingListener를 구현하는 Object)
	       session.setAttribute(userId, this);//login에 자기자신을 집어넣는다.
	   }
	 
	 //  입력받은 세션Object로 아이디를 리턴한다.
	 public String getUserID(HttpSession session){
	       return (String)loginUsers.get(session);
	   }

	 //현재 로그인한 총 사용자 수
	 public int getUserCount(){
	       return loginUsers.size();
	   }
	 
	 //현재 접속중인 모든 사용자 아이디를 출력
	 public void printloginUsers(){
	       Enumeration e = loginUsers.keys();
	       HttpSession session = null;
	       System.out.println("===========================================");
	       int i = 0;
	       while(e.hasMoreElements()){
	           session = (HttpSession)e.nextElement();
	           System.out.println((++i) + ". 접속자 : " +  loginUsers.get(session));
	       }
	       System.out.println("===========================================");
	    }
	 
	 //현재 접속중인 모든 사용자리스트를 리턴
	 public Collection getUsers(){
	       Collection collection = loginUsers.values();
	       return collection;
	   }
}
