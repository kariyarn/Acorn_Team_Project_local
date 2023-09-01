package com.acorn.soso.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.acorn.soso.group.dto.GroupDto;
import com.acorn.soso.group_managing.dao.GroupManagingDao;
import com.acorn.soso.group_managing.dto.GroupManagingDto;


// 임의로 num 값을 변경해서 다른 페이지로 넘어가는 것을 검사할 인터셉터
@Component
public class GroupNumInterceptor implements HandlerInterceptor{
	
    private final GroupManagingDao groupManagingDao;

    @Autowired
    public GroupNumInterceptor(GroupManagingDao groupManagingDao) {
        this.groupManagingDao = groupManagingDao;
    }
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        String groupNumParameter = request.getParameter("num");
        
        if (groupNumParameter != null) {
            try {
                int group_num = Integer.parseInt(groupNumParameter);
                // 여기에서 유효한 소모임 번호 범위를 확인하고, 유효하지 않다면 예외 처리
                if (!isValidGroupNum(group_num)) {
                    // 유효하지 않은 경우 예외 처리 로직을 추가
                    response.sendRedirect("/error-page"); // 에러 페이지로 리다이렉트
                    return false;
                }
            } catch (NumberFormatException e) {
                // 숫자 변환에 실패한 경우 예외 처리
                response.sendRedirect("/error-page"); // 에러 페이지로 리다이렉트
                return false;
            }
        }
        
        return true; 
    }

    // 실제로 유효한 그룹 번호인지 검증하는 로직을 구현
    private boolean isValidGroupNum(int group_num) {
        // 유효성 검사 로직을 추가
    	GroupDto groupDto = groupManagingDao.getGroupData(group_num);
        return groupDto != null;
    }
}
