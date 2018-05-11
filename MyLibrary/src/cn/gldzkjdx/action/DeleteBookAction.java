package cn.gldzkjdx.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;

import cn.gldzkjdx.Service.BookService;
import cn.gldzkjdx.bean.Book;

@Component("deleteBook")
@Scope("prototype")
public class DeleteBookAction extends ActionSupport{
	private BookService bookService;
    private String bookid;
    
    
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public BookService getBookService() {
		return bookService;
	}
	@Resource(name="BookService")
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	

	@Override
	public String execute() throws Exception{
	         bookService.deleteBook(Integer.parseInt(bookid));
	         return "success";
        }
}
