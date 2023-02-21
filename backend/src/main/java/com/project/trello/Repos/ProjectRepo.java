package com.project.trello.Repos;

import com.project.trello.Entities.Project;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProjectRepo extends JpaRepository<Project, String> {
    public List<Project> findAll();
}
