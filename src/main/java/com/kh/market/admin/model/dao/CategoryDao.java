package com.kh.market.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.admin.model.vo.MainCategory;
import com.kh.market.admin.model.vo.SubCategory;
import com.kh.market.product.model.vo.Product;

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
	public ArrayList<SubCategory> lowerSublist(String maincatenum) {
		return (ArrayList)sqlSession.selectList("subcateMapper.lowerSubcatelist",maincatenum);
	}
	public ArrayList<Product> lowerSublist_product(Product pp) {
		return (ArrayList)sqlSession.selectList("subcateMapper.lowerSublist_product",pp);
	}
	public int imgupdate(MainCategory renameFileName) {
		return sqlSession.update("categoryMapper.updateimg",renameFileName);
	}
}
