package project.hrmsystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import project.hrmsystem.model.Department;
import project.hrmsystem.service.DepartmentService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/department")
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/")
    public String getAll(Model model){

        model.addAttribute("departments",departmentService.getAll());

        return "departmentlist";
    }

    @RequestMapping("/addDepartment")
    public ModelAndView createDepartment(){

        Department department = new Department();

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("department", department);
        modelAndView.setViewName("addDepartment");

        return modelAndView;
    }

    @PostMapping("/addDepartment")
    public ModelAndView createDepartment(@Valid @ModelAttribute("department")Department department, BindingResult bindingResult) {

        ModelAndView modelAndView = new ModelAndView();

        if(bindingResult.hasErrors()){
            modelAndView.setViewName("addDepartment");
            return modelAndView;
        }

        modelAndView.setViewName("redirect:/department/");

        departmentService.save(department);

        return modelAndView;
    }

    @RequestMapping("/deleteDepartment/{id}")
    public String deleteDepartment(@PathVariable Long id){

        departmentService.deleteById(id);

        return "redirect:/department/";
    }


}