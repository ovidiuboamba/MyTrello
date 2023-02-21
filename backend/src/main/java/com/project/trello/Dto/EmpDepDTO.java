package com.project.trello.Dto;

import com.project.trello.Enums.Department;
import com.project.trello.Enums.Roles;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EmpDepDTO {
    private String first_name;
    private String last_name;
    private Roles role;
}
