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
 * �û���¼
 */
	public User login(String username, String userpwd) {
		
		return userDAO.login(username, userpwd);
	}
	/**
	 * ����û�
	 */
	public void addUser(User user) {
		userDAO.AddUser(user);
		
	}
	/**
	 * ��ȡ�û���¼
	 */
	public int getRecordCount() {
		return userDAO.getRecordCount();
	}
	/**
	 * �����û���Ϣ
	 */
	public void updateUser(User user) {
		userDAO.UpdateUser(user);
		
	}
	/**
	 * ɾ���û�
	 */
	public void deleteUser(int id) {
		userDAO.DeleteUser(id);
		
	}

}
