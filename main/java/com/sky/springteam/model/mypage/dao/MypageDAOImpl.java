package com.sky.springteam.model.mypage.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sky.springteam.model.mypage.dto.MypageDTO;

@Repository
public class MypageDAOImpl implements MypageDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<MypageDTO> cartMoney() {
		return sqlSession.selectList("mypage.cart_money");
	}
	
	@Override
	public MypageDTO cartTotal() {
		return sqlSession.selectOne("mypage.cart_total");
	}

	@Override
	public void insert(MypageDTO dto) {
		sqlSession.insert("mypage.insert", dto);

	}

	@Override
	public List<MypageDTO> listMypage(String userid) {
		return sqlSession.selectList("mypage.listCart", userid);
	}

	@Override
	public void delete(int cart_id) {
		sqlSession.delete("mypage.delete", cart_id);

	}

	@Override
	public void deleteAll(String userid) {
		sqlSession.delete("mypage.deleteAll", userid);

	}

	@Override
	public void update(int cart_id) {
		// TODO Auto-generated method stub

	}

	@Override
	public int sumMoney(String userid) {
		return sqlSession.selectOne("mypage.sumMoney", userid);
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
		int result = sqlSession.selectOne("mypage.cartcheck", subject_name);
		if(result == 1) {
			return true;
		}else {
			return false;
		}
	}



}
