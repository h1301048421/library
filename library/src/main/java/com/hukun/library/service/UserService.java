package com.hukun.library.service;

import com.hukun.library.mapper.UserMapper;
import com.hukun.library.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * @aouthor hukun
 * @date 2020/4/22 11:17
 * dascription
 */
@Service
public class UserService implements UserDetailsService {

    @Autowired
    UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user=userMapper.loadUserByUsername(username);
        if (user==null){
            throw new UsernameNotFoundException("用户不存在！");
        }
        user.setRoles(userMapper.getUserRolesById(user.getId()));
        return user;
    }
}
