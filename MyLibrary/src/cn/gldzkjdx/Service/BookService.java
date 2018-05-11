package cn.gldzkjdx.Service;

import cn.gldzkjdx.bean.Book;
import cn.gldzkjdx.bean.User;

public interface BookService {
	public void addBook(Book book);
	public int getRecordCount();
	public void updateBook(Book book);
	public void deleteBook(int id);
	//根据书的编号查询书
	public Book FindIDByBooknum(String booknum);
}
