package com.huntercodexs.example.messenger;

import com.google.gson.Gson;
import com.huntercodexs.example.dto.OrderDTO;
import com.huntercodexs.example.model.OrderEntity;
import com.huntercodexs.example.repository.OrderRepository;
import org.springframework.amqp.rabbit.annotation.Exchange;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.QueueBinding;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Component;

@Component
public class RabbitMQConsumer {

	@Autowired
	OrderRepository orderRepository;

	@RabbitListener(
			bindings = @QueueBinding(
					exchange = @Exchange("exchange-com-direct"),
					key = "routingKey-purchase",
					value = @Queue("queue-purchase")))
	public void consumerExchangeComQueuePurchase(@Payload String jsonMessage) {
		System.out.println("Message from ExchangeComDirect->QueuePurchase: " + jsonMessage);
		Gson gson = new Gson();
		OrderDTO orderDTO = gson.fromJson(jsonMessage, OrderDTO.class);
		System.out.println("Purchase DTO [Purchase]: " + orderDTO);

		OrderEntity orderEntity = new OrderEntity();
		orderEntity.setPurchaseId(orderDTO.getId());
		orderEntity.setStatus(orderDTO.getStatus());
		orderEntity.setValue(orderDTO.getValue());
		orderEntity.setDatetime(orderDTO.getDatetime());
		orderRepository.save(orderEntity);

		System.out.println("[PURCHASE] Order saved successfully");
	}

	@RabbitListener(
			bindings = @QueueBinding(
					exchange = @Exchange("exchange-com-direct"),
					key = "routingKey-order",
					value = @Queue("queue-order")))
	public void consumerExchangeComQueueOrder(@Payload String jsonMessage) {
        System.out.println("Message from ExchangeComDirect->QueueOrder: " + jsonMessage);
        Gson gson = new Gson();
        OrderDTO orderDTO = gson.fromJson(jsonMessage, OrderDTO.class);
        System.out.println("Purchase DTO [Order]: " + orderDTO);

        OrderEntity orderEntity = orderRepository.findByPurchaseId(orderDTO.getId());

		if (orderEntity == null) {
			System.out.println("Not Found");
			return;
		}

        orderEntity.setStatus(orderDTO.getStatus());
        orderRepository.save(orderEntity);

        System.out.println("[ORDER] Order updated successfully");
    }

	@RabbitListener(
			bindings = @QueueBinding(
					exchange = @Exchange("exchange-com-direct"),
					key = "routingKey-dispatch",
					value = @Queue("queue-dispatch")))
	public void consumerExchangeComQueueDispatch(@Payload String jsonMessage) {
		System.out.println("Message from ExchangeComDirect->QueueDispatch: " + jsonMessage);
		Gson gson = new Gson();
		OrderDTO orderDTO = gson.fromJson(jsonMessage, OrderDTO.class);
		System.out.println("Purchase DTO [Dispatch]: " + orderDTO);

		OrderEntity orderEntity = orderRepository.findByPurchaseId(orderDTO.getId());

		if (orderEntity == null) {
			System.out.println("Not Found");
			return;
		}

		orderEntity.setStatus(orderDTO.getStatus());
		orderRepository.save(orderEntity);

		System.out.println("[DISPATCH] Order updated successfully");
	}

}
