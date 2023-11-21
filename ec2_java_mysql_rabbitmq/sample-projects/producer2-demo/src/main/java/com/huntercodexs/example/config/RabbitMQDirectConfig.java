package com.huntercodexs.example.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RabbitMQDirectConfig {

    @Bean
    DirectExchange directExchange() {
        return new DirectExchange("exchange-com-direct");
    }

    @Bean
    public Queue queuePurchase() {
        return new Queue("queue-purchase", true);
    }

    @Bean
    public Queue queueOrder() {
        return new Queue("queue-order", true);
    }

    @Bean
    public Queue queueDispatch() {
        return new Queue("queue-dispatch", true);
    }

    @Bean
    Binding bindingPurchase(Queue queuePurchase, DirectExchange directExchange) {
        return BindingBuilder
                .bind(queuePurchase)
                .to(directExchange)
                .with("routingKey-purchase");
    }

    @Bean
    Binding bindingOrder(Queue queueOrder, DirectExchange directExchange) {
        return BindingBuilder
                .bind(queueOrder)
                .to(directExchange)
                .with("routingKey-order");
    }

    @Bean
    Binding bindingDispatch(Queue queueDispatch, DirectExchange directExchange) {
        return BindingBuilder
                .bind(queueDispatch)
                .to(directExchange)
                .with("routingKey-dispatch");
    }

}
