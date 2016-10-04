package kr.spring.grade.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import kr.spring.grade.domain.GradeCommand;

@Repository
public interface GradeMapper {
	public List<GradeCommand> list(Map<String, Object> map);
	public int getRowCountGrade(Map<String,Object> map);
	@Insert("INSERT INTO grade (grade_num,grade_content,grade_regdate,grade_star,list_num,mem_id) VALUES (grade_seq.nextval,#{grade_content},sysdate,#{grade_star},#{list_num},#{mem_id})")
	public void insertGrade(GradeCommand garde);
	@Delete("DELETE FROM grade WHERE grade_num=#{grade_num}")
	public void deleteGrade(Integer grade_num);
	//�ߺ� �� ����
	@Select("SELECT count(*) FROM grade WHERE list_num=#{list_num} AND mem_id=#{mem_id}")
	public int checkGrade(GradeCommand grade);
	//å���� ���
	@Update("UPDATE booklist SET list_grade=(SELECT round(AVG(grade_star)) FROM grade WHERE list_num=#{list_num}) WHERE list_num=#{list_num}")
	public void updateAvgGrade(int list_num);
	
	//������ �Խù� ����
	//������ �� ���
	public List<GradeCommand> adminGradeList(Map<String, Object> map);
	public int getAdminRowCountGrade(Map<String,Object> map);
	//������ ���� ������
	@Select("SELECT * FROM grade WHERE grade_num= #{grade_num}")
	public GradeCommand selectAdminGrade(Integer grade_num);
	//�ش� �۹�ȣ�� ������ ����
	public void deleteByGradeNum(List<Integer> list);
}