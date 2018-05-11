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

	//�Զ���ȡspring�����Ķ��󣬴˴���������һ���ú�spring�����ļ��е�������һ��
	
	private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Autowired
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
		/**
		 * ���ͼ��
		 * @param book
		 * 
		 */
		public  void AddBook(Book book) {
			System.out.println("�������ͼ�麯��");
			System.out.println("�������Ĳ����У�����Ϊ��"+book.getBook_name());
			if(this.getHibernateTemplate() != null)
				System.out.println("getHibernateTemplate��Ϊ��");
			else
				System.out.println("getHibernateTemplateΪ��");
			this.getHibernateTemplate().persist(book);
			
		}

		/**
		 * ɾ��ͼ��
		 * @param id
		 */
		public void DeleteBook(int id) {
			 Book book = new Book();
			 book.setBook_id(id);
			this.getHibernateTemplate().delete("cn.gldzkjdx.bean.Book",book);
		}
		/**
		 * ��ѯ��¼����
		 */
		public int getRecordCount(){
			String hql = "select count(*) from cn.gldzkjdx.bean.Book b";
			List<Long> list = (List<Long>)this.getHibernateTemplate().find(hql);
			if(list != null && list.size() > 0)
				return list.get(0).intValue();
			return 0;
		}
		/**
		 * �����������������Ϣ
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
		 * ��ѯ����ͼ��
		 * @return List<Book>
		 */
		public List<Book> ListBooks() {
			return this.getHibernateTemplate().find("from cn.gldzkjdx.bean.Book");
			
		}

		/**
		 * ��������������
		 * @param id
		 * @return List<Book>
		 */
		public List<Book> FindBookByName(String bookname) {
			return this.getHibernateTemplate().find("from cn.gldzkjdx.bean.Book b where b.book_name = ?",bookname);
		
		}
		
		/**
		 * ����������߲�����
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
			book.setBook_name("���˺�");
			book.setBook_num("874730480X");
			book.setBook_owner("cassie");
			book.setBook_source("�廪��ѧ");
			book.setBook_status("���");
			book.setBook_type("�������ȫ");
			bookDAO.AddBook(book);
			
			System.out.print("111111111111111&**********************************************8 ");
			//bookDAO.DeleteBook(2);
			//Book test = bookDAO.FindBookByID(3);
			//System.out.print("������"+test.getBook_name());
			
			
			//List<Book> lists = bookDAO.FindBookByUser("cassie");
			//List<Book>lists = bookDAO.ListBooks();
			List<Book>lists = bookDAO.FindBookByName("���˺�");
			for(Book b :lists)
				System.out.println("ID��:" + b.getBook_id() + "---->" + "������" + b.getBook_name());
			
			
			
		}
		/**
		 * ��ѯͼ�����͵ļ�¼��
		 */
		public int getRecordCountBybooktype(String booktype) {
			String hql = "select count(*) from cn.gldzkjdx.bean.Book b where b.book_type = ?";
			List<Long> list = (List<Long>)this.getHibernateTemplate().find(hql,booktype);
			if(list != null && list.size() > 0)
				return list.get(0).intValue();
			return 0;
		}
		/**
		 * ��ѯͼ�����ļ�¼��
		 */
		public int getRecordCountBybookname(String bookname) {
			String hql = "select count(*) from cn.gldzkjdx.bean.Book b where b.book_name = ?";
			List<Long> list = (List<Long>)this.getHibernateTemplate().find(hql,bookname);
			if(list != null && list.size() > 0)
				return list.get(0).intValue();
			return 0;
		}
		/**
		 * ��ѯͼ��״̬�ļ�¼��
		 */
		public int getRecordCountBybookstatus(String bookstatus) {
			String hql = "select count(*) from cn.gldzkjdx.bean.Book b where b.book_status = ?";
			List<Long> list = (List<Long>)this.getHibernateTemplate().find(hql,bookstatus);
			if(list != null && list.size() > 0)
				return list.get(0).intValue();
			return 0;
		}
		/**
		 * ��ѯͼ����Դ�ļ�¼��
		 */
		public int getRecordCountBybooksource(String booksource) {
			String hql = "select count(*) from cn.gldzkjdx.bean.Book b where b.book_source = ?";
			List<Long> list = (List<Long>)this.getHibernateTemplate().find(hql,booksource);
			if(list != null && list.size() > 0)
				return list.get(0).intValue();
			return 0;
		}
		/**
		 * ��ѯͼ��ӵ���ߵļ�¼��
		 */
		public int getRecordCountBybookowner(String bookowner) {
			String hql = "select count(*) from cn.gldzkjdx.bean.Book b where b.book_owner = ?";
			List<Long> list = (List<Long>)this.getHibernateTemplate().find(hql,bookowner);
			if(list != null && list.size() > 0)
				return list.get(0).intValue();
			return 0;
		}
		/**
		 * ��ѯͼ���ŵļ�¼��
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
