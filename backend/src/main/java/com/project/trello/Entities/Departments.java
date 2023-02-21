package com.project.trello.Entities;

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
@Table(name = "department")
@Builder
public class Departments {

    @Id
    private int id_dep;

    @Column(name = "name_dep")
    private String name_dep;

}
