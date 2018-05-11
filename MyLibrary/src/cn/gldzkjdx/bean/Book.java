package cn.gldzkjdx.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="book")
public class Book {
	/**
	 * author：Cassie
	 * time:2018-01-05
	 */

	private int book_id;//编号
	private String book_type;//书的类型
	private String book_num;//书的编号
	private String book_name;//书名
	private String book_source;//出版社
	private String book_status;//书的状态（借出，在库）
	private String book_owner;//书的用户

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getBook_type() {
		return book_type;
	}
	public void setBook_type(String book_type) {
		this.book_type = book_type;
	}
	public String getBook_num() {
		return book_num;
	}
	public void setBook_num(String book_num) {
		this.book_num = book_num;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_source() {
		return book_source;
	}
	public void setBook_source(String book_source) {
		this.book_source = book_source;
	}
	public String getBook_status() {
		return book_status;
	}
	public void setBook_status(String book_status) {
		this.book_status = book_status;
	}
	public String getBook_owner() {
		return book_owner;
	}
	public void setBook_owner(String book_owner) {
		this.book_owner = book_owner;
	}
	
}
