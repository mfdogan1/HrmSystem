package project.hrmsystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.hrmsystem.model.Department;
import project.hrmsystem.model.User;
import project.hrmsystem.repository.DepartmentRepository;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentRepository departmanRepository;


    public List<Department> getAll(){
        return departmanRepository.findAll();
    }

    public void save(Department department){

        departmanRepository.save(department);
    }

    public void deleteById(Long id){

        Department department = departmanRepository.getOne(id);

        for (User user : department.getUser()) {
            user.setDepartment(null);
        }

        departmanRepository.deleteById(id);
    }

}
