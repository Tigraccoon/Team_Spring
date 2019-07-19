package com.sky.springteam.model.subject.dao;

import java.util.List;

import com.sky.springteam.model.subject.dto.SubjectDTO;

public interface SubjectDAO {
	
	List<SubjectDTO> listSubject();
	SubjectDTO detailSubject(String subject_name);
	void updateSubject(SubjectDTO dto);
	void deleteSubject(String subject_name);
	void insertSubject(SubjectDTO dto);
	String fileInfo(String subject_name);

}
