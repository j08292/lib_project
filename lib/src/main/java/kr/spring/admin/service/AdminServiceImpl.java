package kr.spring.admin.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.admin.dao.AdminMapper;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Resource
	private AdminMapper adminMapper;
	
	@Override
	public int getSpeechReserveCount() {
		return adminMapper.getSpeechReserveCount();
	}

}
