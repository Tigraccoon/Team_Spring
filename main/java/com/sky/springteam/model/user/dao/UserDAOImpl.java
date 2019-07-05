package com.sky.springteam.model.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sky.springteam.model.user.dto.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<UserDTO> userList(String user_group) {
		
		return null;
	}
	
	@Override
	public int userCnt(String user_group) {
		
		return 0;
	}

	@Override
	public void insertUser(UserDTO dto) {
		
		
	}

	@Override
	@Transactional
	public UserDTO viewUser(String userid) {
		sqlSession.update("user.updatelastlogin", userid);
		
		return sqlSession.selectOne("user.viewUser", userid);
	}

	@Override
	public void deleteUser(String userid) {
		
		
	}

	@Override
	public void updateUser(UserDTO dto) {
		
		
	}

	@Override
	public boolean idCheck(String userid) {
		int result = sqlSession.selectOne("user.idcheck", userid);

		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean pwdCheck(String userid, String pwd) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("userid", userid);
		map.put("pwd", pwd);
		
		int result = sqlSession.selectOne("user.pwdcheck", map);

		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean emailCheck(String email) {
		
		return false;
	}

	@Override
	public UserDTO findUser(String email, String name) {
		
		return null;
	}


}
