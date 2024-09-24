package com.fashion.model;
import java.util.Arrays;

import com.mysql.cj.jdbc.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;

@Entity
@Table(name="Orders")
public class Orders {
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name="id",unique=true)
		private int id;
		@Column(name="product_name",nullable=false,length = 50)
		private String pname;
		@Column(name="pdis",nullable=false,length = 50)
		private String pdis;
		@Column(name="price",nullable=false)
		private String price;
		@Column(name="gender",nullable=false)
		private String gender;
		@Column(name="category",nullable=false)
		private String category;
		@Column(name="email",nullable=true)
		private String email;
		@Column(name="product_id",nullable=true)
		private int proid;
		@Lob
		@Column(name = "product_image", columnDefinition = "LONGBLOB")
	    private byte[] image;
		@Column(name="paier_Namer",nullable=false)
		private String paiername;
		@Column(name="Door_no",nullable=false)
		private String dono;
		@Column(name="street",nullable=false)
		private String street;
		@Column(name="city",nullable=false)
		private String city;
		@Column(name="state",nullable=false)
		private String state;
		@Column(name="pincode",nullable=false)
		private String pincode;
		@Column(name="phone_number",nullable=false)
		private String phononumber;
		@Column(name="delivery_date",nullable=false)
		private String delivery_date;
		@Column(name="delivery_status",nullable=false)
		private String delivery_status;
		
		
		
		
		public Orders(int id, String pname, String pdis, String price, String gender, String category, String email,
				int proid, byte[] image, String paiername, String dono, String street, String city, String state,
				String pincode, String phononumber, String delivery_date, String delivery_status) {
			super();
			this.id = id;
			this.pname = pname;
			this.pdis = pdis;
			this.price = price;
			this.gender = gender;
			this.category = category;
			this.email = email;
			this.proid = proid;
			this.image = image;
			this.paiername = paiername;
			this.dono = dono;
			this.street = street;
			this.city = city;
			this.state = state;
			this.pincode = pincode;
			this.phononumber = phononumber;
			this.delivery_date = delivery_date;
			this.delivery_status = delivery_status;
		}


		public String getDelivery_status() {
			return delivery_status;
		}


		public void setDelivery_status(String delivery_status) {
			this.delivery_status = delivery_status;
		}


		public int getId() {
			return id;
		}


		public void setId(int id) {
			this.id = id;
		}


		public String getPname() {
			return pname;
		}


		public void setPname(String pname) {
			this.pname = pname;
		}


		public String getPdis() {
			return pdis;
		}


		public void setPdis(String pdis) {
			this.pdis = pdis;
		}


		public String getPrice() {
			return price;
		}


		public void setPrice(String price) {
			this.price = price;
		}


		public String getGender() {
			return gender;
		}


		public void setGender(String gender) {
			this.gender = gender;
		}


		public String getCategory() {
			return category;
		}


		public void setCategory(String category) {
			this.category = category;
		}


		public String getEmail() {
			return email;
		}


		public void setEmail(String email) {
			this.email = email;
		}


		public int getProid() {
			return proid;
		}


		public void setProid(int proid) {
			this.proid = proid;
		}


		public byte[] getImage() {
			return image;
		}


		public void setImage(byte[] image) {
			this.image = image;
		}


		public String getPaiername() {
			return paiername;
		}


		public void setPaiername(String paiername) {
			this.paiername = paiername;
		}


		public String getDono() {
			return dono;
		}


		public void setDono(String dono) {
			this.dono = dono;
		}


		public String getStreet() {
			return street;
		}


		public void setStreet(String street) {
			this.street = street;
		}


		public String getCity() {
			return city;
		}


		public void setCity(String city) {
			this.city = city;
		}


		public String getState() {
			return state;
		}


		public void setState(String state) {
			this.state = state;
		}


		public String getPincode() {
			return pincode;
		}


		public void setPincode(String pincode) {
			this.pincode = pincode;
		}


		public String getPhononumber() {
			return phononumber;
		}


		public void setPhononumber(String phononumber) {
			this.phononumber = phononumber;
		}


		public String getDelivery_date() {
			return delivery_date;
		}


		public void setDelivery_date(String delivery_date) {
			this.delivery_date = delivery_date;
		}


		@Override
		public String toString() {
			return "Orders [id=" + id + ", pname=" + pname + ", pdis=" + pdis + ", price=" + price + ", gender="
					+ gender + ", category=" + category + ", email=" + email + ", proid=" + proid + ", image="
					+ Arrays.toString(image) + ", paiername=" + paiername + ", dono=" + dono + ", street=" + street
					+ ", city=" + city + ", state=" + state + ", pincode=" + pincode + ", phononumber=" + phononumber
					+ ", delivery_date=" + delivery_date + "]";
		}


		public Orders() {
			super();
		}


}
