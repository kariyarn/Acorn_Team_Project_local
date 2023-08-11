package com.acorn.soso.group_managing.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("groupManagingDto")
public class GroupManagingDto {
	private int num;
	private int group_num;
	private String user_id;
	private String intro;
	private int isJoin;
	private String request_dt;
	private String join_dt;
	private String kick_dt;
}
