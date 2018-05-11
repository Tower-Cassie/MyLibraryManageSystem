package cn.gldzkjdx.Service;

import cn.gldzkjdx.bean.Book;
import cn.gldzkjdx.bean.User;

public interface UserService {
	//�û���¼
	public User login(String username,String userpwd);
	//����û�
	public void addUser(User user);
	//��ȡ��¼����
	public int getRecordCount();
	//�����û���Ϣ
	public void updateUser(User user);
	//ɾ���û�
	public void deleteUser(int id);

}
