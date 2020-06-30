package com.hukun.library.mapper;

import com.hukun.library.model.LendInfo;

public interface LendInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LendInfo record);

    int insertSelective(LendInfo record);

    LendInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LendInfo record);

    int updateByPrimaryKey(LendInfo record);

    Integer updateRecordIsBack(Integer id);
}