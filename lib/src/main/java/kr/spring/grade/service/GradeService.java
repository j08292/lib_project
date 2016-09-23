package kr.spring.grade.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.grade.domain.GradeCommand;

@Transactional
public interface GradeService {
	@Transactional(readOnly=true)
	public List<GradeCommand> list(Map<String, Object> map);
	@Transactional(readOnly=true)
	public int getRowCountGrade(Map<String,Object> map);
	public void updateGradeLike(Integer grade_num);
	public void insertGrade(GradeCommand grade);
	public void deleteGrade(Integer grade_num);
	
	//관리자 게시물 관리
	//관리자 글 목록
	public List<GradeCommand> adminGradeList(Map<String, Object> map);
	public int getAdminRowCountGrade(Map<String,Object> map);
	//해당 글번호의 한줄평 삭제
	public void deleteByGradeNum(List<Integer> list);
}
