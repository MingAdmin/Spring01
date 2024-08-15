package org.big.board.dto;

import java.util.Date;

import lombok.Data;

@Data
public class EventDto {
    private int eboardidx;
    private String etitle;
    private String econtent;
    private int ehitcnt;
    private Date ecreateddatetime;
    private String ecreatorid;
    private Date eupdateddatetime;
    private String eupdatorid;
}