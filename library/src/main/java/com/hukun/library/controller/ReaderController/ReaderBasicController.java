package com.hukun.library.controller.ReaderController;

import com.hukun.library.model.Reader;
import com.hukun.library.model.RespBean;
import com.hukun.library.model.RespPageBean;
import com.hukun.library.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @aouthor hukun
 * @date 2020/6/25 09:52
 * dascription
 */
@RestController
@RequestMapping("/reader/basic")
public class ReaderBasicController {

    @Autowired
    ReaderService readService;

    @GetMapping("/")
    public RespPageBean getAllReaderByPage(@RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue =
            "10") Integer size,String keyword){
        return readService.getAllReaderByPage(page,size,keyword);
    }

    @PostMapping("/")
    public RespBean addReader(@RequestBody Reader reader){
        if ((readService.addReader(reader))==1){
            return RespBean.ok("添加成功！");
        }
        return RespBean.error("添加失败");
    }

    @PutMapping("/")
    public RespBean updateReader(@RequestBody Reader reader){
        if ((readService.updateReader(reader))==1){
            return RespBean.ok("更新成功！");
        }
        return RespBean.error("更新失败！");
    }

    @DeleteMapping("/{id}")
    public RespBean deleteReader(@PathVariable Integer id){
        if ((readService.deleteReader(id))==1){
            return RespBean.ok("删除成功！");
        }
        return RespBean.error("删除失败！");
    }

    @DeleteMapping("/")
    public RespBean deleteReaders(Integer[] ids){
        if ((readService.deleteReaders(ids))==ids.length){
            return RespBean.ok("删除成功！");
        }
        return RespBean.error("删除失败！");
    }

}
