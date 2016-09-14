package kr.spring.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import org.springframework.stereotype.Repository;

import kr.spring.review.domain.ReviewCommand;
import kr.spring.review.domain.ReviewReplyCommand;

@Repository
public interface ReviewMapper {
	//�Խñ�
	public List<ReviewCommand> list(Map<String,Object> map);
	public int getRowCount(Map<String,Object> map);//list���� �۹�ȣ��? 
	@Insert("INSERT INTO review(review_num,review_title,review_content,review_regdate,review_file,mem_id) "
			+ "VALUES (review_num.nextval,#{review_title},#{review_content},sysdate,#{review_file,jdbcType=VARCHAR},#{mem_id})")
	public void insert(ReviewCommand review);
	@Select("SELECT * FROM review WHERE review_num = #{review_num}")
	public ReviewCommand selectReview(Integer review_num);
	@Update ("UPDATE review SET review_hit = review_hit+1 WHERE review_num = #{review_num}")
	public void updateHit(Integer review_num);
	@Update("UPDATE review SET review_title=#{review_title}, review_content=#{review_content}, review_file=#{review_file,jdbcType=VARCHAR} WHERE review_num=#{review_num}")
	public void update(ReviewCommand review);
	@Delete("DELETE FROM review WHERE review_num = #{review_num}")
	public void delete(Integer review_num);
	
	//������ �Խù� ����
	//���� ������ ���� �� ���� ��������
	public List<ReviewCommand> selectReviewAdmin(List<Integer> list);
	//�ش� �۹�ȣ�� �ۼ��� ��� ��� ����
	public void deleteReplyByReviewNum(List<Integer> list);
	//�ش� �۹�ȣ�� �Խñ� ����
	public void deleteByReviewNum(List<Integer> list);

	//���
	public List<ReviewReplyCommand> listReply(Map<String,Object> map);
	@Select("SELECT count(*) FROM review_reply WHERE review_num = #{review_num}")
	public int getRowCountReply(Map <String, Object> map);	
	@Insert("INSERT INTO review_reply (review_re_num,review_re_content,review_re_regdate,review_num,mem_id) VALUES (review_re_num.nextval,#{review_re_content},sysdate,#{review_num},#{mem_id})")
	public void insertReply(ReviewReplyCommand reviewReplyCommand);	
	@Update("UPDATE review_reply SET review_re_content = #{review_re_content} WHERE review_re_num = #{review_re_num}")
	public void updateReply(ReviewReplyCommand reviewReplyCommand);
	@Delete("DELETE FROM review_reply WHERE review_re_num = #{review_re_num}")
	public void deleteReply(Integer review_re_num);

	//�θ�ۿ� ����� ������ �θ�ۻ����� ����� ���� �����ؾ� ��
	//�θ���� �۹�ȣ�� ��� ����
	@Delete("DELETE FROM review_reply WHERE review_num = #{review_num}")
	public void deleteReplyByReview_num(Integer review_num);
}