package com.huntercodexs.example.dto;

import lombok.*;

@Setter
@Getter
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class OrderDTO {
    String id;
    String status;
    String value;
    String datetime;
}
