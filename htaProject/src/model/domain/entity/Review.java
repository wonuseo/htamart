package model.domain.entity;

import java.util.Date;

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

@Setter
@Getter
@ToString

@Entity
public class Review {

	@Id
	@NonNull
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "r_id")
	private Integer reviewId;

	@NonNull
	@ManyToOne
	@JoinColumn(name = "purchase_no")
	private History history;
	
	@NonNull
	@Column(name = "u_id")
	private String userId;
	
	@NonNull
	@Column(name = "p_id")
	private String poductId;
	
	@NonNull
	@Column(name = "star")
	private Double star;
	
	@NonNull
	@Column(name = "review")
	private String review;
	
	@NonNull
	@Column(name = "r_date")
	private Date reviewDate;

}
