package org.big.board.dto;

import java.util.Date;
import lombok.Data;

@Data
public class ReviewDto {
    private int rboardidx;
    private String rtitle;
    private String rcontent;
    private int rhitcnt;
    private Date rcreateddatetime;
    private String rcreatorid;
    private Date rupdateddatetime;
    private String rupdatorid;
}
