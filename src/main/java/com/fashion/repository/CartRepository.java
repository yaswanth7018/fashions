package com.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.*;
import com.fashion.model.Cart;
public interface CartRepository extends JpaRepository<Cart	, Integer>{
	List<Cart> findAllByEmail(String email);

}
