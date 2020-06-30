package com.hukun.library.service;

import com.hukun.library.mapper.BookMapper;
import com.hukun.library.model.Book;
import com.hukun.library.model.RespPageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @aouthor hukun
 * @date 2020/6/4 15:39
 * dascription
 */
@Service
public class BookService {
    @Autowired
    BookMapper bookMapper;
    public RespPageBean getBookByPage(Integer page, Integer size,String keyword) {
        if (page!=null && size!=null){
            page=(page-1)*size;
        }
        List<Book> data= bookMapper.getBookByPage(page,size,keyword);
        Long total=bookMapper.getTotal(keyword);
        RespPageBean bean = new RespPageBean();
        bean.setData(data);
        bean.setTotal(total);
        return bean;
    }

    public Integer addBook(Book book) {
        return bookMapper.insertSelective(book);
    }

    public Integer deleteBookById(Integer id) {
        return bookMapper.deleteByPrimaryKey(id);
    }

    public Integer deleteBookByIds(Integer[] ids) {
        return bookMapper.deleteBookByIds(ids);
    }

    public Integer updateBook(Book book) {
        return bookMapper.updateByPrimaryKeySelective(book);
    }

    public RespPageBean getAllBookRecord(Integer page,Integer size,String keyword) {
        if (page!=null && size!=null){
            page=(page-1)*size;
        }
        List<Book> data=bookMapper.getAllBookRecord(page,size,keyword);
        Long total=bookMapper.getRecordTotal(keyword);
        RespPageBean bean=new RespPageBean();
        bean.setData(data);
        bean.setTotal(total);
        return bean;
    }

    public Integer updateBookNumber(Integer id) {
        return bookMapper.updateBookNumber(id);
    }
}
