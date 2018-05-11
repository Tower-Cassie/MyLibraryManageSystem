package cn.gldzkjdx.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;

import cn.gldzkjdx.Service.BookService;
import cn.gldzkjdx.Service.UserService;
import cn.gldzkjdx.bean.Book;

@Component("deleteUser")
@Scope("prototype")
public class DeleteUserAction extends ActionSupport{
    private UserService userService;
    private String userid;
    
    
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
	@Override
	public String execute() throws Exception{
		    userService.deleteUser(Integer.parseInt(userid));
	         return "success";
        }
}
