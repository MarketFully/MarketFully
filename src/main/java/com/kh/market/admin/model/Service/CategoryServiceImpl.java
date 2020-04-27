package com.kh.market.admin.model.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.admin.model.dao.CategoryDao;
import com.kh.market.admin.model.vo.MainCategory;
import com.kh.market.admin.model.vo.SubCategory;
import com.kh.market.product.model.vo.Product;

@Service("cService")
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryDao cDao;

	@Override
	public int updateCategory(MainCategory c) {
		return cDao.updateCategory(c);
	}

	@Override
	public int deleteCategory() {
		return cDao.deleteCategory();
	}

	@Override
	public int updatesubCategory(SubCategory sc) {
		return cDao.updatesubCategory(sc);
	}

	@Override
	public int deleteSubCategory() {
		return cDao.deletesubCategory();
	}

	@Override
	public ArrayList<MainCategory> selectMainCategoryList() {
		return cDao.selectMainCategoryList();
	}

	@Override
	public ArrayList<SubCategory> selectSubCategoryList() {
		return cDao.selectSubCategoryList();
	}

	@Override
	public ArrayList<SubCategory> lowerSublist(String maincatenum) {
		return cDao.lowerSublist(maincatenum);
	}
	
	@Override
	public ArrayList<Product> lowerSublist_product(Product pp) {
		return cDao.lowerSublist_product(pp);
	}
	
}
