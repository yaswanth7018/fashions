package com.fashion.service;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fashion.model.Users;
import com.fashion.repository.UserRepository;
@Service
public class UserServiceImp implements UsersService
{
	@Autowired
	private UserRepository userRepository;
	

	public String adduser(Users ur) {
	
		userRepository.save(ur);
		return "Registration Successfully";
		
	}

	@Override
	public String updateuser(Users updatedUser) {
	    // Check if the user with the given ID exists
	    Optional<Users> existingUserOptional = userRepository.findById(updatedUser.getId());
	    
	    if (existingUserOptional.isPresent()) {
	        // Get the existing user
	        Users existingUser = existingUserOptional.get();
	        
	        // Update the user's information with the new data
	        existingUser.setName(updatedUser.getName());
	        existingUser.setNumber(updatedUser.getNumber());
	        existingUser.setAddress_Line_1(updatedUser.getAddress_Line_1());
	        existingUser.setAddress_Line_2(updatedUser.getAddress_Line_2());
	        existingUser.setPostcode(updatedUser.getPostcode());
	        existingUser.setEmail(updatedUser.getEmail());
	        existingUser.setState(updatedUser.getState());

	        // Save the updated user
	        userRepository.save(existingUser);
	        
	        return "User updated successfully";
	    } else {
	        // User with the given ID not found
	        return "User not found, update failed";
	    }
	}


	@Override
	public Users viewuserbyid(int eid) 
	{
		Optional<Users> obj = userRepository.findById(eid);    
	    
	    if(obj.isPresent())
	    {
	      Users emp = obj.get();
	      return emp;
	    }
	    else
	    {
	      return null;
	    }
	}

	@Override
	public Users checkemplogin(String email, String pwd) {
		return userRepository.checkemplogin(email, pwd);
		
	}


}
