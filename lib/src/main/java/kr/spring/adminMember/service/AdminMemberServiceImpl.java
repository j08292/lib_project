package kr.spring.adminMember.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.adminMember.dao.AdminMemberMapper;
import kr.spring.adminMember.domain.AdminMemberCommand;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService{

	@Resource
	private AdminMemberMapper adminMemberMapper;
	
	@Override
	public List<AdminMemberCommand> list(Map<String, Object> map) {
		return adminMemberMapper.list(map);
	}

	@Override
	public int getRowCount(Map<String, Object> map) {
		return adminMemberMapper.getRowCount(map);
	}

	@Override
	public List<AdminMemberCommand> blockList(Map<String, Object> map) {
		return null;
	}

	@Override
	public int getBlockRowCount(Map<String, Object> map) {
		return 0;
	}
}