package com.sky.springteam.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sky.springteam.model.board.dao.CommentDAO;
import com.sky.springteam.model.board.dto.CommentDTO;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Inject
	CommentDAO commentDao;
	
	@Override
	public List<CommentDTO> c_list(int b_num) {
		
		return null;
	}

	@Override
	public void c_insert(CommentDTO dto) {
		
		
	}

	@Override
	public void c_update(CommentDTO dto) {
		
		
	}

	@Override
	public void c_delete(int c_num) {
		
		
	}

}
