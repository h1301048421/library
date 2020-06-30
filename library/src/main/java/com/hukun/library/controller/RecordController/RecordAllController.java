package com.hukun.library.controller.RecordController;

import com.hukun.library.model.LendInfo;
import com.hukun.library.model.RespBean;
import com.hukun.library.model.RespPageBean;
import com.hukun.library.service.BookService;
import com.hukun.library.service.LendInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


/**
 * @aouthor hukun
 * @date 2020/6/25 09:46
 * dascription
 */
@RestController
@RequestMapping("/record/all")
public class RecordAllController {

    @Autowired
    BookService bookService;

    @Autowired
    LendInfoService lendInfoService;

    @GetMapping("/")
    public RespPageBean getAllBookRecord(@RequestParam(defaultValue = "1") Integer page,
                                         @RequestParam(defaultValue = "10") Integer size,
                                         String keyword){
        return bookService.getAllBookRecord(page,size,keyword);
    }

    @PutMapping("/")
    public RespBean updateRecordIsBack(@RequestBody LendInfo lendInfo){
        if ((lendInfoService.updateRecordIsBack(lendInfo.getId()))==1){
            return RespBean.ok("还书成功！");
        }
        return RespBean.error("还书失败！");
    }
}
