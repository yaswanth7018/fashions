package com.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fashion.model.Products;
public interface ProductsRepository extends JpaRepository<Products	, Integer>{

}
