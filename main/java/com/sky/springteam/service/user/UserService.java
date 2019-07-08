package com.sky.springteam.service.user;

import java.util.List;

import com.sky.springteam.model.user.dto.UserDTO;

public interface UserService {

	public List<UserDTO> userList(String user_group);
	public int userCnt(String user_group);
	public void insertUser(UserDTO dto);
	public UserDTO viewUser(String userid);
	public void deleteUser(String userid);
	public void updateUser(UserDTO dto);
	public boolean idCheck(String userid);
	public boolean pwdCheck(String userid, String pwd);
	public boolean emailCheck(String email);
	public UserDTO findUser(String email, String name);
	
}