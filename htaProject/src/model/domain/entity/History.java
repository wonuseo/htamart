package model.domain.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

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
public class History {

	@Id
	@NonNull
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "purchase_no")
	private Integer purchaseNo;

	@NonNull
	@Column(name = "u_id")
	private String userId;
	
	@NonNull
	@Column(name = "p_id")
	private String productId;
	
	@NonNull
	@Column(name = "p_count")
	private Integer productCount;
	
	@NonNull
	@Column(name = "h_date")
	private Date historyDate;
	
	@OneToMany(mappedBy = "history")
	private List<Review> review = new ArrayList<Review>();
}
