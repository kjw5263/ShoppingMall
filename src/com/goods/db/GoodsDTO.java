package com.goods.db;

import java.sql.Date;

//관리자가 등록하는 화장품 목록 
public class GoodsDTO {

	 // 화장품 번호 화장품 별 고유 번호
	 private int cosNum;
	
	 // 화장품 이름 화장품 이름
	 private String cosName;
	
	 // 화장품 가격 화장품 가격
	 private int cosPrice;
	
	 // 화장품 브랜드 화장품 브랜드
	 private String cosBrand;
	
	 // 화장품 카테고리 스킨/로션/에센스/크림/팩
	 private String cosCategory;
	
	 // 화장품 피부타입 건성/중성/지성/복합성
	 private String cosSkinType;
	
	 // 화장품 피부고민 민감성/아토피/여드름/해당없음
	 private String cosTrouble;
	
	 // 화장품 재고 화장품 재고
	 private int cosAmount;
	
	 // 화장품 용량 화장품 용량(단위 ml)
	 private int cosVolumn;
	
	 // 화장품 성분 화장품 성분
	 private String ingredient;
	
	 // 제조사 화장품 제조사
	 private String madeCompany;
	
	 // 사용방법 사용방법
	 private String cosMethod;
	
	 // 사용시 주의사항 화장품 사용시 주의사항
	 private String cosWarning;
	
	 // 화장품 이미지 화장품 이미지 주소 (link 형식)
	 private String cosImage;
	
	 // 주문 횟수 화장품 주문 횟수(나중에 인기제품으로 보여주기 위함)
	 private int orderCount;
	
	 // 화장품 사용기한 사용기한 (단위:개월)
	 private int useDate;
	
	 // 화장품 등록날짜 화장품 등록 하는 날짜
	 private Date cosWriteDate;

	public int getCosNum() {
		return cosNum;
	}

	public void setCosNum(int cosNum) {
		this.cosNum = cosNum;
	}

	public String getCosName() {
		return cosName;
	}

	public void setCosName(String cosName) {
		this.cosName = cosName;
	}

	public int getCosPrice() {
		return cosPrice;
	}

	public void setCosPrice(int cosPrice) {
		this.cosPrice = cosPrice;
	}

	public String getCosBrand() {
		return cosBrand;
	}

	public void setCosBrand(String cosBrand) {
		this.cosBrand = cosBrand;
	}

	public String getCosCategory() {
		return cosCategory;
	}

	public void setCosCategory(String cosCategory) {
		this.cosCategory = cosCategory;
	}

	public String getCosSkinType() {
		return cosSkinType;
	}

	public void setCosSkinType(String cosSkinType) {
		this.cosSkinType = cosSkinType;
	}

	public String getCosTrouble() {
		return cosTrouble;
	}

	public void setCosTrouble(String cosTrouble) {
		this.cosTrouble = cosTrouble;
	}

	public int getCosAmount() {
		return cosAmount;
	}

	public void setCosAmount(int cosAmount) {
		this.cosAmount = cosAmount;
	}

	public int getCosVolumn() {
		return cosVolumn;
	}

	public void setCosVolumn(int cosVolumn) {
		this.cosVolumn = cosVolumn;
	}

	public String getIngredient() {
		return ingredient;
	}

	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}

	public String getMadeCompany() {
		return madeCompany;
	}

	public void setMadeCompany(String madeCompany) {
		this.madeCompany = madeCompany;
	}

	public String getCosMethod() {
		return cosMethod;
	}

	public void setCosMethod(String cosMethod) {
		this.cosMethod = cosMethod;
	}

	public String getCosWarning() {
		return cosWarning;
	}

	public void setCosWarning(String cosWarning) {
		this.cosWarning = cosWarning;
	}

	public String getCosImage() {
		return cosImage;
	}

	public void setCosImage(String cosImage) {
		this.cosImage = cosImage;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public int getUseDate() {
		return useDate;
	}

	public void setUseDate(int useDate) {
		this.useDate = useDate;
	}

	public Date getCosWriteDate() {
		return cosWriteDate;
	}

	public void setCosWriteDate(Date cosWriteDate) {
		this.cosWriteDate = cosWriteDate;
	}

	@Override
	public String toString() {
		return "GoodsDTO [cosNum=" + cosNum + ", cosName=" + cosName + ", cosPrice=" + cosPrice + ", cosBrand="
				+ cosBrand + ", cosCategory=" + cosCategory + ", cosSkinType=" + cosSkinType + ", cosTrouble="
				+ cosTrouble + ", cosAmount=" + cosAmount + ", cosVolumn=" + cosVolumn + ", ingredient=" + ingredient
				+ ", madeCompany=" + madeCompany + ", cosMethod=" + cosMethod + ", cosWarning=" + cosWarning
				+ ", cosImage=" + cosImage + ", orderCount=" + orderCount + ", useDate=" + useDate + ", cosWriteDate="
				+ cosWriteDate + "]";
	}
	 

}
