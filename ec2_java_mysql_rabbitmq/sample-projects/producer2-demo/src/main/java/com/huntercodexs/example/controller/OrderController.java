package com.huntercodexs.example.controller;

import lombok.extern.slf4j.Slf4j;
import net.minidev.json.JSONObject;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@Slf4j
@RestController
@ControllerAdvice
@CrossOrigin(origins = "*")
public class OrderController {

    private final AmqpTemplate amqpTemplate;

    public OrderController(AmqpTemplate queueSender) {
        this.amqpTemplate = queueSender;
    }

    @GetMapping("/producer2-demo/api/v1/purchase")
    public String purchase() {
        String id = String.valueOf(UUID.randomUUID());

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("id", id);
        jsonObject.put("status", "CREATED");
        jsonObject.put("value", "$ 100,00");
        jsonObject.put("datetime", "2020-10-02 10:00:12");

        amqpTemplate.convertAndSend("exchange-com-direct", "routingKey-purchase", jsonObject.toJSONString());
        return "purchase: " + id;
    }

    @GetMapping("/producer2-demo/api/v1/order/{purchase_id}")
    public String order(@PathVariable("purchase_id") String purchaseId) {

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("id", purchaseId);
        jsonObject.put("status", "PROCESSING");

        amqpTemplate.convertAndSend("exchange-com-direct", "routingKey-order", jsonObject.toJSONString());
        return "status: PROCESSING";
    }

    @GetMapping("/producer2-demo/api/v1/dispatch/{purchase_id}")
    public String dispatch(@PathVariable("purchase_id") String purchaseId) {

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("id", purchaseId);
        jsonObject.put("status", "FINISHED");

        amqpTemplate.convertAndSend("exchange-com-direct", "routingKey-dispatch", jsonObject.toJSONString());
        return "status: FINISHED";
    }

}
