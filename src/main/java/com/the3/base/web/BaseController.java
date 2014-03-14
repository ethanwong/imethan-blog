package com.the3.base.web;

import org.springframework.ui.Model;

/**
 * BaseController.java
 *
 * @author Ethan Wong
 * @time 2014年3月8日下午1:17:07
 */
public interface BaseController {
	
	/**
	 * 查询列表
	 * @return
	 */
	public String list(Model model);
	
	/**
	 * 查看详情
	 * @return
	 */
	public String detail(Model model);
	
	/**
	 * 添加操作
	 * @return
	 */
	public String add(Model model);
	
	/**
	 * 保存信息
	 * @return
	 */
	public String save(Model model);
	
	/**
	 * 修改信息
	 * @return
	 */
	public String modify(Model model);
	
	/**
	 * 删除信息
	 * @return
	 */
	public String delete(Model model);

}


