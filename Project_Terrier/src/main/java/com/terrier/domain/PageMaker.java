package com.terrier.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private int totalCount;//전체글수
	private int startPage;//시작하단 페이지[1]
	private int endPage;//하단 끝페에지...[end]
	private boolean prev;//뒤로가기
	private boolean next;//앞으로가기
	private int displayPageNum=10;//전체 하단 몇개씩 블럭걸건지..
	private Criteria cri;//페이징 클래스
	
	
	public void calcData()
	{
		endPage=(int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		startPage=(endPage-displayPageNum)+1;
		
		int tempEndPage=(int) (Math.ceil(totalCount/(double)cri.getPerPageNum()));
		if(endPage>tempEndPage)
		{
			endPage=tempEndPage;
		}
		prev=startPage==1?false:true;
		System.out.println(prev);
		next=endPage*cri.getPerPageNum()>=totalCount?false:true;
		System.out.println(next);
	}
	
	public String makeQuery(int page)//uri값 리턴 
	{
		UriComponents uriComponents=
				UriComponentsBuilder.newInstance()
				.queryParam("page",page)
				.queryParam("perPageNum",cri.getPerPageNum())
				.build();
		return uriComponents.toUriString();
	}
	
	public String makeSearch(int page)//검색 관련에서 파라미터값 추가예정
	{
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page",page)
				.queryParam("perPageNum",cri.getPerPageNum())
				.build();
		//page=10&perPageNum=10
		
		return uriComponents.toUriString();
	}
	
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDiplayPageNum() {
		return displayPageNum;
	}
	public void setDiplayPageNum(int diplayPageNum) {
		this.displayPageNum = diplayPageNum;
	}
	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
}
