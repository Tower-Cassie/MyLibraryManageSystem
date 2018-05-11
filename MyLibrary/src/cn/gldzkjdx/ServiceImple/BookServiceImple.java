package cn.gldzkjdx.ServiceImple;

import javax.annotation.Resource;


import cn.gldzkjdx.DAO.BookDAO;
import cn.gldzkjdx.Service.BookService;
import cn.gldzkjdx.bean.Book;

public class BookServiceImple implements BookService{

	private BookDAO bookDAO;
	
	

	public BookDAO getBookDAO() {
		return bookDAO;
	}


@Resource(name="BookDAO")
	public void setBookDAO(BookDAO bookDAO) {
		this.bookDAO = bookDAO;
	}



	public void addBook(Book book) {
		bookDAO.AddBook(book);
		
	}




	public int getRecordCount() {
		return bookDAO.getRecordCount();
	}


	public void updateBook(Book book) {
		bookDAO.UpdateBook(book);
		
	}
	public void deleteBook(int id){
		bookDAO.DeleteBook(id);
	}


	public Book FindIDByBooknum(String booknum) {
		return bookDAO.FindIDByBooknum(booknum);
	}

}
