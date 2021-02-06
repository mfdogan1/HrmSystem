package project.hrmsystem.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.hrmsystem.model.User;
import project.hrmsystem.model.Work;
import project.hrmsystem.model.statisticsDto;
import project.hrmsystem.repository.DepartmentRepository;
import project.hrmsystem.repository.UserRepository;
import project.hrmsystem.repository.WorkRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class MapService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private WorkRepository workRepository;

    @Autowired
    private DepartmentRepository departmentRepository;

    public long getTotalCompletedWorks(){
        return workRepository.findAll().stream().filter(work -> work.getIsCompleted() == 1).collect(Collectors.toList()).stream().count();
    }

    public long getTotalEmployee(){
        return userRepository.count();
    }

    public double getTotalSalary(){

        double totalSalary = 0;

        for (User user :  userRepository.findAll() ) {
            totalSalary+= user.getSalary();
        }

        return totalSalary;
    }

    public List<User> getOffEmployees(){
        return userRepository.findAll().stream().filter(user -> user.getIsOff() == 1).collect(Collectors.toList());
    }

    public List<Work> getUnAssignedWorks(){
        return workRepository.findAll().stream().filter(work -> work.getUser() == null).collect(Collectors.toList());
    }

    public long getDepartmentsCount(){
        return departmentRepository.count();
    }



    public statisticsDto getAll(){

        statisticsDto stats = new statisticsDto();

        stats.setOffEmployees(getOffEmployees());
        stats.setTotalCompletedWorks(getTotalCompletedWorks());
        stats.setTotalSalary(getTotalSalary());
        stats.setTotalEmployees(getTotalEmployee());
        stats.setUnAssignedWorks(getUnAssignedWorks());
        stats.setTotalDepartments(getDepartmentsCount());

        return stats;
    }




}
