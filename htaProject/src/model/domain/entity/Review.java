package model.domain.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

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
