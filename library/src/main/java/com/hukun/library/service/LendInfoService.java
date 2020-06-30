package com.hukun.library.service;

import com.hukun.library.mapper.LendInfoMapper;
import com.hukun.library.model.LendInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @aouthor hukun
 * @date 2020/6/29 16:17
 * dascription
 */
@Service
public class LendInfoService {

    @Autowired
    LendInfoMapper lendInfoMapper;


    public Integer addLenInfo(LendInfo lendInfo) {
        return lendInfoMapper.insertSelective(lendInfo);
    }

    public Integer updateRecordIsBack(Integer id) {
        return lendInfoMapper.updateRecordIsBack(id);
    }
}
