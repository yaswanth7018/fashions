package com.fashion.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fashion.model.Cart;
import com.fashion.model.Orders;
import com.fashion.repository.OrdersRepository;

@Service
public class OrdersServiceImp implements OrdersService{
	@Autowired
	private OrdersRepository userRepository;
	

	@Override
	public String addorder(Orders pro) {
		// TODO Auto-generated method stub
		userRepository.save(pro);
		return "orderSuccess";
	}


	@Override
	public String updateorder(Orders updatedUser) {
	    // Check if the user with the given ID exists
	    Optional<Orders> existingUserOptional = userRepository.findById(updatedUser.getId());
	    
	    if (existingUserOptional.isPresent()) {
	        // Get the existing user
	        Orders existingUser = existingUserOptional.get();
	        
	        // Update the user's information with the new data
	       

	        // Save the updated user
	        userRepository.save(existingUser);
	        
	        return "User updated successfully";
	    } else {
	        // User with the given ID not found
	        return "User not found, update failed";
	    }
	}


	@Override
	public Orders viewuserbyid(int eid) 
	{
		Optional<Orders> obj = userRepository.findById(eid);
	    if(obj.isPresent())
	    {
	      Orders emp = obj.get();
	      return emp;
	    }
	    else
	    {
	      return null;
	    }
	}


	@Override
	public List<Orders> getAllOrders() {
		// TODO Auto-generated method stub
		return userRepository.findAll(); 
	}
	 public List<Orders> getCartItemsByEmail(String email) {
	        return userRepository.findAllByEmail(email);
	    }
	    

	


	

}
