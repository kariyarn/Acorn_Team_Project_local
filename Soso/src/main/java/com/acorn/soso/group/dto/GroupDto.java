package com.acorn.soso.group.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("groupDto")
public class GroupDto {
	//소모임 그룹과 관련된 필드값을 담아두기 위한 DTO이다.
	
	//소모임 번호
	private int num;
	//소모임 타이틀
	private String name;
	//소모임 설명
	private String caption;
	//소모임 대표 이미지 경로
	private String img_path;
	//소모임 생성 날짜
	private String regdate;
	//소모임 종료 날짜
	private String ended_dt;
	//소모임 모집 마감 날짜
	private String deadline_dt;
	//소모임 활동 시작 날짜
	private String start_dt;
	//소모임 관리자 아이디(생성자 아이디)
	private String manager_id;
	//소모임 최대 가입 가능 회원수
	private int max_people;
	//소모임 현재 가입 회원수
	private int now_people;
	//소모임 평균 별점
	private double avrg_rate;
	//오프라인 소모임 장소
	private String meeting_loc;
	//오프라인 소모임 시간
	private String meeting_time;
	//소모임 장르
	private int genre;
	//소모임 활동 성격 (온, 오프라인)
	private int on_off;
	//소모임 생성자의 한마디
	private String manager_comment;
	//소모임 조회수
	private int viewCount;
	
	//이미지 처리를 위한 필드
	private MultipartFile image;
	
	//소모임의 좋아요 수
	private int like_num;
	
	//추천수
	private int thumsup;
	//비추수
	private int thumsdown;
	//게시글 페이징 처리를 위한 필드
	private int startRowNum;
	private int endRowNum;
	private int prevNum;
	private int nextNum;
	 
	private double rate;
	
	private String type;
	private String keyword;
}
