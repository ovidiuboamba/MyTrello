package com.project.trello.Repos;

import com.project.trello.Entities.User;
import com.project.trello.Enums.Department;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UsersRepo extends JpaRepository<User, String> {
    public List<User> findByEmail(String email);
    public List<User> findByDepartment(Department department);

}
