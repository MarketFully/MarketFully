package com.kh.market.product.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.admin.model.vo.AdminProductPageInfo;
import com.kh.market.admin.model.vo.SubCategory;
import com.kh.market.product.model.dao.ProductDao;
import com.kh.market.product.model.vo.Product;
import com.kh.market.product.model.vo.ProductReview;
import com.kh.market.product.model.vo.ProductReviewPageInfo;

@Service("pService")
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao pDao;
	
	@Override
	public int productinsert(Product p) {
		return pDao.insertProduct(p);
	}

	@Override
	public int getListCount() {
		return pDao.getListCount();
	}

	@Override
	public ArrayList<Product> getProductList(AdminProductPageInfo pi) {
		return pDao.getProductList(pi);
	}

	@Override
	public Product getProductOne(Product p) {
		return pDao.getProductOne(p);
	}

	@Override
	public int ProductUpdate(Product p) {
		return pDao.updateProduct(p);
	}

	@Override
	public ArrayList<Product> getfourProductList(String maincate) {
		
		ArrayList<Product> arr = pDao.getfourProductList(maincate);
		
		while(arr.size()<4) {
			arr.add(new Product());
		}
		
		return arr;
	}

	@Override
	public ArrayList<Product> choosecateList(String catenum) {
		return pDao.choosecateList(catenum);
	}

	@Override
	public ArrayList<Product> pagingchoosecateList(String maincatenum, AdminProductPageInfo pi) {
		return pDao.pagingchoosecateList(maincatenum,pi);
	}

	@Override
	public int lowerproductlistcount(SubCategory subcatevo) {
		return pDao.lowerproductlistcount(subcatevo);
	}

	@Override
	public ArrayList<Product> selectlowerproduct(SubCategory subcatevo, AdminProductPageInfo pi) {
		return pDao.selectlowerproduct(subcatevo,pi);
	}
	
	// 후기 리스트 개수
	@Override
	public int getListProductReview(int pr_code) {
		return pDao.getListProductReview(pr_code);
	}

	// 후기 리스트
	@Override
	public ArrayList<ProductReview> ReviewselectList(ProductReviewPageInfo pi,int pr_code) {	
		return pDao.ReviewselectList(pi,pr_code);
	}

	// 후기 조회수
	@Override
	public int ReviewCount(int re_num) {
		return pDao.ReviewCount(re_num);
	}

	// 후기 리스트 다시 가져오기
	@Override
	public ProductReview Reviewselect(int re_num) {
		return pDao.Reviewselect(re_num);
	}
}
