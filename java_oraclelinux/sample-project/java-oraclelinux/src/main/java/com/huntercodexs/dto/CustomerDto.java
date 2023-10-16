package com.huntercodexs.dto;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class CustomerDto {
    String id;
    int personType;
    String name;
    String identification;
    Date bornDate;
    Date purchaseDate;
    String contractNumber;
}
