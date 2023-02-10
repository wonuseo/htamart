package model.domain.entity;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

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
	private String u_id;
	
	@NonNull
	private String u_password;
	
	@NonNull
	private String u_name;
	
	@NonNull
	private String u_phone;
	
	@NonNull
	private String u_address;
	
	@NonNull
	private LocalDate u_date;
	
	@OneToMany(mappedBy = "user")
	@NonNull
	private List<Cart> cart = new ArrayList<Cart>();
	
}
