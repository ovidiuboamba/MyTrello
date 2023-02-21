package com.project.trello.Controller;

import com.project.trello.Entities.Departments;
import com.project.trello.Services.DepartmentServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/homepage")
public class DepartmentController {

    @Autowired
    DepartmentServices departmentServices;

    @GetMapping("/departments")
    public ResponseEntity<List<Departments>> getDepartments()
    {
        try{
            List<Departments> departments = departmentServices.getDepartments();
            return new ResponseEntity<>(
                    departments,
                    HttpStatus.OK);
        }catch(Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
