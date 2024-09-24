package com.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.*;
import com.fashion.model.*;
public interface OrdersRepository extends JpaRepository<Orders	, Integer>{
	List<Orders> findAllByEmail(String email);

}
