package com.sky.springteam.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sky.springteam.model.board.dao.BoardDAO;
import com.sky.springteam.model.board.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	BoardDAO boardDao;
	
	@Override
	public List<BoardDTO> b_list(String b_category, String keyword, int begin, int end) {
		
		return boardDao.b_list(b_category, keyword, begin, end);
	}

	@Override
	public BoardDTO b_view(int b_num) {
		
		return null;
	}

	@Override
	public void b_insert(BoardDTO dto) {
		
		
	}

	@Override
	public void b_update(BoardDTO dto) {
		
		
	}

	@Override
	public void b_delete(int b_num) {
		
		
	}

	@Override
	public void b_upcount(int b_num) {
		
		
	}

	@Override
	public int b_count(String b_category, String keyword) {
		
		return boardDao.b_count(b_category, keyword);
	}

	@Override
	public int c_count(int b_num) {
		
		return 0;
	}

}
