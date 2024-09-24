package com.fashion.model;

import org.springframework.boot.context.properties.bind.ConstructorBinding;

import io.micrometer.core.annotation.Counted;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="users")
public class Users {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="user_id")
	private int id;
	@Column(name="user_name",nullable=false,length = 50)
	private String name;
	@Column(name="email",nullable=false,length = 50,unique=true)
	private String email;
	@Column(name="Mobile_Number",nullable=false,length = 50)
	private long number;
	@Column(name="password",nullable=false,length = 50)
	private String password;
	@Column(name="emp_active",nullable=false)
	private boolean active;
	@Column(name="user_Address_line1",nullable=true)
	private String Address_Line_1;
	@Column(name="user_Address_line2",nullable=true)
	private String Address_Line_2;
	@Column(name="pincode",nullable=true)
	private String Postcode;
	@Column(name="state",nullable=true)
	private String state;
	@Column(name="city",nullable=true)
	private String city;
	@Column(name="Country",nullable=true)
	private String country;
	@Column(name="admin",nullable=false)
	private String admin;
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	
	public Users(int id, String name, String email, long number, String password, boolean active, String address_Line_1,
			String address_Line_2, String postcode, String state, String city, String country, String admin) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.number = number;
		this.password = password;
		this.active = active;
		Address_Line_1 = address_Line_1;
		Address_Line_2 = address_Line_2;
		Postcode = postcode;
		this.state = state;
		this.city = city;
		this.country = country;
		this.admin = admin;
	}
	public String getAddress_Line_1() {
		return Address_Line_1;
	}
	public void setAddress_Line_1(String address_Line_1) {
		Address_Line_1 = address_Line_1;
	}
	public String getAddress_Line_2() {
		return Address_Line_2;
	}
	public void setAddress_Line_2(String address_Line_2) {
		Address_Line_2 = address_Line_2;
	}
	public String getPostcode() {
		return Postcode;
	}
	public void setPostcode(String postcode) {
		Postcode = postcode;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public Users() {
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public long getNumber() {
		return number;
	}
	public void setNumber(long number) {
		this.number = number;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", name=" + name + ", email=" + email + ", number=" + number + ", password="
				+ password + ", active=" + active + ", Address_Line_1=" + Address_Line_1 + ", Address_Line_2="
				+ Address_Line_2 + ", Postcode=" + Postcode + ", state=" + state + ", city=" + city + ", country="
				+ country + "]";
	}

	

}
