package com.kh.market.admin.model.Service;

import java.util.ArrayList;
import java.util.List;

import com.kh.market.admin.model.vo.AdminProductPageInfo;
import com.kh.market.admin.model.vo.MainCategory;
import com.kh.market.admin.model.vo.SubCategory;
import com.kh.market.product.model.vo.Product;

public interface CategoryService {

	public int updateCategory(MainCategory c);

	public int deleteCategory();

	public int updatesubCategory(SubCategory sc);

	public int deleteSubCategory();

	public ArrayList<MainCategory> selectMainCategoryList();

	public ArrayList<SubCategory> selectSubCategoryList();

	public ArrayList<SubCategory> lowerSublist(String maincatenum);

	public ArrayList<Product> lowerSublist_product(Product pp);

}
