package com.huntercodexs.example.controller;

import com.huntercodexs.example.model.OrderEntity;
import com.huntercodexs.example.repository.OrderRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@ControllerAdvice
@CrossOrigin(origins = "*")
public class OrderController {

    @Autowired
    OrderRepository orderRepository;

    @GetMapping("/consumer2-demo/api/v1/order/status/{purchase_id}")
    public String status(@PathVariable("purchase_id") String purchaseId) {
        System.out.println("Purchase: " + purchaseId);

        OrderEntity result = orderRepository.findByPurchaseId(purchaseId);

        if (result == null) return "Not Found !";

        if (result.getStatus().equals("FINISHED")) {
            return "status: FINISHED, tracking: http://localhost:8765/tracking/order/"+purchaseId;
        }

        return "status: " + result.getStatus();
    }

}
