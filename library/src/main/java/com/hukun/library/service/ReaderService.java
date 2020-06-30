package com.hukun.library.service;

import com.hukun.library.mapper.ReaderMapper;
import com.hukun.library.model.Reader;
import com.hukun.library.model.RespBean;
import com.hukun.library.model.RespPageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @aouthor hukun
 * @date 2020/6/25 09:43
 * dascription
 */
@Service
public class ReaderService {

    @Autowired
    ReaderMapper readerMapper;

    public RespPageBean getAllReaderByPage(Integer page, Integer size, String keyword) {
        if (page!=null && size!=null){
            page=(page-1)*size;
        }
        List<Reader> readers=readerMapper.getAllReaderByPage(page,size,keyword);
        Long total=readerMapper.getTotal(keyword);
        RespPageBean bean=new RespPageBean();
        bean.setData(readers);
        bean.setTotal(total);
        return bean;
    }

    public Integer addReader(Reader reader) {
        return readerMapper.insertSelective(reader);
    }

    public Integer updateReader(Reader reader) {
        return readerMapper.updateByPrimaryKeySelective(reader);
    }

    public Integer deleteReader(Integer id) {
        return readerMapper.deleteByPrimaryKey(id);
    }

    public Integer deleteReaders(Integer[] ids) {
        return readerMapper.deleteReaders(ids);
    }
}
