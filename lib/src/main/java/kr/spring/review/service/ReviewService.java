package kr.spring.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.review.domain.ReviewCommand;
import kr.spring.review.domain.ReviewReplyCommand;

@Transactional
public interface ReviewService {	
	//�θ��
	@Transactional(readOnly=true)
	public List<ReviewCommand> list(Map<String,Object> map);
	@Transactional(readOnly=true)
	public int getRowCount(Map<String,Object> map);//list���� �۹�ȣ��?
	public void insert(ReviewCommand review);
	@Transactional(readOnly=true)
	public ReviewCommand selectReview(Integer review_num);//
	public void updateHit(Integer review_num);
	public void update(ReviewCommand review);
	public void delete(Integer review_num);

	//������ �Խù� ����
	//���� ������ ���� �� ���� ��������
	public List<ReviewCommand> selectReviewAdmin(List<Integer> list);
	//�ش� �۹�ȣ�� �Խñ� ����S
	public void deleteByReviewNum(List<Integer> list);
	
	//���
	@Transactional(readOnly=true)
	public List<ReviewReplyCommand> listReply (Map<String,Object> map);
	@Transactional(readOnly=true)
	public int getRowCountReply(Map <String, Object> map);
	public void insertReply(ReviewReplyCommand reviewReplyCommand);
	public void updateReply(ReviewReplyCommand reviewReplyCommand);
	public void deleteReply(Integer review_re_num);
}