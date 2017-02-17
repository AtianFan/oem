package com.cishi.view;

import org.apache.ibatis.session.RowBounds;

public class PageView {
	private int pageNo=1;
	private int pageSize=20;
	private int total;
	public int getPageNo() {
		return pageNo;
	}
	public double getPageTotal(){
		System.out.println(this.total+"===");
		return Math.ceil((double)this.total/this.pageSize);
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getOffset() {
		return (pageNo-1)*pageSize;
	}
	
	public PageView(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public PageView(int pageNo, int pageSize) {
		this.pageNo = pageNo;
		this.pageSize = pageSize;
	}
	public RowBounds toRowBounds(){//20,20
		return new RowBounds((this.getPageNo()-1)*this.pageSize,this.getPageSize());
	}
	
	public PageView() {
		super();
	}
	public void setTotal(int total){
		this.total = total;
	}
	public static void main(String[] args) {
		System.out.println(Math.ceil((double)11/20));
	}	
}
