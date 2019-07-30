package com.sky.springteam.service.mypage;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sky.springteam.model.mypage.dao.MypageDAO;
import com.sky.springteam.model.mypage.dto.MypageDTO;

@Service
public class MypageServiceImpl implements MypageService {

	@Inject
	MypageDAO mypageDao;
	
	@Override
	public List<MypageDTO> cartMoney() {
		return mypageDao.cartMoney();
	}
	
	@Override
	public MypageDTO cartTotal() {
		return mypageDao.cartTotal();
	}

	@Override
	public void insert(MypageDTO dto) {
		mypageDao.insert(dto);

	}

	@Override
	public List<MypageDTO> listMypage(String userid) {
		return mypageDao.listMypage(userid);
	}

	@Override
	public void delete(int cart_id) {
		mypageDao.delete(cart_id);

	}

	@Override
	public void deleteAll(String userid) {
		mypageDao.deleteAll(userid);

	}

	@Override
	public void update(int cart_id) {
		// TODO Auto-generated method stub

	}

	@Override
	public int sumMoney(String userid) {
		return mypageDao.sumMoney(userid);
	}

	@Override
	public int countCart(String userid, String subject_name) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateCart(MypageDTO dto) {
		// TODO Auto-generated method stub

	}
	
	@Override
	public boolean checkCart(String subject_name) {
		return mypageDao.checkCart(subject_name);
	}


}
