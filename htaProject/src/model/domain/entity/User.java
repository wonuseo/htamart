package model.domain.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor

@Getter
@Setter
@ToString

@Entity
public class User {
	
	@Id
	@NonNull
	@Column(name = "u_id")
	private String userId;  
	
	@NonNull
	@Column(name = "u_password")
	private String userPassword;
	
	@NonNull
	@Column(name = "u_name")
	private String userName;
	
	@NonNull
	@Column(name = "u_phone")
	private String userPhone;
	
	@NonNull
	private String address;

	
	@NonNull
	@Column(name = "u_date")
	@Temporal(TemporalType.DATE)
	private Date userDate;
	
	@OneToMany(mappedBy = "user")
	@NonNull
	private List<Cart> cart = new ArrayList<Cart>();
	
}
