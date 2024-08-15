package org.big.board.dto;

import lombok.Data;

@Data
public class OrderDto {
    private int orderNo; // 주문 번호
    private int studentId; // 학생 번호
    private int cno; // 수강 번호
    private String status; // 주문 상태
    private int mno;
}