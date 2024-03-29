package kr.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.member.dao.MemberDAO;

public class AdminDetailUserAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer user_num = 
				(Integer)session.getAttribute("user_num");
		if(user_num == null) {//로그인이 되지 않은 경우
			return "redirect:/member/loginForm.do";
		}
		
		Integer user_auth = 
			(Integer)session.getAttribute("user_auth");
		if(user_auth < 2) {//관리자로 로그인하지 않은 경우
			return "/WEB-INF/views/common/notice.jsp";
		}
		
		//관리자로 로그인한 경우
		request.setCharacterEncoding("utf-8");
		
		//전송된 데이터 반환
		int member_num = 
		 Integer.parseInt(request.getParameter("member_num"));
		int auth = 
		    Integer.parseInt(request.getParameter("auth"));
		
		MemberDAO dao = MemberDAO.getInstance();
		dao.updateMemberByAdmin(auth, member_num);
		
		request.setAttribute("member_num", member_num);
		
		return "/WEB-INF/views/member/detailUser.jsp";
	}

}
