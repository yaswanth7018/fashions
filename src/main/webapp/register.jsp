<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Login</title>
    <style>
    
    #message {
        background:transparent;
        color: #000;
        position: relative;
        left: 0%;
      }
      
      #message p {
        font-size: 12px;
      }
      
      /* Add a green text color and a checkmark when the requirements are right */
      .valid {
        color: green;
      }
      
      .valid:before {
        position: relative;
        left: -35px;
      }
      
      /* Add a red text color and an "x" icon when the requirements are wrong */
      .invalid {
        color:red;
        font-weight: lighter;
      }
      
      .invalid:before {
        position: relative;
        left: -35px;
      }
.alert {
  position: relative;
  top: 10;
  left: 0;
  width: auto;
  height: auto;
  padding: 10px;
  margin: 10px;
  line-height: 1.8;
  border-radius: 5px;
  cursor: hand;
  cursor: pointer;
  font-family: sans-serif;
  font-weight: 400;
  background-color: #FEE;
}

.alertCheckbox {
  display: none;
}

:checked + .alert {
  display: none;
}

.alertText {
  display: table;
  margin: 0 auto;
  text-align: center;
  font-size: 16px;
}

.alertClose {
  float: right;
  padding-top: 5px;
  font-size: 10px;
}

.clear {
  clear: both;
}

.info {
  background-color: #EEE;
  border: 1px solid #DDD;
  color: #999;
}

.success {
  background-color: #EFE;
}
    </style>
</head>
<body>
    <section class="h-100 gradient-form" style="background-color: #eee;">
        <div class="container py-5 h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-xl-10">
              <div class="card rounded-3 text-black">
                <div class="row g-0">
                  <div class="col-lg-6">
                    <div class="card-body p-md-5 mx-md-4">
      
                      <div class="text-center">
                        <img src="./images/logo.png"
                          style="width: 250px;" alt="logo">
                        
                      </div>
      
                      <form method="post" action="insertemp">
     
                    <center>
                        <p style="font-weight: 600; font-size: 20px;">Please Register your account</p>
                    </center>
                               <% String message = (String)request.getAttribute("message"); %>
<% if (message != null) { %>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
   ${message}
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<% } %>
                      <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example11">Full Name</label>
                          <input type="text" id="form2Example11" class="form-control"
                            placeholder="Full Name" name="name"/>
                          
                        </div>
                        
                          <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example11">Email</label>
                          <input type="email" id="form2Example11" class="form-control"
                            placeholder="email address" name="email"/>
                          
                        </div>
                        
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example11">Mobile Number</label>
                          <input type="number" id="form2Example11" class="form-control"
                            placeholder="Mobile Number" name="mobilenumber"/>
                          
                        </div>
      
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example22">Password</label>
                          <input type="password" id="psw" class="form-control" placeholder="password" name="pwd" />
                      
                        </div>
                         <div id="message">
                <p id="letter" class="invalid">A lowercase letter</p>
                <p id="capital" class="invalid">A capital (uppercase) letter</p>
                <p id="number" class="invalid">A number</p>
                <p id="length" class="invalid">Minimum 8 characters</b></p>
              </div>
                      
                         <div class="text-center pt-1 mb-5 pb-1">
                          <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit" style="background: linear-gradient(to bottom, #ff5151 50%, #ff5e3a); border: none;width: 100%" id="submit-btn">Register
                            </button>
                        </div>
                        
      
                        <div class="d-flex align-items-center justify-content-center pb-4">
                          <p class="mb-0 me-2">Already have an account?</p>
                          <a type="button" class="btn btn-outline-danger" style="background: ;" href="/login">Login</a>
                          <a type="button" class="btn btn-outline-danger" style="background: ;" href="/adminreg">Admin Register</a>
                        </div>
      
                      </form>
      
                    </div>
                  </div>
                  <div class="col-lg-6 d-flex align-items-center gradient-custom-2" style="background:linear-gradient(to bottom, #ff5151 50%, #ff5e3a);;">
                    <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                      <h4 class="mb-4">We are more than just a company</h4>
                      <p class="small mb-0">Fashion design is the art of applying design, aesthetics, clothing construction and natural beauty to clothing and its accessories. It is influenced by culture and different trends, and has varied over time and place. "A fashion designer creates clothing, including dresses, suits, pants, and skirts, and accessories like shoes and handbags, for consumers. He or she can specialize in clothing, accessory, or jewelry design, or may work in more than one of these areas.</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
         <script>
    var myInput = document.getElementById("psw");
    var letter = document.getElementById("letter");
    var capital = document.getElementById("capital");
    var number = document.getElementById("number");
    var length = document.getElementById("length");
    var submitbutton = document.getElementById("submit-btn");
    
    // When the user clicks on the password field, show the message box
    myInput.onfocus = function() {
      document.getElementById("message").style.display = "block";
    }
    
    // When the user clicks outside of the password field, hide the message box
    myInput.onblur = function() {
      document.getElementById("message").style.display = "none";
    }
    
    // When the user starts to type something inside the password field
    myInput.onkeyup = function() {
      // Validate lowercase letters
      var lowerCaseLetters = /[a-z]/g;
      if(myInput.value.match(lowerCaseLetters)) {
        letter.classList.remove("invalid");
        letter.classList.add("valid");
      } else {
        letter.classList.remove("valid");
        letter.classList.add("invalid");
    }
    
      // Validate capital letters
      var upperCaseLetters = /[A-Z]/g;
      if(myInput.value.match(upperCaseLetters)) {
        capital.classList.remove("invalid");
        capital.classList.add("valid");
      } else {
        capital.classList.remove("valid");
        capital.classList.add("invalid");
      }
    
      // Validate numbers
      var numbers = /[0-9]/g;
      if(myInput.value.match(numbers)) {
        number.classList.remove("invalid");
        number.classList.add("valid");
      } else {
        number.classList.remove("valid");
        number.classList.add("invalid");
      }
    
      // Validate length
      if(myInput.value.length >= 8) {
        length.classList.remove("invalid");
        length.classList.add("valid");
      } else {
        length.classList.remove("valid");
        length.classList.add("invalid");
      }
    }
    $().alert('close')

    </script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>

</html>