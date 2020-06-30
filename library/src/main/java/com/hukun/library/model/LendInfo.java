package com.hukun.library.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class LendInfo {
    private Integer id;

    private Integer bId;

    private Integer rId;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date lendDate;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date backDate;

    private Boolean isback;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getbId() {
        return bId;
    }

    public void setbId(Integer bId) {
        this.bId = bId;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }

    public Date getLendDate() {
        return lendDate;
    }

    public void setLendDate(Date lendDate) {
        this.lendDate = lendDate;
    }

    public Date getBackDate() {
        return backDate;
    }

    public void setBackDate(Date backDate) {
        this.backDate = backDate;
    }

    public Boolean getIsback() {
        return isback;
    }

    public void setIsback(Boolean isback) {
        this.isback = isback;
    }
}