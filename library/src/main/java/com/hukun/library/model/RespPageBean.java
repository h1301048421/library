package com.hukun.library.model;

import java.util.List;

/**
 * @aouthor hukun
 * @date 2020/6/4 20:19
 * dascription
 */
public class RespPageBean {
    private Long total;
    private List<?> data;

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public List<?> getData() {
        return data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }
}
