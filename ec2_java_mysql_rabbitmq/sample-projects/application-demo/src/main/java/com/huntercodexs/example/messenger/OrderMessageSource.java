package com.huntercodexs.example.messenger;

import org.springframework.cloud.stream.annotation.Output;
import org.springframework.messaging.MessageChannel;

public interface OrderMessageSource {

    @Output("OrdersChannel")
    MessageChannel saveOrder();

}