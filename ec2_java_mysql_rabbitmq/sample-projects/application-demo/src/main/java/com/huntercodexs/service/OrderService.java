package com.huntercodexs.service;

import com.huntercodexs.messenger.OrderDto;
import com.huntercodexs.messenger.OrderMessageSource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Slf4j
@Service
public class OrderService {

	@Autowired
	OrderMessageSource demoMessageSource;

	public String save(String order) {
		String id = UUID.randomUUID().toString();
		OrderDto orderDto = new OrderDto();
		orderDto.setId(id);
		orderDto.setOrder(order);
		orderDto.setMessage("Save order sucessful");
		orderDto.setResult("ok");
		demoMessageSource.saveOrder().send(MessageBuilder.withPayload(orderDto).build());
		log.info("SAVE ORDER SUCCESSFUL " + id);
		return id;
	}

}
