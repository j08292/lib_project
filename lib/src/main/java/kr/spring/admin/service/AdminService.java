package kr.spring.admin.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.penalty.domain.PenaltyCommand;

@Transactional
public interface AdminService {
	public int getSpeechReserveCount();
	public int getMarathonCount();
	public int getWishlistCount();
	public int getRentWaitingCount();
	public int getQnaWaitingCount();
	
	public List<PenaltyCommand> penaltyList();
	public int getRowPenaltyCount();
}
