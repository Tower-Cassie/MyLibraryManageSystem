package cn.gldzkjdx.DAO;

import java.util.List;

import cn.gldzkjdx.bean.Book;

public interface BookDAO {
	//���ͼ��
		public void AddBook(Book book);
		//ɾ��ͼ��
		public void DeleteBook(int id);
		//�޸�ͼ����Ϣ
		public void UpdateBook(Book book);
		//�������е�ͼ��
		public List<Book> ListBooks();
		//������������ͼ��
		public List<Book> FindBookByName(String bookname);
		//���Ҷ�Ӧ�û�������ͼ��
		public List<Book> FindBookByUser(String bookowner);
		//������ID������
		public Book FindBookByID(int id);
		//������ı�Ų�ѯ��
		public Book FindIDByBooknum(String booknum);
		//��ȡ��¼��
		public int getRecordCount();
		//��ȡ������͵ļ�¼��
		public int getRecordCountBybooktype(String booktype);
		//��ȡ�����ļ�¼��
		public int getRecordCountBybookname(String bookname);
		//��ȡ���״̬�ļ�¼��
		public int getRecordCountBybookstatus(String bookstatus);
		//��ȡ��ĳ�����ļ�¼��
		public int getRecordCountBybooksource(String booksource);
		//��ȡ���ӵ���ߵļ�¼��
		public int getRecordCountBybookowner(String bookowner);
		//��ȡ��ı�ŵļ�¼��
		public int getRecordCountBybooknum(String booknum);
		//����������߲�����
		public List<Book> FindBookByUsername(String book_owner);
		
}
