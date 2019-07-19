package com.sky.springteam.model.subject.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sky.springteam.model.subject.dto.SubjectDTO;

@Repository
public class SubjectDAOImpl implements SubjectDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<SubjectDTO> listSubject() {
		return sqlSession.selectList("subject.subject_list");
	}

	@Override
	public SubjectDTO detailSubject(String subject_name) {
		return sqlSession.selectOne("subject.detail_subject",subject_name);
	}

	@Override
	public void updateSubject(SubjectDTO dto) {
		sqlSession.update("subject.update_subject",dto);
	}

	@Override
	public void deleteSubject(String subject_name) {
		sqlSession.delete("subject.delete_subject", subject_name);
	}

	@Override
	public void insertSubject(SubjectDTO dto) {
		sqlSession.insert("subject.insert", dto);
	}

	@Override
	public String fileInfo(String subject_name) {
		return sqlSession.selectOne("subject.fileInfo", subject_name);
	}

}
