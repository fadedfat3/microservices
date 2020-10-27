package com.example.microservices.admin.dto;

import com.example.microservices.admin.entity.SysDept;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SysDeptDTO extends SysDept {
    private Integer childNum;

}
