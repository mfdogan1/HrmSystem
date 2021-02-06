package project.hrmsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import project.hrmsystem.model.Work;

@Repository
public interface WorkRepository extends JpaRepository<Work,Long> {
}
