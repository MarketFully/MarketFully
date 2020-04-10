package com.kh.market.admin.model.Service;

import java.util.ArrayList;
import java.util.List;

import com.kh.market.admin.model.vo.MainCategory;
import com.kh.market.admin.model.vo.SubCategory;

public interface CategoryService {

	public int updateCategory(MainCategory c);

	public int deleteCategory();

	public int updatesubCategory(SubCategory sc);

	public int deleteSubCategory();

	public List<Object> selectMainCategoryList();

	public ArrayList<SubCategory> selectSubCategoryList();
}
