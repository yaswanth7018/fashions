package com.fashion.service;
import java.util.*;

import com.fashion.model.Cart;
import com.fashion.model.Orders;
import com.fashion.model.Users;

public interface OrdersService {
	public  String addorder(Orders pro);
	public String updateorder(Orders pro);
	public Orders viewuserbyid(int proid);
	List<Orders>getCartItemsByEmail(String email);
	List<Orders> getAllOrders();
}
