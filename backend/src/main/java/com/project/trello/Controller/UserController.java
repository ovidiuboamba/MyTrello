package com.project.trello.Controller;

import com.project.trello.Dto.EmpDepDTO;
import com.project.trello.Dto.LoginDTO;
import com.project.trello.Entities.Project;
import com.project.trello.Entities.Task;
import com.project.trello.Entities.User;
import com.project.trello.Repos.TasksRepo;
import com.project.trello.Repos.UsersRepo;
import com.project.trello.Services.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Method;
import java.nio.file.Path;
import java.util.List;

@RestController
@RequestMapping("/homepage")
public class UserController {

    @Autowired
    private UserServices userServices;

    @Autowired
    private UsersRepo usersRepo;

    @Autowired
    private TasksRepo tasksRepo;


    @GetMapping("/login/{email}")
    public ResponseEntity<User> getLoginCredentials(@PathVariable(value = "email") String email) {
        try{
            User user = userServices.getCredentials(email);
            if(user.equals(null)) return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            return new ResponseEntity<>(
                    user,
                    HttpStatus.OK
            );
        }catch(Exception e){
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/employees/{department}")
    public ResponseEntity<List<EmpDepDTO>> getEmployees(@PathVariable(value = "department") String department) {
        try{
            return new ResponseEntity<>(
                    userServices.empDepDTO(department),
                    HttpStatus.OK
            );
        }catch(Exception e){
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
    }


    @PostMapping("/signUp")
    public ResponseEntity<User> registerUser(@RequestBody User user) {
        try{
            return new ResponseEntity<>(
                    usersRepo.save(user),
                    HttpStatus.OK
            );
        }catch(Exception e) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/users/{email}")
    public ResponseEntity<User> getUser(@PathVariable(value = "email") String email) {
        try{
            return new ResponseEntity<>(
                    usersRepo.findByEmail(email).get(0),
                    HttpStatus.OK
            );
        }catch(Exception e){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }




}
