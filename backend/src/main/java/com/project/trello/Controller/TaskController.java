package com.project.trello.Controller;

import com.project.trello.Entities.Task;
import com.project.trello.Entities.User;
import com.project.trello.Repos.TasksRepo;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/homepage")
public class TaskController {

    @Autowired
    TasksRepo tasksRepo;


    @GetMapping("/getLastTask")
    public ResponseEntity<Task> getLastTask(){
        try {
            int lastIndex = tasksRepo.findAll().size()-1;
            return new ResponseEntity<>(
              tasksRepo.findAll().get(lastIndex),
                    HttpStatus.OK
            );
        }catch (Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/createTask")
    public ResponseEntity<Task> postTask(@RequestBody Task task){
        try{
            return new ResponseEntity<>(
                    tasksRepo.save(task),
                    HttpStatus.OK
            );
        }catch(Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/getTasksByEmail/{email}")
    public ResponseEntity<List<Task>> getTasksByEmail(@PathVariable(name = "email") String email){
        try {
            return new ResponseEntity<>(
                    tasksRepo.findByEmail(email),
                    HttpStatus.OK
            );
        }catch (Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @Transactional
    @DeleteMapping("/deleteTask/{idTask}")
    public void deleteTask(@PathVariable(name = "idTask") int idTask){
        tasksRepo.deleteByIdTask(idTask);
    }
}
