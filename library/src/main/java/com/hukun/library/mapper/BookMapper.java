package com.hukun.library.mapper;

import com.hukun.library.model.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Book record);

    int insertSelective(Book record);

    Book selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);

    List<Book> getBookByPage(@Param("page") Integer page, @Param("size") Integer size,@Param("keyword") String keyword);

    Long getTotal(String keyword);

    Integer deleteBookByIds(@Param("ids") Integer[] ids);

    List<Book> getAllBookRecord(@Param("page") Integer page,@Param("size") Integer size,
                                @Param("keyword") String keyword);

    Long getRecordTotal(String keyword);

    Integer updateBookNumber(@Param("id") Integer id);
}