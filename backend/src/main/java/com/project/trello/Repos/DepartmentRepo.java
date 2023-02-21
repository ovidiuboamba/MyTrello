package com.project.trello.Repos;

import com.project.trello.Entities.Departments;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DepartmentRepo extends JpaRepository<Departments, String> {

    public List<Departments> findAll();

}
