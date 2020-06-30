package com.hukun.library.mapper;

import com.hukun.library.model.Reader;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReaderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Reader record);

    int insertSelective(Reader record);

    Reader selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Reader record);

    int updateByPrimaryKey(Reader record);

    List<Reader> getAllReaderByPage(@Param("page") Integer page, @Param("size") Integer size,
                                    @Param("keyword") String keyword);

    Long getTotal(@Param("keyword") String keyword);

    Integer deleteReaders(@Param("ids") Integer[] ids);
}