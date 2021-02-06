package project.hrmsystem.model;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
@Data
public class Work {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "Bu alan gereklidir.")
    @NotNull
    private String title;

    @NotEmpty(message = "Bu alan gereklidir.")
    @NotNull
    private String description;

    private Date createdDate;
    private Date completedDate;
    private int isCompleted;

    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;

    public Work() {
    }
}
