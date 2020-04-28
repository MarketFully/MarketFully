package com.kh.market.product.model.service;


import java.util.ArrayList;

import com.kh.market.admin.model.vo.AdminProductPageInfo;
import com.kh.market.admin.model.vo.SubCategory;
import com.kh.market.product.model.vo.Product;
import com.kh.market.product.model.vo.ProductReview;
import com.kh.market.product.model.vo.ProductReviewPageInfo;

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
	
	// 리뷰 개수
	public int getListProductReview(int pr_code);

	// 리뷰 리스트
	public ArrayList<ProductReview> ReviewselectList(ProductReviewPageInfo pi,int pr_code);

	// 리뷰 조회수
	public int ReviewCount(int re_num);

	// 리뷰 리스트 다시 가져옴
	public ProductReview Reviewselect(int re_num);
	
	public int removeProduct(int pr_code);
}
