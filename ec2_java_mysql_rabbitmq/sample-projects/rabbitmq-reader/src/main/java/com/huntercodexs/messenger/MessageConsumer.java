package com.huntercodexs.messenger;

import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class MessageConsumer {
	
	@StreamListener(target = ReaderMessageSource.ORDERS_INPUT)
	public void processOrdersChannel(OrderDto orderDto) {
		log.info("Reading Order: " + orderDto.getId());
	}
	
}
