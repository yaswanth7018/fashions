package com.fashion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fashion.model.*;
import com.fashion.service.OrdersService;
import com.fashion.service.ProductService;
import com.fashion.service.UsersCartService;
import com.fashion.service.UsersService;
import com.mysql.cj.Session;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import com.fashion.controller.*;
import java.util.*;


@Controller
public class RestController {
	
	
	
	@Autowired
	private UsersService userService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UsersCartService cartService;
	
	@Autowired
	private OrdersService orderService;
	
	@GetMapping("/pay")
	public ModelAndView paytm() {
		return new ModelAndView("Paytmex");
	}
	
	@GetMapping("/")
	public ModelAndView home(HttpServletRequest request,Model model) {
		 List<Products> products = productService.getAllProducts();
	     model.addAttribute("products", products);
	       

	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    String ename = (String) session.getAttribute("ename");
	    String email =(String)session.getAttribute("email");
	    
	    List<Cart> car = cartService.getCartItemsByEmail(email);
	    model.addAttribute("cartcount",car.size());
        model.addAttribute("cartItems", car);
	    mv.addObject("ename", ename);
	    if (ename != null) {
	        mv.setViewName("home");
	        mv.addObject("ename", ename);
	        mv.addObject("email",email);// Add the user's name to the model
	    } else {
	        mv.setViewName("home");
	    }

	    return mv;
	}

	@GetMapping("/login")
	public ModelAndView login() {
		return new ModelAndView("login");
	}
	@GetMapping("/register")
	public ModelAndView register()
	{
		return new ModelAndView("register");
	}
	@PostMapping("/checkout")
	public ModelAndView order(HttpServletRequest request,Model model)
	{
		String mgs = null;
	     ModelAndView mv = new ModelAndView();
	     HttpSession session = request.getSession();
		 String email =(String)session.getAttribute("email");
		    
		 List<Cart> orders = cartService.getCartItemsByEmail(email);
	     String pname = request.getParameter("name");
	     String doorno = request.getParameter("doorno");
	     String street = request.getParameter("street");
	     String city = request.getParameter("city");
	     String state = request.getParameter("state");
	     String zip_code = request.getParameter("zip_code");
	     String phone = request.getParameter("phone");
	     try {
	    	 for(int i=0;i<orders.size();i++)
	    	 {
	    		 Orders ord = new Orders();
	    		 ord.setCategory(orders.get(i).getCategory());
	    		 ord.setEmail(orders.get(i).getEmail());
	    		 ord.setGender(orders.get(i).getGender());
	    		 ord.setImage(orders.get(i).getImage());
	    		 ord.setPdis(orders.get(i).getDis());
	    		 ord.setPrice(orders.get(i).getPrice());
	    		 ord.setDelivery_date("7");
	    		 ord.setDono(doorno);
	    		 ord.setPhononumber(phone);
	    		 ord.setPincode(zip_code);
	    		 ord.setPname(orders.get(i).getName());
	    		 ord.setProid(orders.get(i).getCartid());
	    		 ord.setState(state);
	    		 ord.setStreet(street);
	    		 ord.setPaiername(pname);
	    		 ord.setCity(city);
	    		 ord.setDelivery_status("shipped");
	    		 mgs=orderService.addorder(ord);
	    		 if(mgs=="orderSuccess")
	    		 {
	    			cartService.deleteCartItem(orders.get(i).getId());
	    		 }
	    	 }
	         mv.setViewName("orderSuccess");
	         mv.addObject("message", mgs);
	     } catch (Exception e) {
	         mgs = e.getMessage();
	         mv.setViewName("orderSuccess");
	         mv.addObject("message", mgs);
	     }

	     return mv;
	}
	
	@GetMapping("/myorders")
	public ModelAndView myorders(HttpServletRequest request,Model model)
	{
	
	       

	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    String ename = (String) session.getAttribute("ename");
	    String email =(String)session.getAttribute("email");
		List<Orders> car = orderService.getCartItemsByEmail(email);
		model.addAttribute("orders",car);
        model.addAttribute("cartItems", car);
	    mv.addObject("ename", ename);
	    if (ename != null) {
	        mv.setViewName("myorders");
	        mv.addObject("ename", ename);
	        mv.addObject("email",email);// Add the user's name to the model
	    } else {
	        mv.setViewName("myorders");
	    }

	    return mv;
	}
	
