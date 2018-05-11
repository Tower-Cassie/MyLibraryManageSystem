package cn.gldzkjdx.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;

import cn.gldzkjdx.Service.BookService;
import cn.gldzkjdx.Service.UserService;
import cn.gldzkjdx.bean.Book;
import cn.gldzkjdx.bean.User;

@Component("addUser")
@Scope("prototype")
public class AddUserAction extends ActionSupport{
    private UserService userService;
    private String userid;
    private String username;
    private String userpaswd;
    private String usertype;
    
    
	public UserService getUserService() {
		return userService;
	}
	@Resource(name = "UserService")
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String getUserid() {
		return userid;
	}
	

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpaswd() {
		return userpaswd;
	}
	public void setUserpaswd(String userpaswd) {
		this.userpaswd = userpaswd;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	@Override
	public String execute() throws Exception{
		User user = new User();
		user.setUser_name(new String(username.getBytes("ISO-8859-1"),"UTF-8"));
		user.setUser_paswd(new String(userpaswd.getBytes("ISO-8859-1"),"UTF-8"));
		user.setUser_type(new String(usertype.getBytes("ISO-8859-1"),"UTF-8"));
		userService.addUser(user);
	         return "success";
        }
}
