package cn.gldzkjdx.util;

public class Pagination {
	
	public static String getPagination(int pageNum,int pageCount,int recordCount,String pageUrl,int pageSize){
		System.out.println("所求路径：" + pageUrl);
		String url = pageUrl.contains("?")?pageUrl:pageUrl + "?" + "pageNum=";//如果没有？则添加
		//String url = pageUrl.contains("?")?pageUrl:pageUrl + "?" + "pageNum=";
		/*if(!url.endsWith("?") && !url.endsWith("&"))//如果没有&则添加
			url += "&";*/
		StringBuffer buffer = new StringBuffer();//StringBuffer对象
		
		buffer.append("第" + pageNum + "/" + pageCount + "页 共" + recordCount + "记录" + " 每页 " + pageSize + " 记录  ");
		buffer.append(pageNum == 1?"第一页":"<a href = '"+url+"1'>第一页</a>");
		buffer.append(pageNum == 1?"上一页":"<a href = '" + url + ""+(pageNum - 1)+"'>上一页</a>");
		buffer.append(pageNum == pageCount?"下一页":"<a href = '" + url + ""+(pageNum + 1)+"'>下一页</a>");
		buffer.append(pageNum == pageCount?"最后一页":"<a href = '" + url + ""+pageCount+"'>最后一页</a>");
		return buffer.toString();
	}

	/*
	 buffer.append(pageNum == 1?"第一页":"<a href = '"+url+"pageNum= 1'>第一页</a>");
		buffer.append(pageNum == 1?"上一页":"<a href = '" + url + "pageNum = "+(pageNum - 1)+"'>上一页</a>");
		buffer.append(pageNum == pageCount?"下一页":"<a href = '" + url + "pageNum = "+(pageNum + 1)+"'>下一页</a>");
		buffer.append(pageNum == pageCount?"最后一页":"<a href = '" + url + "pageNum =" + pageCount + "'>最后一页</a>");
	 */
}
