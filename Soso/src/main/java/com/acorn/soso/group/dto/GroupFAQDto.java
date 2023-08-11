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
@Alias("groupFAQDto")
public class GroupFAQDto {
	private int group_num; // 해당 소모임의 num - FK (group_tb)
	private int num; //소모임 faq게시글의 num - 나중에 수정 삭제 위해서 필요
	private String q_writer; // 문의 작성자의 이름(ID) - FK(user_id)
	private String q_title; //문의글의 제목
	private String q_content; //문의글의 내용
	private String regdate; //문의글을 올린 날짜
	private int startRowNum; //시작 글 번호
	private int endRowNum; // 끝나는 글 번호
	private int prevNum;  //이전글의 글번호
	private int nextNum;  //다음글의 글번호
}
