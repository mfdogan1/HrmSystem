package project.hrmsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import project.hrmsystem.model.User;
import project.hrmsystem.model.Work;
import project.hrmsystem.service.MapService;
import project.hrmsystem.service.UserService;
import project.hrmsystem.service.WorkService;

import java.security.Principal;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class HomeController {

    @Autowired
    private UserService userService;

    @Autowired
    private WorkService workService;

    @Autowired
    private MapService mapService;

    @RequestMapping("/")
    public String getAll(Model model, Principal principal){

        User user = userService.getUserByEmail(principal.getName());

        model.addAttribute("works",workService.getUnassignedWorks(user));

        long completedWork = user.getWorks().stream().filter(work -> work.getIsCompleted() == 1).collect(Collectors.toList()).stream().count();
        model.addAttribute("workCount",completedWork);

        model.addAttribute("user",user);
        model.addAttribute("stats",mapService.getAll());

        return "home";
    }

    @RequestMapping("/assignedworks")
    public String employeeWorks(Model model, Principal principal){

        User user = userService.getUserByEmail(principal.getName());


        model.addAttribute("works",workService.getUnassignedWorks(user));

        return "assignedworks";
    }


    @RequestMapping("updateWork/{id}")
    public String updateWork(@PathVariable Long id){

        workService.updateWork(workService.getById(id));

        return "redirect:/assignedworks";
    }

    @RequestMapping("/completedworks")
    public String completedWorks(Model model, Principal principal){

        User user = userService.getUserByEmail(principal.getName());

        List<Work> works = user.getWorks().stream().filter(work -> work.getIsCompleted() == 1).collect(Collectors.toList());

        model.addAttribute("works",works);


        return "completedworks";
    }


}