	@PostMapping("orderaddress")
	public ModelAndView orderprogress(HttpServletRequest request,Model model)
	{
		
		ModelAndView mv=new ModelAndView();
		 List<Cart> cartitm = (List<Cart>) request.getAttribute("cartitems");
	        model.addAttribute("cartitm", cartitm);
		
	        HttpSession session = request.getSession();
		String email = request.getParameter("email");
		 String id =(String)session.getAttribute("id");
		 mv.setViewName("orderaddress");
	 
	    return mv;
	    
	}
	@PostMapping("checkuserlogin")
	public ModelAndView checkemplogin(HttpServletRequest request,Model model)
	{
		
		ModelAndView mv=new ModelAndView();
		 List<Products> products = productService.getAllProducts();
	        model.addAttribute("products", products);
		
		String email = request.getParameter("email");
	    String pwd = request.getParameter("pwd");
	     
	    Users emp =  userService.checkemplogin(email, pwd);
	    
	    
	    if(emp!=null)
	    {
	    	if(emp.getAdmin().equals("admin")) {
		    	mv.addObject("name",emp.getName());
		    	mv.setViewName("adminhome");
		    }else {
	      HttpSession session = request.getSession();
	      
	      session.setAttribute("email", emp.getEmail());
	      session.setAttribute("eid", emp.getId()); //eid is a session variable
	      session.setAttribute("ename", emp.getName()); //ename is a session variable
	   // Set the "ename" attribute with the user's name
	      List<Cart> car = cartService.getCartItemsByEmail(email);
		    model.addAttribute("cartcount",car.size());
	        model.addAttribute("cartItems", car);
	      mv.addObject("ename", emp.getName());
	      mv.addObject("email",emp.getEmail());
	      mv.setViewName("home");
		    }
	    }
	    else
	    {
	      mv.setViewName("login");
	      mv.addObject("faild", "Email or Password are Incorrect");
	    }
	    
	 
	    return mv;
	    
	}
	@PostMapping("insertemp")
	public ModelAndView insertaction(HttpServletRequest request)
	{
		
		String mgs=null;
		ModelAndView mv=new ModelAndView();
		try 
		{
			String name = request.getParameter("name");
		    String email = request.getParameter("email");
		    long mobilenumber =  Long.parseLong(request.getParameter("mobilenumber"));
		    String pwd = request.getParameter("pwd");
		    
		    Users usr = new Users();
		      usr.setName(name);
		      usr.setEmail(email);
		      usr.setNumber(mobilenumber);
		      usr.setPassword(pwd);
		      usr.setCountry("India");
		      usr.setActive(true);
		      usr.setAdmin("user");
		      
		    mgs=userService.adduser(usr);
		  	mv.setViewName("login");
			mv.addObject("message",mgs);
			
			
		      
		} 
		catch (Exception e) 
		{
			mgs=e.getMessage();
			mv.setViewName("register");
			mv.addObject("message","Email is Already Exist");
			
		}
	
		
		return mv;
		
	}
	 @GetMapping("account")
	  public ModelAndView updateemp(HttpServletRequest request)
	  {
	    ModelAndView mv = new ModelAndView();
	    
	    HttpSession session = request.getSession();
	    
	    mv.setViewName("account");
	    
	    mv.addObject("eid", session.getAttribute("eid"));
	    mv.addObject("ename", session.getAttribute("ename"));
	    
	    int id = (int) session.getAttribute("eid");
	    
	    Users user = userService.viewuserbyid(id);
	    
	    mv.addObject("user", user);
	    
	    return mv;
	  }
	 
