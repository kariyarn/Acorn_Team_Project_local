package com.acorn.soso.group.dto;

import org.apache.ibatis.type.Alias;

import com.acorn.soso.users.dto.UsersDto;

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
	private int num;
	private String title;
	private String locate;
	private String limitDay;
	private String imagePath;
	private String writer;
	private String caption;
	private String regdate;

}
