package cn.gldzkjdx.DAO;

import java.util.List;

import cn.gldzkjdx.bean.User;

public interface UserDAO {

	//����û�
		public void AddUser(User user);
		//ɾ���û�
		public void DeleteUser(int id);
		//�޸��û���Ϣ
		public void UpdateUser(User user);
		//���������û�
		public List<User> ListUser();
		//�����û��������û���Ϣ
		public  List<User> FindUserByname(String name);
		//�������ж�Ӧ���͵��û�
		public List<User> ListUserByType(int type);
		//��¼
		public User login(String user_name,String user_paswd);
		//��ȡ��¼����
		public int getRecordCount();
		//�����û������û������ȡ�û�����
		public User findTypeByNamePaswd(String username,String userpaswd);
		
}
