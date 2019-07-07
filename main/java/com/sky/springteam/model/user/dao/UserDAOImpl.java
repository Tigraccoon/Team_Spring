package com.sky.springteam.model.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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
		
		sqlSession.insert("user.insertuser", dto);
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
		
		sqlSession.update("updateuser", dto);
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
		int result = sqlSession.selectOne("user.emailcheck", email);

		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public UserDTO findUser(String email, String name) {
		Map<String, Object> map = new HashMap<>();
		map.put("email", email);
		map.put("name", name);
		
		UserDTO dto = sqlSession.selectOne("user.finduser", map);
		
		if(dto == null) {
			dto = new UserDTO();
			dto.setUserid("아이디, 비밀번호 찾기에 실패하였습니다. 이메일, 이름을 확인하세요!");
		} else {	//임시 비밀번호로 변경
			int tempPwd=0;
			Random r = new Random();

			while(true) {
				tempPwd = r.nextInt(9999);
				if (tempPwd > 1000) break;
			}
			dto.setPwd(String.valueOf(tempPwd));
			updateUser(dto);
		}
		
		return dto;
	}


}
