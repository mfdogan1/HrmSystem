package project.hrmsystem.model;


import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
public class Department {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "Bu alan gereklidir.")
    @NotNull
    private String name;


    @OneToMany(mappedBy="department")
    private List<User> user = new ArrayList<>();


    public Department() {
    }
}
