package com.sky.springteam.model.mypage.dao;

import java.util.List;

import com.sky.springteam.model.mypage.dto.MypageDTO;

public interface MypageDAO {
	
	public List<MypageDTO> cartMoney();
	public void insert(MypageDTO dto);
	public List<MypageDTO> listMypage(String userid);
	public void delete(int cart_id);
	public void deleteAll(String userid);
	public void update(int cart_id);
	public int sumMoney(String userid);
	public int countCart(String userid, String subject_name);
	public void updateCart(MypageDTO dto);
	public boolean checkCart(String subject_name);

}
