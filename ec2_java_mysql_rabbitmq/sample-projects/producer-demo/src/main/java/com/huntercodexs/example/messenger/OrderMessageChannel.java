package com.huntercodexs.example.messenger;

import org.springframework.cloud.stream.annotation.Output;
import org.springframework.messaging.MessageChannel;

public interface OrderMessageChannel {

    @Output("OrdersChannel")
    MessageChannel saveOrder();

}
