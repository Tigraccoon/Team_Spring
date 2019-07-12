package com.sky.springteam.service.board;

import java.util.List;

import com.sky.springteam.model.board.dto.CommentDTO;

public interface CommentService {
	
	public List<CommentDTO> c_list(int b_num);	//댓글리스트
	public void c_insert(CommentDTO dto);		//댓글작성
	public void c_update(CommentDTO dto);		//댓글수정
	public void c_delete(int c_num);			//댓글삭제
	
}
