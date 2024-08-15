package org.big.board.dto;

import java.util.Date;

import lombok.Data;

@Data
public class QnaDto {
    private int qboardidx;
    private String qtitle;
    private String qcontent;
    private int qhitcnt;
    private Date qcreateddatetime;
    private String qcreatorid;
    private Date qupdateddatetime;
    private String qupdatorid;
}