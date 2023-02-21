package com.project.trello.Entities;


import com.project.trello.Enums.Department;
import com.project.trello.Enums.Roles;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "users")
@Builder
public class User {

    @Id
    private String email;
    @Column(name = "first_name")
    private String first_name;
    @Column(name = "last_name")
    private String last_name;
    @Column(name = "department")
    private Department department;
    @Column(name = "role")
    private Roles role;
    @Column(name = "password")
    private String password;
}
