package com.example.microservices.admin.dto;

import com.example.microservices.admin.entity.SysMenu;
import com.example.microservices.admin.entity.SysRole;
import lombok.Data;

import java.util.List;

@Data
public class SysMenuDTO extends SysMenu {

    //    public SysMenuDTO(SysMenu menu) {
//        super(menu);
//    }
    private List<SysRole> roles;
    public SysMenuDTO() {
    }

    private String parentTitle;
    private Integer childNum;

}
