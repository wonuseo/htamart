package model.domain.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor

@Getter
@Setter
@ToString

@Entity
public class Cart {

	@Id
	@Column(name = "c_num")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cNum;

	@ManyToOne
	@JoinColumn(name = "u_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "p_id" )
	private Product product;
	
	@NonNull
	@Column(name = "p_count")
	private Integer productCount;
}
