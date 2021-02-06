package project.hrmsystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.hrmsystem.model.User;
import project.hrmsystem.model.Work;
import project.hrmsystem.repository.WorkRepository;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class WorkService {

    @Autowired
    private WorkRepository workRepository;

    public List<Work> findAll(){
        return workRepository.findAll();
    }

    public Work getById(Long id){
        return workRepository.getOne(id);
    }

    public void save(Work work){

        work.setCreatedDate(new Date());

        work.setIsCompleted(0);


        workRepository.save(work);
    }

    public void updateWork(Work work){

        work.setIsCompleted(1);
        work.setCompletedDate(new Date());
        workRepository.save(work);

    }

    public List<Work> getUnassignedWorks(User user){
        return user.getWorks().stream().filter(work -> work.getIsCompleted() == 0).collect(Collectors.toList());
    }

    public void deleteById(Long id){

        Work work = workRepository.getOne(id);

//        work.setUser(null);

        workRepository.deleteById(id);
    }

}
