package com.lec.beans;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class AjaxList extends AjaxResult {
	@JsonProperty("data")
	private List<CategoryDTO> list;  // 데이터 목록

	
	
	public List<CategoryDTO> getList() {
		return list;
	}

	public void setList(List<CategoryDTO> list) {
		this.list = list;
	}
	
	
}













