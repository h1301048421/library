package com.hukun.library.controller.BookController;

import com.hukun.library.model.*;
import com.hukun.library.service.BookClassService;
import com.hukun.library.service.BookService;
import com.hukun.library.service.LendInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @aouthor hukun
 * @date 2020/6/4 20:17
 * dascription
 */
@RestController
@RequestMapping("/book/basic")
public class  BookBasicController {

    @Autowired
    BookService bookService;

    @Autowired
    BookClassService bookClassService;

    @Autowired
    LendInfoService lendInfoService;

    @GetMapping("/")
    public RespPageBean getBookByPage(@RequestParam(defaultValue = "1") Integer page,
                                      @RequestParam(defaultValue = "10") Integer size,String keyword){
        return bookService.getBookByPage(page,size,keyword);
    }

    @PostMapping("/")
    public RespBean addBook(@RequestBody Book book){
        if ((bookService.addBook(book))==1){
            return RespBean.ok("添加成功！");
        }
        return RespBean.error("添加失败！");
    }

    @GetMapping("/bookclass")
    public List<BookClass> getAllBookClass(){
        return bookClassService.getAllBookClass();
    }

    @DeleteMapping("/{id}")
    public RespBean deleteBookById(@PathVariable Integer id){
        if (bookService.deleteBookById(id)==1){
          return RespBean.ok("删除成功！");
        }
        return RespBean.error("删除失败！");
    }

    @DeleteMapping("/")
    public RespBean deleteBookByIds(Integer[] ids){
        if (bookService.deleteBookByIds(ids)==ids.length){
            return RespBean.ok("删除成功！");
        }
        return RespBean.error("删除失败！");
    }

    @PutMapping("/")
    public RespBean updateBook(@RequestBody Book book){
        if (bookService.updateBook(book)==1){
            return RespBean.ok("更新成功！");
        }
        return RespBean.error("更新失败！");
    }

    @PostMapping("/lendinfo")
    public RespBean addLendInfo(@RequestBody LendInfo lendInfo){
        Integer id=lendInfo.getbId();
        if ((lendInfoService.addLenInfo(lendInfo))==1 && (bookService.updateBookNumber(id))==1){
            return RespBean.ok("借阅成功！");
        }
        return RespBean.error("借阅失败！");
    }


}
