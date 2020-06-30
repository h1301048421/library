package com.hukun.library.config;

import com.hukun.library.model.Menu;
import com.hukun.library.model.Role;
import com.hukun.library.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;

import java.util.Collection;
import java.util.List;

/**
 * @aouthor hukun
 * @date 2020/5/9 20:09
 * dascription
 */
@Component
public class MyFilter implements FilterInvocationSecurityMetadataSource {
    @Autowired
    MenuService menuService;

    AntPathMatcher antPathMatcher=new AntPathMatcher();

    @Override
    public Collection<ConfigAttribute> getAttributes(Object o) throws IllegalArgumentException {
        String requestUrl=((FilterInvocation)o).getRequestUrl();
        List<Menu> menus = menuService.getAllMenuWithRole();
        for (Menu menu : menus) {
            if (antPathMatcher.match(menu.getUrl(),requestUrl)){
                List<Role> roles = menu.getRoles();
                String[] str=new String[roles.size()];
                for (int i = 0; i < roles.size(); i++) {
                    str[i]=roles.get(i).getName();
                }
                return SecurityConfig.createList(str);
            }
        }
        return SecurityConfig.createList("ROLE_LOGIN");
    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return false;
    }
}
