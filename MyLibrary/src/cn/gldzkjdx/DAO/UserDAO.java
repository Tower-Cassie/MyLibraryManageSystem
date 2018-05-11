package cn.gldzkjdx.DAO;

import java.util.List;

import cn.gldzkjdx.bean.User;

public interface UserDAO {

	//添加用户
		public void AddUser(User user);
		//删除用户
		public void DeleteUser(int id);
		//修改用户信息
		public void UpdateUser(User user);
		//例举所用用户
		public List<User> ListUser();
		//根据用户名查找用户信息
		public  List<User> FindUserByname(String name);
		//例举所有对应类型的用户
		public List<User> ListUserByType(int type);
		//登录
		public User login(String user_name,String user_paswd);
		//获取记录总数
		public int getRecordCount();
		//根据用户名和用户密码获取用户类型
		public User findTypeByNamePaswd(String username,String userpaswd);
		
}
