package kr.spring.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.admin.dao.AdminMapper;
import kr.spring.booklist.domain.AdminBooklistCommand;
import kr.spring.penalty.domain.PenaltyCommand;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Resource
	private AdminMapper adminMapper;
	//���� -  ������ üũ ���� ====================================
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
	//���� - ������ ����ȸ�� ���� ==================================
	@Override
	public List<PenaltyCommand> penaltyList() {
		return adminMapper.penaltyList();
	}

	@Override
	public int getRowPenaltyCount() {
		return adminMapper.getRowPenaltyCount();
	}
	//���� - �α⵵�� ���� ======================================
	@Override
	public List<AdminBooklistCommand> rentRankList() {
		return adminMapper.rentRankList();
	}
	//���� - �ֱ� 3���� ������Ȳ ==================================
	@Override
	public int getBookRentCount_2() {		
		return adminMapper.getBookRentCount_2();
	}

	@Override
	public int getBookRentCount_1() {
		return adminMapper.getBookRentCount_1();
	}

	@Override
	public int getBookRentCount_0() {
		return adminMapper.getBookRentCount_0();
	}

	@Override
	public int getWishlistCount_2() {
		return adminMapper.getWishlistCount_2();
	}

	@Override
	public int getBooklistCount_2() {
		return adminMapper.getBooklistCount_2();
	}

	@Override
	public int getWishlistCount_1() {
		return adminMapper.getWishlistCount_1();
	}

	@Override
	public int getBooklistCount_1() {
		return adminMapper.getBooklistCount_1();
	}

	@Override
	public int getWishlistCount_0() {
		return adminMapper.getWishlistCount_0();
	}

	@Override
	public int getBooklistCount_0() {
		return adminMapper.getBooklistCount_0();
	}
}