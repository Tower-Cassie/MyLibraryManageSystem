package cn.gldzkjdx.DAOImple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;

import cn.gldzkjdx.DAO.UserDAO;
import cn.gldzkjdx.bean.User;


public class UserDAOImple implements UserDAO{

	private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Autowired
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}


	/**
	 * 添加用户
	 * @param user
	 */
	public void AddUser(User user) {
		this.getHibernateTemplate().persist(user);
		
	}

	/**
	 * 删除用户
	 * @param id
	 */
	public void DeleteUser(int id) {
		User user = new User();
		user.setUser_id(id);
		this.getHibernateTemplate().delete("cn.gldzkjdx.bean.User", user);
		
	}

	/**
	 * 修改用户信息
	 * @param username
	 */
	public void UpdateUser(User user) {
		this.getHibernateTemplate().update("cn.gldzkjdx.bean.User", user);
		
	}
/**
 * 根据用户名更改用户信息
 * @param username
 */
	public void UpdateUser(String username) {
		User user = new User();
		user.setUser_name(username);
		this.getHibernateTemplate().update("cn.gldzkjdx.bean.User", user);
		
	}

	/**
	 * 例举用户信息
	 */
	public List<User> ListUser() {
		return this.getHibernateTemplate().find("from cn.gldzkjdx.bean.User");
	}

	/**
	 * 根据用户名查找用户信息
	 * @param name
	 */
	@SuppressWarnings("unchecked")
	public List<User> FindUserByname(String name) {
		return this.getHibernateTemplate().find("from cn.gldzkjdx.bean.User u where u.user_name =?", name);
	}

	@SuppressWarnings("unchecked")
	public List<User> ListUserByType(int type) {
		return this.getHibernateTemplate().find("from cn.gldzkjdx.bean.User u where u.user_type =?", type);
	}

	
public static void main(String[] args){
	ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");
		//XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("bean.xml"));
		UserDAO userDAO = (UserDAO) factory.getBean("UserDAO");
		User user = new User();
		user.setUser_name("tom");
		user.setUser_paswd("19950219");
		user.setUser_type("管理员");
		userDAO.AddUser(user);
		//userDAO.DeleteUser(2);
		//List<User> lists = userDAO.ListUser();
		//List<User> lists = userDAO.ListUserByType(1);
		List<User> lists = userDAO.FindUserByname("tom");
		for(User u :lists)
			System.out.println("ID号:" + u.getUser_id() + "---->" + "用户名：" + u.getUser_name());
		
		
		User listuser = userDAO.login("admin", "123");
		if(listuser != null)
			System.out.println("dengluID号:" + listuser.getUser_id() + "---->" + "用户名：" + listuser.getUser_name() + "密码："+listuser.getUser_paswd());
		
	}

/**
 * 登录
 * @param user_name
 * @param user_paswd
 * @return
 */

@SuppressWarnings("unchecked")
public User login(String user_name,String user_paswd){
	// TODO Auto-generated method stub
	System.out.println("进入login函数");
	System.out.println("传过来的参数中，用户名为："+user_name + "密码为："+user_paswd);
	if(this.getHibernateTemplate() != null)
		System.out.println("getHibernateTemplate不为空");
	else
		System.out.println("getHibernateTemplate为空");
		List<User> listuser = (List<User>)this.getHibernateTemplate().find("from cn.gldzkjdx.bean.User u where u.user_name =? and u.user_paswd=?", new String[]{user_name,user_paswd});
		return listuser.isEmpty()?null:listuser.get(0);
}

/**
 * 获取用户总数
 */
public int getRecordCount() {
	String hql = "select count(*) from cn.gldzkjdx.bean.User u";
	List<Long> list = (List<Long>)this.getHibernateTemplate().find(hql);
	if(list != null && list.size() > 0)
		return list.get(0).intValue();
	return 0;
}
//根据用户名和用户密码获取用户类型
		public User findTypeByNamePaswd(String username,String userpaswd){
			return (User)this.getHibernateTemplate().find("from cn.gldzkjdx.bean.User u where u.user_name =? and u.user_paswd=?",new String[]{username,userpaswd}).get(0);
		}

}
