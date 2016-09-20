package kr.spring.qna.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import kr.spring.qna.domain.QnaCommand;
import kr.spring.qna.domain.QnaReplyCommand;

@Repository
public interface QnaMapper {

	
	/*
	private int qna_num;//�۹�ȣ
	private String qna_title;//������
	private String qna_passwd;//���ۼ� ��й�ȣ
	private String qna_content;//qna�ۼ�����
	private String qna_regdate;//�ۼ���
	private int qna_hit;//��ȸ��
	private String mem_id;
	*/
	
	
	//�Խñ�
	public List<QnaCommand> list(Map<String,Object>map);
	public int getRowCount(Map<String,Object>map);
	@Insert("INSERT INTO qna(qna_num,mem_id,qna_title,qna_content,qna_passwd,qna_hit,qna_regdate)"
			+ " VALUES (qna_num.nextval, #{mem_id}, #{qna_title},#{qna_content},#{qna_passwd},0,sysdate)")
	public void insert(QnaCommand qnaCommand);
	@Select("SELECT * FROM qna WHERE qna_num = #{qna_num}")
	public QnaCommand selectQna(Integer qna_num);
	@Update("UPDATE qna SET qna_hit = qna_hit+1 WHERE qna_num = #{qna_num}")
	public void updateHit(Integer qna_num);
	@Update("UPDATE qna SET qna_title=#{qna_title}, qna_content= #{qna_content}, qna_passwd=#{qna_passwd} WHERE qna_num = #{qna_num}")
	public void update(QnaCommand qnaCommand);
	@Delete("DELETE FROM qna WHERE qna_num = #{qna_num}")
	public void delete(Integer qna_num);
	
	
	
	
	/*
	 * private int qna_re_num;//��۹�ȣ
	private int qna_num;//�Խñ۹�ȣ
	private String mem_id;//�ۼ��ھ��̵�
	private int qna_re_content;//��۳���
	private String qna_re_regdate;//�ۼ��ð�
	private int mem_level;//������
	*/
	
	//���
	public List<QnaReplyCommand> listReply(Map<String, Object> map);
	@Select("SELECT count(*) FROM qna_reply WHERE qna_num= #{qna_num}")
	public int getRowCountReply(Map <String, Object> map);
	@Insert("INSERT INTO qna_reply (qna_re_num, qna_re_content, qna_re_regdate,qna_num,mem_id,mem_level) "
			+ "VALUES (qna_re_num.nextval,#{qna_re_content},sysdate,#{qna_num}, #{mem_id}, #{mem_level})")
	public void insertReply(QnaReplyCommand qnaReplyCommand);
	@Update("UPDATE qna_reply SET qna_re_content = #{qna_re_content} WHERE qna_re_num = #{qna_re_num}")
	public void updateReply(QnaReplyCommand qnaRepluCommand);
	@Delete("DELETE FROM qna_reply WHERE qna_re_num = #{qna_re_num}")
	public void deleteReply(Integer qna_re_num);
	
	//�θ�ۿ� ����� ������ �θ�ۻ����� ����� ���� �����ؾ� ��
	//�θ���� �۹�ȣ�� ��� ����
	@Delete("DELETE FROM qna_reply WHERE qna_num = #{qna_num}")
	public void deleteReplyByReview_num(Integer qna_num);
	
}
