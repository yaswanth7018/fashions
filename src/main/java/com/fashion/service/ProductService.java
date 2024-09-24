package com.fashion.service;
import java.util.*;
import com.fashion.model.Products;
import com.fashion.model.Users;

public interface ProductService {
	public  String addproduct(Products pro);
	public String updateproduct(Products pro);
	public Products viewuserbyid(int proid);
	List<Products> getAllProducts();
}
