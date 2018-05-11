package cn.gldzkjdx.action;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;

import cn.gldzkjdx.Service.BookService;
import cn.gldzkjdx.bean.Book;

@Component("updateBook")
@Scope("prototype")
public class UpdateBookAction extends ActionSupport{
	

	private String bookname;
    private String booknum;
    private String bookowner;
    private String booksource;
    private String booktype;
    private String bookstatus;
    private String bookid;
    private BookService bookService;
    
    
	public BookService getBookService() {
		return bookService;
	}
	@Resource(name="BookService")
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	
	
	
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getBooknum() {
		return booknum;
	}
	public void setBooknum(String booknum) {
		this.booknum = booknum;
	}
	public String getBookowner() {
		return bookowner;
	}
	public void setBookowner(String bookowner) {
		this.bookowner = bookowner;
	}
	public String getBooksource() {
		return booksource;
	}
	public void setBooksource(String booksource) {
		this.booksource = booksource;
	}
	public String getBooktype() {
		return booktype;
	}
	public void setBooktype(String booktype) {
		this.booktype = booktype;
	}
	public String getBookstatus() {
		return bookstatus;
	}
	public void setBookstatus(String bookstatus) {
		this.bookstatus = bookstatus;
	}

	@Override
	public String execute() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
	    ServletContext servletContext = ServletActionContext.getServletContext();
	    request.getSession();
	    HttpServletResponse response = ServletActionContext.getResponse();
   		     Book book = new Book();
   		     booknum = new String(booknum.getBytes("ISO-8859-1"),"UTF-8");
   		  String flag = new String(bookowner.getBytes("ISO-8859-1"),"UTF-8");
   		  System.out.println("bookid="+bookid);
   		     //�޸�ͼ����Ϣ(��̨)
   		    	if(bookname.equals("") || bookid.equals("") || booknum.equals("") || booksource.equals("") ||  booktype.equals("") || bookstatus.equals("") || bookowner.equals(""))
   		    	{
   		    		response.setContentType("text/html; charset=UTF-8");
   		        	String url = "info.jsp?info=The information you input has empty,please input again!";
   					response.sendRedirect(url);
   			
   					return null;
   		    	}
   		    	if(flag.equals("����Ա"))
		   			book.setBook_status("�ڿ�");
		   		 else
		   			 book.setBook_status("���"); 
	   		  book.setBook_id(Integer.parseInt(bookid));
	   		  book.setBook_owner(new String(bookowner.getBytes("ISO-8859-1"),"UTF-8"));
		  // 	book.setBook_status(new String(bookstatus.getBytes("ISO-8859-1"),"UTF-8")); 
   		     book.setBook_name(new String(bookname.getBytes("ISO-8859-1"),"UTF-8"));
	         book.setBook_num(booknum);
	         book.setBook_source(new String(booksource.getBytes("ISO-8859-1"),"UTF-8"));
	         book.setBook_type(new String(booktype.getBytes("ISO-8859-1"),"UTF-8"));
	         bookService.updateBook(book);
	         return "success";
	}
}
