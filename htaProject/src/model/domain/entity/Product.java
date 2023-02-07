package model.domain.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor

@Getter
@Setter
@ToString

@Entity
public class Product {
	@Id
	@NonNull
	private String p_id;
	
	@NonNull
	private String p_name;
	
	@ManyToOne
	@JoinColumn(name = "c_id")
	private Category category;
	
	@NonNull
	private Integer p_price;
	
	@NonNull
	private String p_info;
	
	@NonNull
	private String p_img;
	
	@NonNull
	private String p_stock;
	
}
