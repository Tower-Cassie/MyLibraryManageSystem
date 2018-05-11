package cn.gldzkjdx.DAOImple;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.gldzkjdx.DAO.BookDAO;
import cn.gldzkjdx.bean.Book;

public class BookDAOImple  implements BookDAO{

	//自动获取spring创建的对象，此处的属性名一定得和spring配置文件中的属性名一致
	
	private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Autowired
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
		/**
		 * 添加图书
		 * @param book
		 * 
		 */
		public  void AddBook(Book book) {
			System.out.println("进入添加图书函数");
			System.out.println("传过来的参数中，书名为："+book.getBook_name());
			if(this.getHibernateTemplate() != null)
				System.out.println("getHibernateTemplate不为空");
			else
				System.out.println("getHibernateTemplate为空");
			this.getHibernateTemplate().persist(book);
			
		}

		/**
		 * 删除图书
		 * @param id
		 */
		public void DeleteBook(int id) {
			 Book book = new Book();
			 book.setBook_id(id);
			this.getHibernateTemplate().delete("cn.gldzkjdx.bean.Book",book);
		}
		/**
		 * 查询记录总数
		 */
		public int getRecordCount(){
			String hql = "select count(*) from cn.gldzkjdx.bean.Book b";
			List<Long> list = (List<Long>)this.getHibernateTemplate().find(hql);
			if(list != null && list.size() > 0)
				return list.get(0).intValue();
			return 0;
		}
		/**
		 * 根据书名更新书的信息
		 * @param id
		 */
		public void UpdateBook(Book book) {
			this.getHibernateTemplate().update("cn.gldzkjdx.bean.Book", book);
		}
		public void UpdateBookByname(String bookname) {
			Book book = new Book();
			book.setBook_name(bookname);
			this.getHibernateTemplate().update("cn.gldzkjdx.bean.Book", book);
		}

		/**
		 * 查询所有图书
		 * @return List<Book>
		 */
		public List<Book> ListBooks() {
			return this.getHibernateTemplate().find("from cn.gldzkjdx.bean.Book");
			
		}

		/**
		 * 根据书名查找书
		 * @param id
		 * @return List<Book>
		 */
		public List<Book> FindBookByName(String bookname) {
			return this.getHibernateTemplate().find("from cn.gldzkjdx.bean.Book b where b.book_name = ?",bookname);
		
		}
		
		/**
		 * 根据书归属者查找书
		 * @param id
		 * @return List<Book>
		 */
		public List<Book> FindBookByUsername(String book_owner) {
			return this.getHibernateTemplate().find("from cn.gldzkjdx.bean.Book b where b.book_owner = ?",book_owner);
		
		}

		/**
		 * @param username
		 * @return List<Book>
		 */
		public List<Book> FindBookByUser(String bookowner) {
			return this.getHibernateTemplate().find("from cn.gldzkjdx.bean.Book b where b.book_owner =?",bookowner);
		}

		public Book FindBookByID(int id) {
			return (Book)this.getHibernateTemplate().get("cn.gldzkjdx.bean.Book", id);
		}

		
		public static void main(String[] args){
			System.out.print("Nihao&**********************************************8 ");
			
			XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("bean.xml"));
			BookDAO bookDAO = (BookDAO) factory.getBean("BookDAO");
			Book book = new Book();
			book.setBook_name("流浪汉");
			book.setBook_num("874730480X");
			book.setBook_owner("cassie");
			book.setBook_source("清华大学");
			book.setBook_status("借出");
			book.setBook_type("计算机安全");
			bookDAO.AddBook(book);
			
			System.out.print("111111111111111&**********************************************8 ");
			//bookDAO.DeleteBook(2);
			//Book test = bookDAO.FindBookByID(3);
			//System.out.print("书名："+test.getBook_name());
			
			
			//List<Book> lists = bookDAO.FindBookByUser("cassie");
			//List<Book>lists = bookDAO.ListBooks();
			List<Book>lists = bookDAO.FindBookByName("流浪汉");
			for(Book b :lists)
				System.out.println("ID号:" + b.getBook_id() + "---->" + "书名：" + b.getBook_name());
			
			
			
		}
		/**
		 * 查询图书类型的记录数
		 */
		public int getRecordCountBybooktype(String booktype) {
			String hql = "select count(*) from cn.gldzkjdx.bean.Book b where b.book_type = ?";
			List<Long> list = (List<Long>)this.getHibernateTemplate().find(hql,booktype);
			if(list != null && list.size() > 0)
				return list.get(0).intValue();
			return 0;
		}
		/**
		 * 查询图书名的记录数
		 */
		public int getRecordCountBybookname(String bookname) {
			String hql = "select count(*) from cn.gldzkjdx.bean.Book b where b.book_name = ?";
			List<Long> list = (List<Long>)this.getHibernateTemplate().find(hql,bookname);
			if(list != null && list.size() > 0)
				return list.get(0).intValue();
			return 0;
		}
		/**
		 * 查询图书状态的记录数
		 */
		public int getRecordCountBybookstatus(String bookstatus) {
			String hql = "select count(*) from cn.gldzkjdx.bean.Book b where b.book_status = ?";
			List<Long> list = (List<Long>)this.getHibernateTemplate().find(hql,bookstatus);
			if(list != null && list.size() > 0)
				return list.get(0).intValue();
			return 0;
		}
		/**
		 * 查询图书来源的记录数
		 */
		public int getRecordCountBybooksource(String booksource) {
			String hql = "select count(*) from cn.gldzkjdx.bean.Book b where b.book_source = ?";
			List<Long> list = (List<Long>)this.getHibernateTemplate().find(hql,booksource);
			if(list != null && list.size() > 0)
				return list.get(0).intValue();
			return 0;
		}
		/**
		 * 查询图书拥有者的记录数
		 */
		public int getRecordCountBybookowner(String bookowner) {
			String hql = "select count(*) from cn.gldzkjdx.bean.Book b where b.book_owner = ?";
			List<Long> list = (List<Long>)this.getHibernateTemplate().find(hql,bookowner);
			if(list != null && list.size() > 0)
				return list.get(0).intValue();
			return 0;
		}
		/**
		 * 查询图书编号的记录数
		 */
		public int getRecordCountBybooknum(String booknum) {
			String hql = "select count(*) from cn.gldzkjdx.bean.Book b where b.book_num = ?";
			List<Long> list = (List<Long>)this.getHibernateTemplate().find(hql,booknum);
			if(list != null && list.size() > 0)
				return list.get(0).intValue();
			return 0;
		}
		public Book FindIDByBooknum(String booknum) {
			return (Book) this.getHibernateTemplate().find("from cn.gldzkjdx.bean.Book b where b.book_num = ?",booknum).get(0);
		}
	
	
}
