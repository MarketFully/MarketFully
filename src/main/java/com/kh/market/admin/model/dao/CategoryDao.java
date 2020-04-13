package com.kh.market.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.admin.model.vo.MainCategory;
import com.kh.market.admin.model.vo.SubCategory;

@Repository("CateDao")
public class CategoryDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	public int updateCategory(MainCategory c) {
		return sqlSession.insert("categoryMapper.insertMaincate",c);
	}
	public int deleteCategory() {
		return sqlSession.delete("categoryMapper.deleteMaincate");
	}
	public int updatesubCategory(SubCategory sc) {
		return sqlSession.insert("subcateMapper.insertSubcate",sc);
	}
	public int deletesubCategory() {
		return sqlSession.delete("subcateMapper.deleteSubcate");
	}
	public ArrayList<MainCategory> selectMainCategoryList() {
		return (ArrayList)sqlSession.selectList("categoryMapper.selectMaincatelist");
	}
	public ArrayList<SubCategory> selectSubCategoryList() {
		return (ArrayList)sqlSession.selectList("subcateMapper.selectSubcatelist");
	}
}
