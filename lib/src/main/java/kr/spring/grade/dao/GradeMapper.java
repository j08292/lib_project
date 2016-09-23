package kr.spring.grade.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import kr.spring.grade.domain.GradeCommand;

@Repository
public interface GradeMapper {
	public List<GradeCommand> list(Map<String, Object> map);
	public int getRowCountGrade(Map<String,Object> map);
	@Update("UPDATE grade SET grade_like = grade_like+1 WHERE grade_like=#{grade_like}")
	public void updateGradeLike(Integer grade_num);
	@Insert("INSERT INTO grade (grade_num,grade_like,grade_content,grade_regdate,grade_star,list_num,mem_id) VALUES (grade_seq.nextval,#{grade_like},#{grade_content},sysdate,#{grade_star},#{list_num},#{mem_id})")
	public void insertGrade(GradeCommand garde);
	@Delete("DELETE FROM grade WHERE grade_num=#{grade_num}")
	public void deleteGrade(Integer grade_num);
	
	//������ �Խù� ����
	//������ �� ���
	public List<GradeCommand> adminGradeList(Map<String, Object> map);
	public int getAdminRowCountGrade(Map<String,Object> map);
	//�ش� �۹�ȣ�� ������ ����
	public void deleteByGradeNum(List<Integer> list);
}
