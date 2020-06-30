package com.hukun.library.controller;

import com.hukun.library.model.RespBean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @aouthor hukun
 * @date 2020/4/22 20:45
 * dascription
 */
@RestController
public class LoginController {

    @GetMapping("/login")
    public RespBean login(){
        return RespBean.error("尚未登录，请登录!");
    }
}
