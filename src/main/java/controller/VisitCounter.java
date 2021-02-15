package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import dao.VisitCountDAO;
import dto.AccDTO;

public class VisitCounter implements HttpSessionListener{
	private int userCount;
	
	public VisitCounter() {
		// TODO Auto-generated constructor stub
	}
	
	public int getUserCount() {
		return userCount;
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		//세션이 생성됨
		++userCount;
		HttpSession session = arg0.getSession();
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		VisitCountDAO dao = new VisitCountDAO();
		
        try {
        	AccDTO dto = new AccDTO();
        	String session_Id = (String)session.getId();
        	dto.setAcc_session(session_Id);
        	
        	String ip = request.getRemoteAddr();	
    		dto.setAcc_ip(ip);
    		
    		String uId=(String)session.getAttribute("u_id");
    		if(!(uId==null || uId=="")) {
    			dto.setAcc_uid(uId);
    		}else {
    			uId="non-member";
    			dto.setAcc_uid(uId);
    		}
    		System.out.printf("접속자session: %s \n", dto.getAcc_session());
    		System.out.println("접속자ip: "+dto.getAcc_ip());
    		System.out.println("접속자id: "+dto.getAcc_uid());
    		System.out.println("");
    		
			dao.insertVisitor(dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("방문자 업데이트 실패!");
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		//세션이 삭제됨
		--userCount;
		HttpSession session = arg0.getSession();
		System.out.printf("탈주자session: %s \n", session.getId());
		System.out.println("");
	}
	
}
