package org.big.board.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardDto {
	private int nboardidx;                             
	private String ntitle;                                   
	private String ncontent;                                  
	private int nhitcnt;
	private Date ncreateddatetime;
	private String ncreatorid;
	private Date nupdateddatetime;              
	private String nupdatorid; 
	private List<BoardFileDto> nfileList;
}