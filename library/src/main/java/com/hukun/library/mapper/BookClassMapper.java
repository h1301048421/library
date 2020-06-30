package com.hukun.library.mapper;

import com.hukun.library.model.BookClass;

import java.util.List;

public interface BookClassMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BookClass record);

    int insertSelective(BookClass record);

    BookClass selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BookClass record);

    int updateByPrimaryKey(BookClass record);

    List<BookClass> getAllBookClass();
}