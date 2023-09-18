package com.acorn.soso.users.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("usersDto")
public class UsersDto {
	//카카오에서 받아올 정보
	private String name;
	private String id;
	private String email;
	
	//사용자가 직접 지정 or 서버상에서 설정
	private String pwd;
	private String profile;
	private String regdate;
	private String newPwd;
	
	//이용약관
	private Integer SVC_USE_PCY_AGMT_YN;
	private Integer PS_INFO_PROC_AGMT_YN;
	private Integer MKT_INFO_RECV_AGMT_YN;
	
	//소셜 로그인 관련 0이면 홈페이지 가입, 1이면 소셜 가입, 2면 통합 로그인(홈페이지+소셜)
	private Integer social;

}
