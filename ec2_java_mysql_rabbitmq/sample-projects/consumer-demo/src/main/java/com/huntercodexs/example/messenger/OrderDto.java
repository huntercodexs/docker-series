package com.huntercodexs.example.messenger;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class OrderDto {
	String id;
	String order;
	String message;
	String result;
}
