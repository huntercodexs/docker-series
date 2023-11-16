package com.huntercodexs.example.service;

import com.huntercodexs.example.messenger.OrderDto;
import com.huntercodexs.example.messenger.OrderMessageChannel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Slf4j
@Service
public class OrderService {

	@Autowired
	OrderMessageChannel orderMessageChannel;

	public String save(String order) {
		String id = UUID.randomUUID().toString();
		OrderDto orderDto = new OrderDto();
		orderDto.setId(id);
		orderDto.setOrder(order);
		orderDto.setMessage("Save order successful");
		orderDto.setResult("ok");
		Message<OrderDto> payload = MessageBuilder.withPayload(orderDto).build();
		log.info("PAYLOAD: " + payload);
		orderMessageChannel.saveOrder().send(payload);
		log.info("SAVE ORDER SUCCESSFUL " + id);
		return id;
	}

}
