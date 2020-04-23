package com.kh.market.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.admin.model.vo.AdminProductPageInfo;
import com.kh.market.admin.model.vo.SubCategory;
import com.kh.market.product.model.vo.Product;

@Repository("pDao")
public class ProductDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertProduct(Product p) {
		return sqlSession.insert("ProductMapper.insertproduct",p);
	}

	public int getListCount() {
		return sqlSession.selectOne("ProductMapper.getListCount");
	}

	public ArrayList<Product> getProductList(AdminProductPageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("ProductMapper.selectList", null, rowBounds);
	}

	public Product getProductOne(Product p) {
		return (Product) sqlSession.selectOne("ProductMapper.selectOne",p);
	}

	public int updateProduct(Product p) {
		return sqlSession.update("ProductMapper.updateOne",p);
	}
	
	public ArrayList<Product> getfourProductList(String maincate) {
		System.out.println(maincate);
		return (ArrayList)sqlSession.selectList("ProductMapper.selectfourlist",maincate);
	}

	public ArrayList<Product> choosecateList(String subcate) {
		return (ArrayList)sqlSession.selectList("ProductMapper.selectsublist",subcate);
	}

	public ArrayList<Product> pagingchoosecateList(String maincatenum, AdminProductPageInfo pi) {
		
		String subcate = maincatenum;
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("ProductMapper.selectsublist", subcate, rowBounds);
	}

	public int lowerproductlistcount(SubCategory subcatevo) {
		return sqlSession.selectOne("ProductMapper.selectlowercount",subcatevo);
	}

	public ArrayList<Product> selectlowerproduct(SubCategory subcatevo, AdminProductPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("ProductMapper.lowerproductlist", subcatevo, rowBounds);
	}

}
