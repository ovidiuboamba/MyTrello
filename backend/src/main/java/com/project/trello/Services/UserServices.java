package com.project.trello.Services;

import com.project.trello.Dto.EmpDepDTO;
import com.project.trello.Entities.User;
import com.project.trello.Enums.Department;
import com.project.trello.Repos.UsersRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserServices {

    @Autowired
    private UsersRepo usersRepo;

    public User getCredentials(String email){
        return buildLogin(usersRepo.findByEmail(email).get(0));
    }

    private User buildLogin(User userByEmail){
        User user = new User();
        user = getLogin(userByEmail);
        return user;
    }

    private User getLogin(User user){
        User usersCredentials = usersRepo.findByEmail(user.getEmail()).get(0);
        return User.builder().
                email(usersCredentials.getEmail()).
                password(usersCredentials.getPassword()).
                first_name(usersCredentials.getFirst_name()).
                last_name(usersCredentials.getLast_name()).
                department(usersCredentials.getDepartment()).
                role(usersCredentials.getRole()).
                build();
    }

    public List<EmpDepDTO> empDepDTO(String department) {
        return buildEmpDepDTO(usersRepo.findByDepartment(Department.valueOf(department)));
    }

    private List<EmpDepDTO> buildEmpDepDTO(List<User> users) {
        List<EmpDepDTO> empDepDTO = new ArrayList<>();
        int i = 0;
        for(User u: users){
            empDepDTO.add(getEmpDepDTO(u, i));
            i++;
        }
        return empDepDTO;
    }

    private EmpDepDTO getEmpDepDTO(User user, int index) {
        List<User> users = usersRepo.findByDepartment(Department.valueOf(user.getDepartment().toString()));
        return EmpDepDTO.builder().
                first_name(users.get(index).getFirst_name()).
                last_name(users.get(index).getLast_name()).
                role(users.get(index).getRole()).
                build();
    }


}
