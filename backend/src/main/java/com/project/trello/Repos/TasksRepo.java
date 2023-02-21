package com.project.trello.Repos;

import com.project.trello.Entities.Task;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TasksRepo extends JpaRepository<Task, String> {
    public List<Task> findAll();

    public List<Task> findByEmail(String email);

    public void deleteByIdTask(int id);
}
