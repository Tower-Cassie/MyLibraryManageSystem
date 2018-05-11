package cn.gldzkjdx.action;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import cn.gldzkjdx.DAO.UserDAO;
import cn.gldzkjdx.Service.UserService;
import cn.gldzkjdx.bean.User;

import com.opensymphony.xwork2.ActionSupport;

@Component("login")
@Scope("prototype")
public class LoginAction extends ActionSupport {

	private String username;
	private String userpwd;
	private UserService service;
	/*public LoginAction(){
		ApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");
		service = (Service) factory.getBean("Service");
	}
	*/
	public UserService getService() {
		return service;
	}
@Resource(name="UserService")
	public void setService(UserService service) {
		this.service = service;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	
	@Override
	public String execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
	    ServletContext servletContext = ServletActionContext.getServletContext();
	    request.getSession();
	    HttpServletResponse response = ServletActionContext.getResponse();
	    username = new String(username.getBytes("ISO-8859-1"),"UTF-8");
	    userpwd = new String(userpwd.getBytes("ISO-8859-1"),"UTF-8");
	    System.out.println("传过来的参数中，用户名为："+username + "密码为："+userpwd);
		if(username.isEmpty()|| userpwd.isEmpty()){


		System.out.println("用户名或用户密码为空");
			response.setContentType("text/html; charset=UTF-8");
        	String url = "info.jsp?info=user name is null or user password is null ,please input again!";
			response.sendRedirect(url);
	
			return null;
			//return "loginfail";
			
		
		}else{
				System.out.println("用户名不为空");
				User user = service.login(username, userpwd);
				if(user==null){
					response.setContentType("text/html; charset=UTF-8");
		        	String url = "info.jsp?info=The user isn't exist(user name is error or user password is error),please input again!";
					response.sendRedirect(url);
			
					return null;
				}else if(user.getUser_type().equals("管理员")){
					System.out.print("登录成功");
					return "adminsuccess";
				}else
					return "usersuccess";
			
		}
			
			
	}
}
