package com.hukun.library.service;

import com.hukun.library.mapper.BookClassMapper;
import com.hukun.library.model.BookClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @aouthor hukun
 * @date 2020/6/10 17:42
 * dascription
 */
@Service
public class BookClassService {
    @Autowired
    BookClassMapper bookClassMapper;

    public List<BookClass> getAllBookClass() {
        return bookClassMapper.getAllBookClass();
    }
}
