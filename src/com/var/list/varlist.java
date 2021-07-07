package com.var.list;

public class varlist {
	private String databasename = "cosShopping";

	
	private String GoodslistTablename =  "cos_list";
	private String noticelistTablename =  "notice_board";
	private String noticecontentListSt = "noticeContent.nos?noticeNum=";
	private String MemberInfoTablename = "user_info";
	private String http[][] = new String[][]
    		{{"" ," 전체"},
    	{"?item=best","베스트상품"},
    	{"?item=skin","스킨"},
    	{"?item=essence","에센스"},
    	{"?item=cream","크림"},
    	{"?item=maskpack","마스크팩"},
    	{"?item=lostion","로션"}
    		};//이부분만 수정
    private String cat[][] = new String[][]
	   		{{"" ," 전체"},
	   	{"?cat=etude","에뛰드"},
	   	{"?cat=physiogel","피지오겔"},
	   	{"?cat=bringgreen","브링그린"},
	   	{"?cat=anua","아누아"},
	   	{"?cat=ordinary","디오디너리"},
	   	{"?cat=abib","아비브"},
	   	{"?cat=senka","센카"},
	   	{"?cat=milktouch","밀크터치"},
	   	{"?cat=mynunc","미샤"},
	   	{"?cat=bioderma","바이오더마"},
	   	{"?cat=skinfood","스킨푸드"},
	   	{"?cat=koelcia","코엘시아"},
	   	{"?cat=blackmonster","블랙몬스터"},
	   	{"?cat=aestura","에스트라"},
	   	{"?cat=numbuzin","넘버즈인"},
	   	{"?cat=larocheposay","라로슈포제"},
	   	{"?cat=cnp","차앤박"}
	   	
	   		};//이부분만 수정
	   		
	private String skin[][] = new String[][]
    		{{"" ," 전체"},
    	{"?skin=wet","지성"},
    	{"?skin=mid","중성"},
    	{"?skin=mix","복합성"},
    	{"?skin=trd","건성"}
    	};
    	
	
	public String getDatabasename() {
		return databasename;
	}

	public void setDatabasename(String databasename) {
		this.databasename = databasename;
	}

	public String[][] getHttp() {
		return http;
	}
	
	public String[][] getCat() {
		return cat;
	}
	public String getGoodslistTablename(){
		return GoodslistTablename;
	}
	public String getnoticelistTablename(){
		return noticelistTablename;
	}
	public String getnoticecontentListSt(){
		return noticecontentListSt;
	}

	public String getMemberInfoTablename() {
		return MemberInfoTablename;
	}

	public void setMemberInfoTablename(String memberInfoTablename) {
		MemberInfoTablename = memberInfoTablename;
	}

	public String[][] getSkin() {
		return skin;
	}

	public void setSkin(String[][] skin) {
		this.skin = skin;
	}
	
	
}
