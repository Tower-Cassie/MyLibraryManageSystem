package cn.gldzkjdx.Service;

import cn.gldzkjdx.bean.Book;
import cn.gldzkjdx.bean.User;

public interface BookService {
	public void addBook(Book book);
	public int getRecordCount();
	public void updateBook(Book book);
	public void deleteBook(int id);
	//������ı�Ų�ѯ��
	public Book FindIDByBooknum(String booknum);
}
