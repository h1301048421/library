package com.hukun.library.controller;

import com.hukun.library.model.Menu;
import com.hukun.library.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @aouthor hukun
 * @date 2020/4/29 11:40
 * dascription
 */
@RestController
@RequestMapping("/system/config")
public class SystemConfigController {
    @Autowired
    MenuService menuService;

    @GetMapping("/menu")
    public List<Menu> getMenuById(){
        return menuService.getMenuById();
    }

}
