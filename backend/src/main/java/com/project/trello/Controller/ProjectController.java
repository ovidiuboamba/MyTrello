package com.project.trello.Controller;

import com.project.trello.Entities.Project;
import com.project.trello.Repos.ProjectRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/homepage")
public class ProjectController {

    @Autowired
    ProjectRepo projectRepo;

    @GetMapping("/projects")
    public ResponseEntity<List<Project>> getProjects() {
        try{
            return new ResponseEntity<>(
                    projectRepo.findAll(),
                    HttpStatus.OK
            );
        }catch(Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

    }
}
