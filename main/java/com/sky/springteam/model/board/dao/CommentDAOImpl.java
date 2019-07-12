package com.sky.springteam.model.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sky.springteam.model.board.dto.CommentDTO;

@Repository
public class CommentDAOImpl implements CommentDAO {

	@Inject
	SqlSession sqlSession;
	
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
