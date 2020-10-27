package com.example.microservices.admin.dto;

import com.example.microservices.admin.entity.SysPermission;
import com.example.microservices.admin.entity.SysRole;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SysPermissionDTO extends SysPermission {
    private List<SysRole> roles;
}
