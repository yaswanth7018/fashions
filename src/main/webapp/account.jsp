<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.css" rel="stylesheet" />
    <style>
        /* Your CSS styles here */
    </style>

</head>
<body>
 <style>
        body {
    background: url("../images/bg.svg") center/cover no-repeat fixed;
}

.form-control:focus {
    box-shadow: none;
    border-color: #BA68C8
}

.profile-button {
    background: rgb(99, 39, 120);
    box-shadow: none;
    border: none
}

.profile-button:hover {
    background: #682773
}

.profile-button:focus {
    background: #682773;
    box-shadow: none
}

.profile-button:active {
    background: #682773;
    box-shadow: none
}
.btn {
  display: inline-block;
  border-radius: 0.5rem;
  color: white;
  font-weight: 200;
  font-size: 1rem;
  background:  linear-gradient(to bottom, #ff5151 50%, #ff5e3a);
  box-shadow: var(--box-shadow-1);
}
.btn:hover{
color:white;
}

.back:hover {
    color: #682773;
    cursor: pointer
}

.labels {
    font-size: 11px
}
.btn-save{
  border-radius: 0.5rem;
  color: white;
  padding-left:20px;
  padding-right:20px;
  font-weight: 200;
  font-size: 1.5rem;
  background:  linear-gradient(to bottom, #ff5151 50%, #ff5e3a);
  display:none;
}
.btn-save:hover{
color:white;
}

.add-experience:hover {
    background: #BA68C8;
    color: #fff;
    cursor: pointer;
    border: solid 1px #BA68C8
}
    </style>
    
    <script>
        // JavaScript function to toggle field enable/disable and submit form
        function toggleFields() {
            const inputFields = document.querySelectorAll('.form-control');
            const updateButton = document.querySelector('.btn');
            const savebutton = document.querySelector('.btn-save');

            if (updateButton.textContent === 'Update') {
                // Enable input fields
                inputFields.forEach(function(input) {
                    input.removeAttribute('disabled');
                });

                // Change button text to 'Save'
                updateButton.style.display='none';
                savebutton.style.display='inline-block';
            } else {
                // Disable input fields
                inputFields.forEach(function(input) {
                    input.setAttribute('disabled', 'true');
                });

                // Change button text back to 'Update'
                updateButton.textContent = 'Update';
            }
        }
    </script>
    <div class="container rounded bg-white mt-5 mb-2">
        <div class="row">
            <div class="col-md-3 border-right">
                <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold">${user.name}</span><span class="text-black-50">${user.email}</span><span> </span></div>
            </div>
            <div class="col-md-5 border-right">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="text-right">Profile Settings</h4>
                    </div>
                    <form method="post" action="/savedetails">
                    <div class="row mt-2">
                        <div class="col-md-12"><label class="labels">Name</label><input type="text" class="form-control" placeholder="" value="${user.name}" disabled name="name"></div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12"><label class="labels">Mobile Number</label><input type="text" class="form-control" placeholder="enter phone number" value="${user.number}" disabled name="number"></div>
                        <div class="col-md-12"><label class="labels">Address Line 1</label><input type="text" class="form-control" placeholder="" value="${user.address_Line_1}" disabled name="addr1"></div>
                        <div class="col-md-12"><label class="labels">Address Line 2</label><input type="text" class="form-control" placeholder="" value="${user.address_Line_2}" disabled name="addr2"></div>
                        <div class="col-md-12"><label class="labels">Postcode</label><input type="text" class="form-control" placeholder="" value="${user.postcode}" disabled name="pincode"></div>                                            

                    </div>
                    <div class="row mt-3">
                        <div class="col-md-6"><label class="labels">Country</label><input type="text" class="form-control" placeholder="country" value="India" disabled></div>
                        <div class="col-md-6"><label class="labels">State/Region</label><select name="state" id="state" class="form-control" disabled>
                            <option value="${user.state}" selected>${user.state}</option>
                            <option value="Andhra Pradesh">Andhra Pradesh</option>
                            <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
<option value="Arunachal Pradesh">Arunachal Pradesh</option>
<option value="Assam">Assam</option>
<option value="Bihar">Bihar</option>
<option value="Chandigarh">Chandigarh</option>
<option value="Chhattisgarh">Chhattisgarh</option>
<option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
<option value="Daman and Diu">Daman and Diu</option>
<option value="Delhi">Delhi</option>
<option value="Lakshadweep">Lakshadweep</option>
<option value="Puducherry">Puducherry</option>
<option value="Goa">Goa</option>
<option value="Gujarat">Gujarat</option>
<option value="Haryana">Haryana</option>
<option value="Himachal Pradesh">Himachal Pradesh</option>
<option value="Jammu and Kashmir">Jammu and Kashmir</option>
<option value="Jharkhand">Jharkhand</option>
<option value="Karnataka">Karnataka</option>
<option value="Kerala">Kerala</option>
<option value="Madhya Pradesh">Madhya Pradesh</option>
<option value="Maharashtra">Maharashtra</option>
<option value="Manipur">Manipur</option>
<option value="Meghalaya">Meghalaya</option>
<option value="Mizoram">Mizoram</option>
<option value="Nagaland">Nagaland</option>
<option value="Odisha">Odisha</option>
<option value="Punjab">Punjab</option>
<option value="Rajasthan">Rajasthan</option>
<option value="Sikkim">Sikkim</option>
<option value="Tamil Nadu">Tamil Nadu</option>
<option value="Telangana">Telangana</option>
<option value="Tripura">Tripura</option>
<option value="Uttar Pradesh">Uttar Pradesh</option>
<option value="Uttarakhand">Uttarakhand</option>
<option value="West Bengal">West Bengal</option>
                        </select></div>
                    </div>
                    <div class="mt-5 text-center">
                        <button class="btn-save"  type="submit">Save</button>
                    </div>
                    </form>
                    <div class="mt-5 text-center">
                        <button class="btn" onclick="toggleFields()">Update</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
