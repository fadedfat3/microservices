package com.example.microservices.admin.dto;

import com.example.microservices.admin.entity.SysDept;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SysDeptDTO extends SysDept {
    private List<SysDept> children = new ArrayList<>();

    public SysDeptDTO(SysDept dept) {
        super(dept);
    }
}
