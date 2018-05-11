package cn.gldzkjdx.Service;

import cn.gldzkjdx.bean.Book;
import cn.gldzkjdx.bean.User;

public interface UserService {
	//用户登录
	public User login(String username,String userpwd);
	//添加用户
	public void addUser(User user);
	//获取记录总数
	public int getRecordCount();
	//更新用户信息
	public void updateUser(User user);
	//删除用户
	public void deleteUser(int id);

}
