package com.kh.market.product.model.service;


import java.util.ArrayList;

import com.kh.market.admin.model.vo.AdminProductPageInfo;
import com.kh.market.admin.model.vo.SubCategory;
import com.kh.market.product.model.vo.Product;

public interface ProductService {

	public int productinsert(Product p);

	public int getListCount();

	public ArrayList<Product> getProductList(AdminProductPageInfo pi);

	public Product getProductOne(Product p);

	public int ProductUpdate(Product p);
	
	public ArrayList<Product> getfourProductList(String maincate);

	public ArrayList<Product> choosecateList(String subcate);

	public ArrayList<Product> pagingchoosecateList(String maincatenum, AdminProductPageInfo pi);

	public int lowerproductlistcount(SubCategory subcatevo);

	public ArrayList<Product> selectlowerproduct(SubCategory subcatevo, AdminProductPageInfo pi);
	
	
}
