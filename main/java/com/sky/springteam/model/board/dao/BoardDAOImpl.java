package com.sky.springteam.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sky.springteam.model.board.dto.BoardDTO;

@Repository		
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<BoardDTO> b_list(String keyword, int begin, int end) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("keyword", keyword);
		
		return sqlSession.selectList("board.b_list", map);
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
	public int b_count(String keyword) {
		return sqlSession.selectOne("board.b_count", keyword);
	}

	@Override
	public int c_count(int b_num) {
		
		return 0;
	}

}