	 @PostMapping("savedetails")
	 public ModelAndView updateaction(HttpServletRequest request) {
	     String msg = null;
	     ModelAndView mv = new ModelAndView();

	     HttpSession session = request.getSession();

	     int id = (int) session.getAttribute("eid");

	     try {
	         String name = request.getParameter("name");
	         String number = request.getParameter("number");
	         String addr1 = request.getParameter("addr1");
	         String addr2 = request.getParameter("addr2");
	         String pincode = request.getParameter("pincode");
	         String state = request.getParameter("state");

	         // Fetch the existing user by ID
	         Users existingUser = userService.viewuserbyid(id);

	         if (existingUser != null) {
	             // Update the user's information
	             existingUser.setName(name);
	             existingUser.setNumber(Long.parseLong(number));
	             existingUser.setAddress_Line_1(addr1);
	             existingUser.setAddress_Line_2(addr2);
	             existingUser.setPostcode(pincode);
	             existingUser.setState(state);

	             // Ensure the email is not null by fetching it from the existing user
	             existingUser.setEmail(existingUser.getEmail());
	             existingUser.setAdmin(existingUser.getAdmin());

	             msg = userService.updateuser(existingUser);

	     	    String ename = (String) session.getAttribute("ename");
	     	    mv.addObject("ename",existingUser.getName());
	             mv.setViewName("home");
	             mv.addObject("message", "Saved successfully");
	         } else {
	             mv.setViewName("updateerror");
	             mv.addObject("message", "User not found");
	         }
	     } catch (Exception e) {
	         msg = e.getMessage();
	         mv.setViewName("updateerror");
	         mv.addObject("message", msg);
	     }

	     return mv;
	 }
	 @GetMapping("/logout")
	 public ModelAndView logout(HttpServletRequest request) {
	     HttpSession session = request.getSession();
	     session.invalidate();
	     return new ModelAndView("home");
	 }
	 @PostMapping("/insertadmin")
	 public ModelAndView admin(HttpServletRequest request) {
			String mgs=null;
			ModelAndView mv=new ModelAndView();
			try 
			{
				String admin = request.getParameter("admincode");
				System.out.println(admin);
				if(admin.equals("31674")) {
				System.out.println(admin);
				String name = request.getParameter("name");
			    String email = request.getParameter("email");
			    System.out.println(email);
			    long mobilenumber =  Long.parseLong(request.getParameter("mobilenumber"));
			    String pwd = request.getParameter("pwd");
			    
			    Users usr = new Users();
			      usr.setName(name);
			      usr.setEmail(email);
			      usr.setNumber(mobilenumber);
			      usr.setPassword(pwd);
			      usr.setCountry("India");
			      usr.setActive(true);
			      usr.setAdmin("admin");
			      
			    mgs=userService.adduser(usr);
			  	mv.setViewName("login");
				mv.addObject("message",mgs);}
				else {
					mv.setViewName("admin");
					mv.addObject("message","Admin Code is Incorrect");
				}
				
				
			      
			}
			catch(Exception e)
			{
				mgs=e.getMessage();
				mv.setViewName("admin");
				mv.addObject("message",mgs);
			}
		 
		 return mv;
		 
	 }
	 @GetMapping("/adminreg")
		public ModelAndView adminregister()
		{
			return new ModelAndView("admin");
		}
	 @GetMapping("/adminaddproducts")
	 public ModelAndView adminAddProdducts()
	 {
		 return new ModelAndView("adminaddproducts");
	 }
	 @PostMapping("/saveproduct")
	 public ModelAndView adminaddproducts(@RequestParam("image") MultipartFile imageFile, HttpServletRequest request) {
	     String mgs = null;
	     ModelAndView mv = new ModelAndView();

	     try {
	         String name = request.getParameter("name");
	         String dic = request.getParameter("dis");
	         String quantity = request.getParameter("quantity");
	         String price = request.getParameter("price");
	         String gender = request.getParameter("gender");
	         String category = request.getParameter("cat");

	         // Create a Products object and set its properties
	         Products product = new Products();
	         product.setName(name);
	         product.setDis(dic);
	         product.setQuantity(quantity);
	         product.setPrice(price);
	         product.setGender(gender);
	         product.setCategory(category);

	         // Check if an image was provided
	         if (!imageFile.isEmpty()) {
	             // Set the product image from the uploaded file
	             product.setImage(imageFile.getBytes());
	         }

	         mgs = productService.addproduct(product);
	         mv.setViewName("adminaddproducts");
	         mv.addObject("message", mgs);
	     } catch (Exception e) {
	         mgs = e.getMessage();
	         mv.setViewName("adminaddproducts");
	         mv.addObject("message", mgs);
	     }

	     return mv;
	 }
	 @GetMapping("/productList")
	    public String productList(Model model) {
	        List<Products> products = productService.getAllProducts();
	        model.addAttribute("products", products);

	        return "products";
	    }
	 @GetMapping("/men")
	 public ModelAndView productMen(Model model,HttpServletRequest request) {
		 List<Products> products = productService.getAllProducts();
	        model.addAttribute("products", products);

	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    String ename = (String) session.getAttribute("ename");

	    if (ename != null) {
	        mv.setViewName("men");
	        mv.addObject("ename", ename); // Add the user's name to the model
	    } else {
	        mv.setViewName("men");
	    }

	    return mv;
	    }
	 @GetMapping("/tshirts")
	 public ModelAndView tshirts(Model model,HttpServletRequest request)
	 {
		 List<Products> products = productService.getAllProducts();
	        model.addAttribute("products", products);

	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    String ename = (String) session.getAttribute("ename");
	    
	    String email =(String)session.getAttribute("email");
	    List<Cart> car = cartService.getCartItemsByEmail(email);
	    model.addAttribute("cartcount",car.size());
        model.addAttribute("cartItems", car);

	        mv.setViewName("tshirts");
	        mv.addObject("ename", ename); // Add the user's name to the model

	    return mv;
	 }
	 @GetMapping("/casulaShirts")
	 public ModelAndView casualshirts(Model model,HttpServletRequest request)
	 {
		 List<Products> products = productService.getAllProducts();
	        model.addAttribute("products", products);

	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    String email =(String)session.getAttribute("email");
	    List<Cart> car = cartService.getCartItemsByEmail(email);
	    model.addAttribute("cartcount",car.size());
        model.addAttribute("cartItems", car);
        
	    String ename = (String) session.getAttribute("ename");

	        mv.setViewName("casulaShirts");
	        mv.addObject("ename", ename); // Add the user's name to the model

	    return mv;
	 }
	 @GetMapping("/formalshirts")
	 public ModelAndView formalshirts(Model model,HttpServletRequest request)
	 {
		 List<Products> products = productService.getAllProducts();
	        model.addAttribute("products", products);

	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    String email =(String)session.getAttribute("email");
	    List<Cart> car = cartService.getCartItemsByEmail(email);
	    model.addAttribute("cartcount",car.size());
        model.addAttribute("cartItems", car);
        
	    String ename = (String) session.getAttribute("ename");

	        mv.setViewName("formalshirts");
	        mv.addObject("ename", ename); // Add the user's name to the model

	    return mv;
	 }
	 @GetMapping("/sweatshirts")
	 public ModelAndView sweatshirts(Model model,HttpServletRequest request)
	 {
		 List<Products> products = productService.getAllProducts();
	        model.addAttribute("products", products);

	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    String email =(String)session.getAttribute("email");
	    List<Cart> car = cartService.getCartItemsByEmail(email);
	    model.addAttribute("cartcount",car.size());
        model.addAttribute("cartItems", car);
        
	    String ename = (String) session.getAttribute("ename");

	        mv.setViewName("sweatshirts");
	        mv.addObject("ename", ename); // Add the user's name to the model

	    return mv;
	 }
	 @GetMapping("/jackets")
	 public ModelAndView jackets(Model model,HttpServletRequest request)
	 {
		 List<Products> products = productService.getAllProducts();
	        model.addAttribute("products", products);

	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    String email =(String)session.getAttribute("email");
	    List<Cart> car = cartService.getCartItemsByEmail(email);
	    model.addAttribute("cartcount",car.size());
        model.addAttribute("cartItems", car);
        
	    String ename = (String) session.getAttribute("ename");

	        mv.setViewName("jackets");
	        mv.addObject("ename", ename); // Add the user's name to the model

	    return mv;
	 }
	 @GetMapping("/jeens")
	 public ModelAndView jeens(Model model,HttpServletRequest request)
	 {
		 List<Products> products = productService.getAllProducts();
	        model.addAttribute("products", products);

	        
	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    String email =(String)session.getAttribute("email");
	    List<Cart> car = cartService.getCartItemsByEmail(email);
	    model.addAttribute("cartcount",car.size());
        model.addAttribute("cartItems", car);
        
	    String ename = (String) session.getAttribute("ename");

	        mv.setViewName("jeens");
	        mv.addObject("ename", ename); // Add the user's name to the model

	    return mv;
	 }
	 @GetMapping("/causaltrousera")
	 public ModelAndView cautrousers(Model model,HttpServletRequest request)
	 {
		 List<Products> products = productService.getAllProducts();
	        model.addAttribute("products", products);

	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    String ename = (String) session.getAttribute("ename");

	    String email =(String)session.getAttribute("email");
	    List<Cart> car = cartService.getCartItemsByEmail(email);
	    model.addAttribute("cartcount",car.size());
        model.addAttribute("cartItems", car);
        
	        mv.setViewName("causaltrousera");
	        mv.addObject("ename", ename); // Add the user's name to the model

	    return mv;
	 }
	 @GetMapping("/trackjoggers")
	 public ModelAndView trackjoggers(Model model,HttpServletRequest request)
	 {
		 List<Products> products = productService.getAllProducts();
	        model.addAttribute("products", products);

	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    String ename = (String) session.getAttribute("ename");

	    String email =(String)session.getAttribute("email");
	    List<Cart> car = cartService.getCartItemsByEmail(email);
	    model.addAttribute("cartcount",car.size());
        model.addAttribute("cartItems", car);
        
	        mv.setViewName("trackjoggers");
	        mv.addObject("ename", ename); // Add the user's name to the model

	    return mv;
	 }
	 @GetMapping("/kurtas")
	 public ModelAndView kurtas(Model model,HttpServletRequest request)
	 {
		 List<Products> products = productService.getAllProducts();
	        model.addAttribute("products", products);

	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    String ename = (String) session.getAttribute("ename");

	    String email =(String)session.getAttribute("email");
	    List<Cart> car = cartService.getCartItemsByEmail(email);
	    model.addAttribute("cartcount",car.size());
        model.addAttribute("cartItems", car);
        
	        mv.setViewName("kurtas");
	        mv.addObject("ename", ename); // Add the user's name to the model

	    return mv;
	 }
	 @GetMapping("/sarees")
	 public ModelAndView sarees(Model model,HttpServletRequest request)
	 {
		 List<Products> products = productService.getAllProducts();
	        model.addAttribute("products", products);

	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    String ename = (String) session.getAttribute("ename");

	    String email =(String)session.getAttribute("email");
	    List<Cart> car = cartService.getCartItemsByEmail(email);
	    model.addAttribute("cartcount",car.size());
        model.addAttribute("cartItems", car);
        
	        mv.setViewName("sarees");
	        mv.addObject("ename", ename); // Add the user's name to the model

	    return mv;
	 }
	 @GetMapping("/skirts")
	 public ModelAndView skirts(Model model,HttpServletRequest request)
	 {
		 List<Products> products = productService.getAllProducts();
	        model.addAttribute("products", products);

	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    String ename = (String) session.getAttribute("ename");

	    String email =(String)session.getAttribute("email");
	    List<Cart> car = cartService.getCartItemsByEmail(email);
	    model.addAttribute("cartcount",car.size());
        model.addAttribute("cartItems", car);
        
	        mv.setViewName("skirts");
	        mv.addObject("ename", ename); // Add the user's name to the model

	    return mv;
	 }
	 @GetMapping("/womensweatshirts")
	 public ModelAndView womensweatshirts(Model model,HttpServletRequest request)
	 {
		 List<Products> products = productService.getAllProducts();
	        model.addAttribute("products", products);

	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    String ename = (String) session.getAttribute("ename");

	    String email =(String)session.getAttribute("email");
	    List<Cart> car = cartService.getCartItemsByEmail(email);
	    model.addAttribute("cartcount",car.size());
        model.addAttribute("cartItems", car);
        
	        mv.setViewName("womensweatshirts");
	        mv.addObject("ename", ename); // Add the user's name to the model

	    return mv;
	 }
	 @GetMapping("/womenjackets")
	 public ModelAndView womenjackets(Model model,HttpServletRequest request)
	 {
		 List<Products> products = productService.getAllProducts();
	        model.addAttribute("products", products);

	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    String ename = (String) session.getAttribute("ename");

	    String email =(String)session.getAttribute("email");
	    List<Cart> car = cartService.getCartItemsByEmail(email);
	    model.addAttribute("cartcount",car.size());
        model.addAttribute("cartItems", car);
        
	        mv.setViewName("womenjackets");
	        mv.addObject("ename", ename); // Add the user's name to the model

	    return mv;
	 }
	 @GetMapping("/wjeens")
	 public ModelAndView wjeens(Model model,HttpServletRequest request)
	 {
		 List<Products> products = productService.getAllProducts();
	        model.addAttribute("products", products);

	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    String ename = (String) session.getAttribute("ename");

	    String email =(String)session.getAttribute("email");
	    List<Cart> car = cartService.getCartItemsByEmail(email);
	    model.addAttribute("cartcount",car.size());
        model.addAttribute("cartItems", car);
        
	        mv.setViewName("wjeens");
	        mv.addObject("ename", ename); // Add the user's name to the model

	    return mv;
	 }
	 @GetMapping("/dress")
	 public ModelAndView dress(Model model,HttpServletRequest request)
	 {
		 List<Products> products = productService.getAllProducts();
	        model.addAttribute("products", products);

	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    String ename = (String) session.getAttribute("ename");

	    String email =(String)session.getAttribute("email");
	    List<Cart> car = cartService.getCartItemsByEmail(email);
	    model.addAttribute("cartcount",car.size());
        model.addAttribute("cartItems", car);
        
	        mv.setViewName("dress");
	        mv.addObject("ename", ename); // Add the user's name to the model

	    return mv;
	 }
	 @GetMapping("/ethnicware")
	 public ModelAndView ethnicware(Model model,HttpServletRequest request)
	 {
		 List<Products> products = productService.getAllProducts();
	        model.addAttribute("products", products);

	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();

	    String ename = (String) session.getAttribute("ename");

	    String email =(String)session.getAttribute("email");
	    List<Cart> car = cartService.getCartItemsByEmail(email);
	    model.addAttribute("cartcount",car.size());
        model.addAttribute("cartItems", car);
        
	        mv.setViewName("ethnicware");
	        mv.addObject("ename", ename); // Add the user's name to the model

	    return mv;
	 }
	 @PostMapping("/add-to-cart")
	 public String addToCart(@RequestParam("productId") String productId, HttpServletRequest request, @RequestParam(name = "returnUrl", required = false, defaultValue = "/") String returnUrl) {
	     // Get the product details from the database based on the productId.
	     Products product = productService.viewuserbyid(Integer.parseInt(productId));
	     HttpSession session = request.getSession();
	     String s=(String) session.getAttribute("email");
	     if (product != null) {
	         // Create a Cart item and populate it with product details.
	         Cart cartItem = new Cart();
	         cartItem.setCartid(Integer.parseInt(productId));
	         cartItem.setName(product.getName());
	         cartItem.setDis(product.getDis());
	         cartItem.setPrice(product.getPrice());
	         cartItem.setCategory(product.getCategory());
	         cartItem.setGender(product.getGender());
	         cartItem.setEmail(s);
	         cartItem.setImage(product.getImage());
	         // Set the user's email

	         // Save the cart item to the database using the CartService.
	         cartService.adduser(cartItem);
	         if (returnUrl.endsWith(".jsp")) {
	             returnUrl = returnUrl.substring(0, returnUrl.lastIndexOf("."));
	         }
	         if(returnUrl==null) {
	        	 return "redirect:"+"/";
	         }
	         // Redirect to a page that shows the updated cart contents.
	         return "redirect:" + returnUrl;
	     } else {
	         // Handle the case where the product does not exist.
	    	  return "redirect:" + returnUrl;
	     }
	 }
	 @GetMapping("/cart")
	 public ModelAndView cartitems(HttpServletRequest request,Model model)
	 {
		  	ModelAndView mv = new ModelAndView();
		    HttpSession session = request.getSession();
		    String email =(String)session.getAttribute("email");
		    List<Cart> car = cartService.getCartItemsByEmail(email);
		    model.addAttribute("cartitems",car);
		    mv.setViewName("Carts");
		    return mv;
	 }
	 @GetMapping("/deleteCartItem")
	 public String deleteCartItem(@RequestParam("id") int itemId) {
	     // Implement the code to delete the item from the cart based on the 'itemId'.
	     // You can use your cartService to delete the item by its ID.
	     // After deleting, you can redirect the user back to the cart page.
	     // Make sure to handle exceptions and validation as needed.
	     
	     // For example:
	     cartService.deleteCartItem(itemId);
	     
	     return "redirect:/cart"; // Redirect back to the cart page after deleting.
	 }

	  
}
