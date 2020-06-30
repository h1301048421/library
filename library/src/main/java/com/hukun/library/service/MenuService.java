package com.hukun.library.service;

import com.hukun.library.mapper.MenuMapper;
import com.hukun.library.model.Menu;
import com.hukun.library.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @aouthor hukun
 * @date 2020/4/29 11:40
 * dascription
 */
@Service
public class MenuService {
    @Autowired
    MenuMapper menuMapper;

    public List<Menu> getMenuById() {
        //数据由内存中存储的用户信息不能使用前端传过来的id 将其强转成User对象
        return menuMapper.getMenuById(((User)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId());
    }

    public List<Menu> getAllMenuWithRole() {
        return menuMapper.getAllMenuWithRole();
    }
}
