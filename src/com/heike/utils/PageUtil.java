package com.heike.utils;

import java.util.List;

public class PageUtil<T> {
	
	private List<T> datas;	//分页查询出来的数据集合
	private int totalPage;	//总页数
	/**
	 * 获得总页数
	 * @param pageSize	页面大小
	 * @param rowCounts 总记录数
	 * @return
	 */
	public void getTotalPage(int rowCounts, int pageSize){
		
		this.totalPage = rowCounts % pageSize == 0 ? rowCounts / pageSize : rowCounts / pageSize + 1;
		
//		System.out.println("总页数 = " + this.totalPage);
	}
	
	public List<T> getDatas() {
		return datas;
	}
	public void setDatas(List<T> datas) {
		this.datas = datas;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
}
