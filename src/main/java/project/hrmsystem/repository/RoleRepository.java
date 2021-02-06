package project.hrmsystem.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import project.hrmsystem.model.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role,Long> {

    Role findByName(String role);

}
