package project.hrmsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import project.hrmsystem.model.Department;

@Repository
public interface DepartmentRepository extends JpaRepository<Department, Long> {

}
