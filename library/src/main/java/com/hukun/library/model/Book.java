package com.hukun.library.model;

import java.math.BigDecimal;

public class Book {
    private Integer id;

    private String name;

    private String author;

    private String publish;

    private String isbn;

    private BigDecimal price;

    private Integer number;

    private Integer classId;

    private BookClass bookClass;

    private Reader readers;

    private LendInfo lendInfo;

    public LendInfo getLendInfo() {
        return lendInfo;
    }

    public void setLendInfo(LendInfo lendInfo) {
        this.lendInfo = lendInfo;
    }

    public Reader getReaders() {
        return readers;
    }

    public void setReaders(Reader readers) {
        this.readers = readers;
    }

    public BookClass getBookClass() {
        return bookClass;
    }

    public void setBookClass(BookClass bookClass) {
        this.bookClass = bookClass;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getPublish() {
        return publish;
    }

    public void setPublish(String publish) {
        this.publish = publish == null ? null : publish.trim();
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn == null ? null : isbn.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }
}