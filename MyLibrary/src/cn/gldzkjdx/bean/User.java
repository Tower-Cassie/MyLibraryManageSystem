package cn.gldzkjdx.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class User {
	/**
	 * author��Cassie
	 * time:2018-01-05
	 */
	private int user_id;//�û�ID
	private String user_name;//�û���
	private String user_paswd;//�û�����
	private String user_type;//�û����ͣ�1��ʾ����Ա��0��ʾ��ͨ�û���
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_paswd() {
		return user_paswd;
	}
	public void setUser_paswd(String user_paswd) {
		this.user_paswd = user_paswd;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	
}
