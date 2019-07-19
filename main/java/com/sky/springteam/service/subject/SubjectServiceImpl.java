package com.sky.springteam.service.subject;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sky.springteam.model.subject.dao.SubjectDAO;
import com.sky.springteam.model.subject.dto.SubjectDTO;

@Service
public class SubjectServiceImpl implements SubjectService {
	
	@Inject
	SubjectDAO subjectDao;

	@Override
	public List<SubjectDTO> listSubject() {
		return subjectDao.listSubject();
	}

	@Override
	public SubjectDTO detailSubject(String subject_name) {
		return subjectDao.detailSubject(subject_name);
	}

	@Override
	public void updateSubject(SubjectDTO dto) {
		subjectDao.updateSubject(dto);

	}

	@Override
	public void deleteSubject(String subject_name) {
		subjectDao.deleteSubject(subject_name);

	}

	@Override
	public void insertSubject(SubjectDTO dto) {
		subjectDao.insertSubject(dto);

	}

	@Override
	public String fileInfo(String subject_name) {
		return subjectDao.fileInfo(subject_name);
	}

}
