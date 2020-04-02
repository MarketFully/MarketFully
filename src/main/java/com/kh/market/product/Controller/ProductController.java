package com.kh.market.product.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

		@RequestMapping("ProductMain")
		public String ProductMainView() { //단일상품 판매 페이지로 이동하는 메소드

			return "product/product";
		}

		@RequestMapping("Productdetail")
		public String ProductdetailView() { //단일상품 상세로 이동하는 메소드

			return "product/productdetail";
		}
		@RequestMapping("Productfish")
		public String ProductfishView() { //fish 판매 페이지로 이동하는 메소드

			return "product/fish";
		}
		@RequestMapping("Productfruit")
		public String ProductfruitView() { //fruit 단일상품 판매 페이지로 이동하는 메소드

			return "product/fruit";
		}
		@RequestMapping("Productmeet")
		public String ProductmeetView() { // meet 단일상품 판매 페이지로 이동하는 메소드

			return "product/meet";
		}
		@RequestMapping("Productmilk")
		public String ProductmilkView() { // milk 단일상품 판매 페이지로 이동하는 메소드

			return "product/milk";
		}
		@RequestMapping("Productsource")
		public String ProductsourceView() { // source 단일상품 판매 페이지로 이동하는 메소드

			return "product/source";
		}
		
		@RequestMapping("Productvegetable")
		public String ProductvegetableView() { //vegetable 단일상품 판매 페이지로 이동하는 메소드

			return "product/vegetable";
		}
		
	

}
