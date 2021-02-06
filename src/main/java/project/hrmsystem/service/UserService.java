package project.hrmsystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import project.hrmsystem.model.Role;
import project.hrmsystem.model.User;
import project.hrmsystem.model.Work;
import project.hrmsystem.repository.RoleRepository;
import project.hrmsystem.repository.UserRepository;
import project.hrmsystem.repository.WorkRepository;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserService {

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private WorkRepository workRepository;


    public void save(User user){
        user.setPassword(encoder.encode(user.getPassword()));

        user.setIsOff(0);
        Role userRole = roleRepository.findByName("EMPLOYEE");
        user.setRole(userRole);

        userRepository.save(user);
    }


    public void update(Long id,User user){

        User updated = userRepository.getOne(id);

        updated.setSalary(user.getSalary());
        updated.setName(user.getName());
        updated.setSurname(user.getSurname());
        updated.setDepartment(user.getDepartment());

        userRepository.save(updated);
    }



    public User getById(Long id){
        return userRepository.getOne(id);
    }

    public List<User> listAllEmployee(){
        Role role =  roleRepository.findByName("EMPLOYEE");
        return userRepository.findAll().stream().filter(user -> user.getRole().equals(role) ).collect(Collectors.toList());
    }

    public void setOff(User user){

        Date dateNow = new Date();

        if (user.getIsOff() == 0){
            user.setIsOff(1);
            user.setStartOffDate(dateNow);
        }else{
            user.setIsOff(0);
        }
        userRepository.save(user);
    }

    public List<User> listAllAvailable(){
        Role role =  roleRepository.findByName("EMPLOYEE");
        return userRepository.findAll().stream().filter(user -> user.getRole().equals(role) ).filter(user -> user.getIsOff() == 0 ).collect(Collectors.toList());
    }

    public  User getUserByEmail(String email){
        return userRepository.findByEmail(email);
    }

    public void deleteById(Long id){

        User user = userRepository.getOne(id);

        List<Work> works = user.getWorks();

        for (Work work : works) {
                work.setIsCompleted(0);
                work.setUser(null);
                workRepository.save(work);
        }

        userRepository.deleteById(id);
    }

}
