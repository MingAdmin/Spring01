package org.big.board.dto;

import lombok.Data;

@Data
public class BoardFileDto {
	
	private int nidx;
	private int nboardidx;
	private String noriginalfilename;
	private String nstoredfilepath;
	private long nfilesize;
}