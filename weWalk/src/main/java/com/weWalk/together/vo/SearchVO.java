package com.weWalk.together.vo;

public class SearchVO {
	
	private String keyWord = ""; // 검색어

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	@Override
	public String toString() {
		return "SearchVO [keyWord=" + keyWord + "]";
	}


}
