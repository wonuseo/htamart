package model.domain.entity;

import java.util.Date;

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
	private Integer i_id;

	@NonNull
	@ManyToOne
	@JoinColumn(name = "purchase_no")
	private History history;
	
	@NonNull
	private String u_id;
	
	@NonNull
	private String p_id;
	
	@NonNull
	private Double star;
	
	@NonNull
	private String review;
	
	@NonNull
	private Date r_date;

}
