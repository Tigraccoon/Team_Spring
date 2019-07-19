package com.sky.springteam.controller.subject;

import java.io.File;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sky.springteam.model.subject.dto.SubjectDTO;
import com.sky.springteam.service.subject.SubjectService;

@Controller
@RequestMapping("subject/*") // 공통 url pattern
public class SubjectController {
	
	@Inject
	SubjectService subjectService;
	
	@RequestMapping("list.do") // 세부적인 url pattern
	public ModelAndView list(ModelAndView mav) {
		// 포워딩할 뷰의 경로
		mav.setViewName("/subject/subject_list");
		// 전달할 데이터
		mav.addObject("list", subjectService.listSubject());
		
		return mav;
	}
	
	@RequestMapping("detail/{subject_name}")
	public ModelAndView detail(@PathVariable String subject_name, ModelAndView mav) {
		//포워딩할 뷰의 이름
		mav.setViewName("/subject/subject_detail");
		//뷰에 전달할 데이터
		mav.addObject("dto", subjectService.detailSubject(subject_name));
		return mav;
	}
	
	@RequestMapping("write.do")
	public String write() {
		return "subject/subject_write";
	}
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute SubjectDTO dto) {
		String filename="-";
		// 첨부파일이 있으면
		if(!dto.getFile1().isEmpty()) {
			// 첨부파일의 이름
			filename=dto.getFile1().getOriginalFilename();
			try {
				String path="D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\springteam\\WEB-INF\\views\\img\\";
				// 디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				// 임시 디렉토리에 저장된 첨부파일을 이동
				dto.getFile1().transferTo(new File(path+filename));
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		dto.setImg_url(filename);
		subjectService.insertSubject(dto);
		return "redirect:/subject/list.do";
	}
	
	@RequestMapping("edit/{subject_name}")
	public ModelAndView edit(@PathVariable("subject_name") String subject_name, ModelAndView mav) {
		// 이동할 뷰
		mav.setViewName("subject/subject_edit"); // subject_edit.jsp
		// 뷰에 전달할 데이터
		mav.addObject("dto", subjectService.detailSubject(subject_name));
		return mav;
	}
	
	@RequestMapping("update.do")
	public String update(SubjectDTO dto) {
		String filename="-";
		// 새로운 첨부파일이 있으면
		if(!dto.getFile1().isEmpty()) {
			// 첨부파일의 이름
			filename=dto.getFile1().getOriginalFilename();
			try {
				String path="D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\springteam\\WEB-INF\\views\\img\\";
				// 디렉토리가 존재하지 않으면 생성
				new File(path).mkdir();
				// 임시 디렉토리에 저장된 첨부파일을 이동
				dto.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setImg_url(filename);
		}else { // 새로운 첨부파일이 없을때
			// 기존에 첨부한 파일 정보를 가져옴
			SubjectDTO dto2=subjectService.detailSubject(dto.getSubject_name());
			dto.setImg_url(dto2.getImg_url());
		}
		// 상품정보 수정
		subjectService.updateSubject(dto);
		return "redirect:/subject/list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam String subject_name) {
		// 첨부파일 삭제
		String filename=subjectService.fileInfo(subject_name);
		System.out.println("첨부파일 이름 : "+filename);
		if(filename != null && filename.equals("-")) { //파일이 있으면
			String path="D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\springteam\\WEB-INF\\views\\img\\";
			File f=new File(path+filename);
			System.out.println("파일 존재여부 : "+f.exists());
			if(f.exists()) { //파일이 존재하면
				f.delete(); //파일 삭제
				System.out.println("삭제되었습니다.");
			}
		} // if
		// 레코드 삭제
		subjectService.deleteSubject(subject_name);
		return "redirect:/subject/list.do";
	}
	

}
