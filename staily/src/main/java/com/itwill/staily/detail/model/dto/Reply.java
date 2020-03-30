package com.itwill.staily.detail.model.dto;

public class Reply {
	private int rNo; //댓글 번호
	private int pNo; //상품 번호
	private int mNo; //회원 번호
	private String rContent; //댓글 내용
	private int rRecommend; //추천 수
	private int rReport; //신고 수
	
	public Reply() {
		super();
	}
	
	@Override
	public String toString() {
		return "[rNo = " + rNo + ", pNo = " + pNo + ", mNo = " + mNo + ", " +
				"rContent = " + rContent + ", rRecommend = " + rRecommend + ", rReport = " + rReport + "]";
	}

	public Reply(int rNo, int pNo, int mNo, String rContent, int rRecommend, int rReport) {
		super();
		this.rNo = rNo;
		this.pNo = pNo;
		this.mNo = mNo;
		this.rContent = rContent;
		this.rRecommend = rRecommend;
		this.rReport = rReport;
	}
	
	public Reply(int pNo, int mNo, String rContent, int rRecommend, int rReport) {
		super();
		this.pNo = pNo;
		this.mNo = mNo;
		this.rContent = rContent;
		this.rRecommend = rRecommend;
		this.rReport = rReport;
	}

	public Reply(int rNo, int pNo, int mNo) {
		super();
		this.mNo = mNo;
		this.pNo = pNo;
		this.rNo = rNo;
	}
	
	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public int getrRecommend() {
		return rRecommend;
	}

	public void setrRecommend(int rRecommend) {
		this.rRecommend = rRecommend;
	}

	public int getrReport() {
		return rReport;
	}

	public void setrReport(int rReport) {
		this.rReport = rReport;
	} 
}