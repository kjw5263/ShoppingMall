package com.var.list;

public class varlist {
	private String databasename = "cosShopping";

	private String http[][] = new String[][]
    		{{"" ," 전체"},
    	{"?item=best","베스트상품"},
    	{"?item=outwear","스킨"},
    	{"?item=essence","에센스"},
    	{"?item=cream","크림"},
    	{"?item=maskpack","마스크팩"}
    		};//이부분만 수정
    private String cat[][] = new String[][]
	   		{{"" ," 전체"},
	   	{"?cat=etude","에뛰드"},
	   	{"?cat=physiogel","피지오겔"},
	   	{"?cat=bringgreen","브링그린"},
	   	{"?cat=anua","아누아"},
	   	{"?cat=ordinary","디오디너리"},
	   	{"?cat=abib","아바브"},
	   	{"?cat=senka","센카"},
	   	{"?cat=milktouch","밀크터치"},
	   	{"?cat=mynunc","미샤"},
	   	{"?cat=bioderma","바이오더마"},
	   	{"?cat=skinfood","스킨푸드"},
	   	{"?cat=koelcia","코엘시아"},
	   	{"?cat=blackmonster","블랙몬스터"},
	   	{"?cat=cnp","차앤박"}
	   	
	   		};//이부분만 수정		
	
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

	
	
	
}
