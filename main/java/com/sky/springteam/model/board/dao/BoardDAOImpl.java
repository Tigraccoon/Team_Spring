package com.sky.springteam.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sky.springteam.model.board.dto.BoardDTO;

@Repository		
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<BoardDTO> b_list(String b_category, String keyword, int begin, int end) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("b_category", b_category);
		map.put("keyword", keyword);
		
		return sqlSession.selectList("board.b_list", map);
	}

	@Override
	public BoardDTO b_view(int b_num) {

		return sqlSession.selectOne("board.b_view", b_num);
	}

	@Override
	@Transactional
	public int b_insert(BoardDTO dto) {
		
		sqlSession.insert("board.b_insert", dto);
		
		return sqlSession.selectOne("board.getcurrval");
	}

	@Override
	public void b_update(BoardDTO dto) {
		
		sqlSession.update("board.b_update", dto);
	}

	@Override
	public void b_delete(int b_num) {
		
		sqlSession.delete("board.b_delete", b_num);
	}

	@Override
	public void b_upcount(int b_num) {
		
		sqlSession.update("board.b_upcount", b_num);
	}

	@Override
	public int b_count(String b_category, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("b_category", b_category);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("board.b_count", map);
	}

	@Override
	public int c_count(int b_num) {
		
		return sqlSession.selectOne("board.c_count", b_num);
	}

}
