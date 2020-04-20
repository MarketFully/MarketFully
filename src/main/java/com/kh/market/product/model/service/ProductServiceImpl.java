package com.kh.market.product.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.admin.model.vo.AdminProductPageInfo;
import com.kh.market.product.model.dao.ProductDao;
import com.kh.market.product.model.vo.Product;

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

}
