package com.project.trello.Services;

import com.project.trello.Entities.Departments;
import com.project.trello.Repos.DepartmentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServices {

    @Autowired
    DepartmentRepo departmentRepo;

    public List<Departments> getDepartments (){
        return departmentRepo.findAll();
    }

}
