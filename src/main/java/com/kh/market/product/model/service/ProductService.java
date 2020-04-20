package com.kh.market.product.model.service;


import java.util.ArrayList;

import com.kh.market.admin.model.vo.AdminProductPageInfo;
import com.kh.market.product.model.vo.Product;

public interface ProductService {

	public int productinsert(Product p);

	public int getListCount();

	public ArrayList<Product> getProductList(AdminProductPageInfo pi);

	public Product getProductOne(Product p);

	public int ProductUpdate(Product p);
	
	
	
}
