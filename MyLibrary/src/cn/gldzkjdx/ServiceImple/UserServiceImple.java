package cn.gldzkjdx.ServiceImple;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import cn.gldzkjdx.DAO.UserDAO;
import cn.gldzkjdx.Service.UserService;
import cn.gldzkjdx.bean.User;

public class UserServiceImple implements UserService{

	private UserDAO userDAO;
	
	public UserDAO getUserDAO() {
		return userDAO;
	}
@Resource(name="UserDAO")
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

/**
 * 用户登录
 */
	public User login(String username, String userpwd) {
		
		return userDAO.login(username, userpwd);
	}
	/**
	 * 添加用户
	 */
	public void addUser(User user) {
		userDAO.AddUser(user);
		
	}
	/**
	 * 获取用户记录
	 */
	public int getRecordCount() {
		return userDAO.getRecordCount();
	}
	/**
	 * 更新用户信息
	 */
	public void updateUser(User user) {
		userDAO.UpdateUser(user);
		
	}
	/**
	 * 删除用户
	 */
	public void deleteUser(int id) {
		userDAO.DeleteUser(id);
		
	}

}
