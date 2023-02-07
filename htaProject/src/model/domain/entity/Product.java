package model.domain.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor

@Getter
@Setter
@ToString

@Entity
public class Product {
	@Id
	private String p_id;
	
	private String p_name;
	
	@ManyToOne
	@JoinColumn(name = "c_id")
	private Category category;
	
	private Integer p_price;
	
	private String p_info;
	
	private String p_img;
	
	private String p_stock;
	
}
