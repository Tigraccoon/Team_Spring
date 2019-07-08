package com.sky.springteam.service.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sky.springteam.model.user.dao.UserDAO;
import com.sky.springteam.model.user.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService {

	@Inject UserDAO userDao;
	
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
		
		userDao.insertUser(dto);
	}

	@Override
	public UserDTO viewUser(String userid) {
		
		return userDao.viewUser(userid);
	}

	@Override
	public void deleteUser(String userid) {
		
		userDao.deleteUser(userid);
	}

	@Override
	public void updateUser(UserDTO dto) {
		
		userDao.updateUser(dto);
	}

	@Override
	public boolean idCheck(String userid) {
		
		return userDao.idCheck(userid);
	}

	@Override
	public boolean pwdCheck(String userid, String pwd) {
		
		return userDao.pwdCheck(userid, pwd);
	}

	@Override
	public boolean emailCheck(String email) {
		
		return userDao.emailCheck(email);
	}

	@Override
	public UserDTO findUser(String email, String name) {
		
		return userDao.findUser(email, name);
	}

}
