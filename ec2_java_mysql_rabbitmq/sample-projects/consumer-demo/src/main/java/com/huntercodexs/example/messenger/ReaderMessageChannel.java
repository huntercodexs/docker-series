package com.huntercodexs.example.messenger;

import org.springframework.cloud.stream.annotation.Input;
import org.springframework.messaging.SubscribableChannel;

public interface ReaderMessageChannel {

    String ORDERS_INPUT = "OrdersChannel";
    @Input("OrdersChannel")
    SubscribableChannel readOrder();

}
