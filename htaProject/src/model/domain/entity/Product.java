package model.domain.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
public class Product {
	@Id
	@NonNull
	@Column(name = "p_id ")
	private String productId;

	@NonNull
	@Column(name = "p_name")
	private String productName;

	@ManyToOne
	@JoinColumn(name = "c_id")
	private Category category;

	@NonNull
	@Column(name = "p_price")
	private Integer productPrice;

	@NonNull
	@Column(name = "p_info")
	private String productInfo;

	@NonNull
	@Column(name = "p_img")
	private String productImg;

	@NonNull
	@Column(name = "p_stock")
	private String productStock;
	
	@OneToMany(mappedBy = "product")
	@NonNull
	private List<Cart> cart = new ArrayList<Cart>();

}


