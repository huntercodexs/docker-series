package com.huntercodexs.dto;

import lombok.*;

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
    String bornDate;
    String purchaseDate;
    String contractNumber;
}
