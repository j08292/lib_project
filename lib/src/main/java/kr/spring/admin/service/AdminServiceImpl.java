package kr.spring.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.admin.dao.AdminMapper;
import kr.spring.penalty.domain.PenaltyCommand;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Resource
	private AdminMapper adminMapper;
	
	@Override
	public int getSpeechReserveCount() {
		return adminMapper.getSpeechReserveCount();
	}

	@Override
	public int getMarathonCount() {
		return adminMapper.getMarathonCount();
	}

	@Override
	public int getWishlistCount() {
		return adminMapper.getWishlistCount();
	}

	@Override
	public int getRentWaitingCount() {
		return adminMapper.getRentWaitingCount();
	}

	@Override
	public int getQnaWaitingCount() {
		return adminMapper.getQnaWaitingCount();
	}

	@Override
	public List<PenaltyCommand> penaltyList() {
		return adminMapper.penaltyList();
	}

	@Override
	public int getRowPenaltyCount() {
		return adminMapper.getRowPenaltyCount();
	}

}
