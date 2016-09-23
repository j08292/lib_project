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
	public void insertGrade(GradeCommand garde);
	public void deleteGrade(Integer grade_num);
	
	//������ �Խù� ����
	//������ �� ���
	public List<GradeCommand> adminGradeList(Map<String, Object> map);
	public int getAdminRowCountGrade(Map<String,Object> map);
	//�ش� �۹�ȣ�� ������ ����
	public void deleteByGradeNum(List<Integer> list);
}
