package cn.gldzkjdx.DAO;

import java.util.List;

import cn.gldzkjdx.bean.Book;

public interface BookDAO {
	//添加图书
		public void AddBook(Book book);
		//删除图书
		public void DeleteBook(int id);
		//修改图书信息
		public void UpdateBook(Book book);
		//例举所有的图书
		public List<Book> ListBooks();
		//根据书名查找图书
		public List<Book> FindBookByName(String bookname);
		//查找对应用户的所有图书
		public List<Book> FindBookByUser(String bookowner);
		//根据书ID查找书
		public Book FindBookByID(int id);
		//根据书的编号查询书
		public Book FindIDByBooknum(String booknum);
		//获取记录数
		public int getRecordCount();
		//获取书的类型的记录数
		public int getRecordCountBybooktype(String booktype);
		//获取书名的记录数
		public int getRecordCountBybookname(String bookname);
		//获取书的状态的记录数
		public int getRecordCountBybookstatus(String bookstatus);
		//获取书的出版社的记录数
		public int getRecordCountBybooksource(String booksource);
		//获取书的拥有者的记录数
		public int getRecordCountBybookowner(String bookowner);
		//获取书的编号的记录数
		public int getRecordCountBybooknum(String booknum);
		//根据书归属者查找书
		public List<Book> FindBookByUsername(String book_owner);
		
}
