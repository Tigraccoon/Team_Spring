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
		
		return commentDao.c_list(b_num);
	}

	@Override
	public void c_insert(CommentDTO dto) {
		
		commentDao.c_insert(dto);
	}

	@Override
	public void c_update(CommentDTO dto) {
		
		commentDao.c_update(dto);
	}

	@Override
	public void c_delete(int c_num) {
		
		commentDao.c_delete(c_num);
	}

}
