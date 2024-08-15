package org.big.board.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CourseDto {
    private int cno;
    private String cname;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date cstart;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date cend;
    private String ctime;
    private String cclassroom;
    private String cprice;
    private String cperiod;
}