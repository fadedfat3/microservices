package com.example.microservices.admin.dto;

import com.example.microservices.admin.entity.SysMenu;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class SysMenuDTO extends SysMenu {


    private List<SysMenuDTO> children = new ArrayList<>();

    public SysMenuDTO(SysMenu menu) {
        super(menu);
    }

    public SysMenuDTO() {
    }

}
