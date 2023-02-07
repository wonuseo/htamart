package model.domain.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.ToString;
import lombok.Setter;

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
	private Integer purchase_no;
	
	@NonNull
	private String u_id;
	
	@NonNull
	private String p_id;
	
	@NonNull
	private Integer p_count;
	
	@NonNull
	private Date h_date;
	
	@OneToMany(mappedBy = "history")
	private List<Review> review = new ArrayList<Review>();
}
