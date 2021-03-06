package kr.spring.book.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import kr.spring.book.domain.DeliveryCommand;

@Repository
public interface DeliveryMapper {
	@Insert("INSERT INTO delivery(delivery_num, delivery_name, delivery_cell,delivery_status,delivery_email,sample3_postcode,delivery_address,mem_id,rent_num,list_num,string_listnum,string_rentnum,delivery_regdate) "
			+ "VALUES(delivery_seq.nextval,#{delivery_name},#{delivery_cell},#{delivery_status},#{delivery_email},#{sample3_postcode},#{delivery_address},#{mem_id},#{rent_num},#{list_num},#{string_listnum},#{string_rentnum},sysdate)")
	public void insert(DeliveryCommand delivery);

	@Select("SELECT * FROM delivery WHERE mem_id = #{mem_id} ORDER BY delivery_num DESC")
	public List<DeliveryCommand> list(String mem_id);
	
	@Select("SELECT * FROM delivery WHERE rent_num = #{rent_num}")
	public DeliveryCommand delivery(int rent_num);
	
	@Select("SELECT * FROM delivery WHERE string_rentnum like '%' || #{string_rentnum} ||'%'")
	public DeliveryCommand delivery_string(String string_rentnum);
	
}
