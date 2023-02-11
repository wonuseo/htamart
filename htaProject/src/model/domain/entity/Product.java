package model.domain.entity;

import java.util.ArrayList;
import java.util.List;

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
	@NonNull
	private Category category; //category 테이블의 c_id 컬럼들의 값을 참조하는 컬럼이다 보니 category변수는 product의 id값이 매핑되서 저장됨. 카테고리 객체인데 카테고리 객체의 id값만이 매핑되서 저장.
	
	@NonNull
	private Integer p_price;
	
	@NonNull
	private String p_info;
	
	@NonNull
	private String p_img;
	
	@NonNull
	private String p_stock;
	
	@OneToMany(mappedBy = "product")
	@NonNull
	private List<Cart> cart = new ArrayList<Cart>();
	
}
