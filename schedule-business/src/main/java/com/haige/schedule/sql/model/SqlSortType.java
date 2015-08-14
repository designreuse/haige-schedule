package com.haige.schedule.sql.model;

import com.haige.schedule.utils.StringUtil;


/**
 * 排序动作
 * 
 * @author xwang
 * 
 */
public enum SqlSortType {
	ASC("asc","a"),DESC("desc", "d");

	/**
	 * 查询动作
	 */
	private String action;

	/**
	 * 页面表示
	 */
	private String flage;

	private SqlSortType(String _action, String _flage) {
		this.action = _action;
		this.flage = _flage;
	}

	public String getFlage() {
		return this.flage;
	}

	public String getAction() {
		return this.action;
	}

	public static SqlSortType getDefault()
	{
		return ASC;
	}
	
	public static SqlSortType getSqlActionType(String _flage) {
		for (SqlSortType type : SqlSortType.values()) {
			if ( StringUtil.isEqual(type.getFlage(), _flage) ) {
				return type;
			}
		}
		return null;
	}
	
	
}
