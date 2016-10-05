package kr.spring.book.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.book.dao.DeliveryMapper;
import kr.spring.book.domain.DeliveryCommand;

@Service("deliveryService")
public class DeliveryServiceImpl implements DeliveryService{

	@Resource
	private DeliveryMapper deliveryMapper;
	
	@Override
	public void insert(DeliveryCommand delivery) {
		deliveryMapper.insert(delivery);
	}

	@Override
	public List<DeliveryCommand> list(String mem_id) {
		return deliveryMapper.list(mem_id);
	}

	@Override
	public DeliveryCommand delivery(int rent_num) {
		return deliveryMapper.delivery(rent_num);
	}

	@Override
	public DeliveryCommand delivery_string(String string_rentnum) {
		return deliveryMapper.delivery_string(string_rentnum);
	}


}
