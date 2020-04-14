package com.kh.market.product.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
