package model.domain.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.NonNull;

@AllArgsConstructor
@NoArgsConstructor

@Getter
@Setter
@ToString

@Entity
public class Cart {
	
	@ManyToOne
	@JoinColumn(name = "u_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "p_id")
	private Product product;
	
	@NonNull
	@Id
	private Integer p_count;
	
	
}
