package com.sky.springteam.service.board;

import java.util.List;

import com.sky.springteam.model.board.dto.BoardDTO;

public interface BoardService {
	
	public List<BoardDTO> b_list(String keyword, int begin, int end);	//리스트
	public BoardDTO b_view(int b_num);									//글보기
	public void b_insert(BoardDTO dto);									//글쓰기
	public void b_update(BoardDTO dto);									//글수정
	public void b_delete(int b_num);									//글삭제
	public void b_upcount(int b_num);									//조회수 증가
	public int b_count(String keyword);									//글 갯수
	public int c_count(int b_num);										//댓글 갯수
	
}
