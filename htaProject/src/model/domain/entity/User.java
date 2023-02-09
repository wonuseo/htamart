package model.domain.entity;



import java.time.LocalDate;
import java.util.ArrayList;
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

@NoArgsConstructor
@AllArgsConstructor

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

	private String address;
	
	@NonNull
	private LocalDate u_date;
	
	@NonNull
	@OneToMany(mappedBy = "user")
	private List<Cart> Cart = new ArrayList<Cart>();
	
}
