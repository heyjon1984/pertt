package kr.member.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import kr.controller.Action;
import kr.review.dao.ReviewDAO;
import kr.review.vo.ReviewVO;
import kr.util.PagingUtil;

public class MyPageReviewAction implements Action{
	//내 리뷰 불러오기 dao 실행
	//member_num / sort(String)타입
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String,Object> mapAjax =  new HashMap<String,Object>();
		ReviewDAO rDao = ReviewDAO.getInstance();
		
		//로그인 확인
		HttpSession session = request.getSession();
		Integer user_num = (Integer)session.getAttribute("user_num");
		
		if(user_num == null) {//로그인 되지 않은 경우
			mapAjax.put("result","logout");
		}else {
			//페이지 처리
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null) {
				pageNum = "1";
			}
			int count = rDao.getMyReviewCount(user_num);
			int rowCount = 9;//한번에 리뷰 8개 보여주기
			PagingUtil page = new PagingUtil(Integer.parseInt(pageNum), 
												count, rowCount, 1, null);
			mapAjax.put("count", count);
			mapAjax.put("rowCount", rowCount);
			
			//리뷰 목록 반환
			String sort = request.getParameter("sort");
			List<ReviewVO> myReview = rDao.selectMyReview(user_num, page.getStartRow(), page.getEndRow(), sort);
		    mapAjax.put("myReview", myReview); 
			mapAjax.put("result","success");
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String ajaxData = mapper.writeValueAsString(mapAjax);
		request.setAttribute("ajaxData", ajaxData);
		return "/WEB-INF/views/common/ajax_view.jsp";
	}
	
}
