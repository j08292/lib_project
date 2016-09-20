package kr.spring.member.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.member.dao.MemberMapper;
import kr.spring.member.domain.MemberCommand;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Resource
	private MemberMapper memberMapper;
	// @Resource
	// private BoardMapper boardMapper;

	@Override
	public void insert(MemberCommand member) {
		memberMapper.insert(member);
	}

	@Override
	public MemberCommand selectMember(String mem_id) {
		return memberMapper.selectMember(mem_id);
	}

	@Override
	public void update(MemberCommand member) {
		memberMapper.update(member);
	}

	@Override
	public void delete(String id) {
		// �ش�id�� �ۼ��� �θ���� �۹�ȣ ���ϱ�
		//List<Integer> seq = boardMapper.selectSeqById(id);
		// �ش�id�� �ۼ��� �θ�ۿ� �޸� ��� ����
		//if (seq != null && !seq.isEmpty()) {
		//	boardMapper.deleteReplyBySeqList(seq);
		//}
		// �ش�id�� �ۼ��� ��� ����
		//boardMapper.deleteReplyById(id);
		// �ش�id�� �ۼ��� �θ�� ����
		//boardMapper.deleteById(id);
		// �ش�id ����
		memberMapper.delete(id);

	}

}
