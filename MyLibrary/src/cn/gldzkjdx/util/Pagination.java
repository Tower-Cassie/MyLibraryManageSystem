package cn.gldzkjdx.util;

public class Pagination {
	
	public static String getPagination(int pageNum,int pageCount,int recordCount,String pageUrl,int pageSize){
		System.out.println("����·����" + pageUrl);
		String url = pageUrl.contains("?")?pageUrl:pageUrl + "?" + "pageNum=";//���û�У������
		//String url = pageUrl.contains("?")?pageUrl:pageUrl + "?" + "pageNum=";
		/*if(!url.endsWith("?") && !url.endsWith("&"))//���û��&�����
			url += "&";*/
		StringBuffer buffer = new StringBuffer();//StringBuffer����
		
		buffer.append("��" + pageNum + "/" + pageCount + "ҳ ��" + recordCount + "��¼" + " ÿҳ " + pageSize + " ��¼  ");
		buffer.append(pageNum == 1?"��һҳ":"<a href = '"+url+"1'>��һҳ</a>");
		buffer.append(pageNum == 1?"��һҳ":"<a href = '" + url + ""+(pageNum - 1)+"'>��һҳ</a>");
		buffer.append(pageNum == pageCount?"��һҳ":"<a href = '" + url + ""+(pageNum + 1)+"'>��һҳ</a>");
		buffer.append(pageNum == pageCount?"���һҳ":"<a href = '" + url + ""+pageCount+"'>���һҳ</a>");
		return buffer.toString();
	}

	/*
	 buffer.append(pageNum == 1?"��һҳ":"<a href = '"+url+"pageNum= 1'>��һҳ</a>");
		buffer.append(pageNum == 1?"��һҳ":"<a href = '" + url + "pageNum = "+(pageNum - 1)+"'>��һҳ</a>");
		buffer.append(pageNum == pageCount?"��һҳ":"<a href = '" + url + "pageNum = "+(pageNum + 1)+"'>��һҳ</a>");
		buffer.append(pageNum == pageCount?"���һҳ":"<a href = '" + url + "pageNum =" + pageCount + "'>���һҳ</a>");
	 */
}
