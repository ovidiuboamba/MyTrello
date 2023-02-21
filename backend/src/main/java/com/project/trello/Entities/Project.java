package com.project.trello.Entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "projects")
@Builder
public class Project {
    @Id
    private String nameProject;

    @Column(name = "company")
    private String company;

    @Column(name = "deadline")
    private Date deadline;
}
