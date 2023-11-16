package com.huntercodexs.example.controller;

import com.huntercodexs.example.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import net.minidev.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@ControllerAdvice
@CrossOrigin(origins = "*")
public class OrderController {

    @Autowired
    OrderService orderService;

    @GetMapping(path = "/producer-demo/api/v1/welcome")
    @ResponseBody
    public ResponseEntity<?> welcome() {
        log.info("welcome API is running by DemoController");
        return ResponseEntity.ok().body("Welcome to Application Demo");
    }

    @PostMapping(
            path = "/producer-demo/api/v1/order/create",
            consumes = {
                    MediaType.APPLICATION_JSON_VALUE,
                    MediaType.APPLICATION_FORM_URLENCODED_VALUE,
                    MediaType.MULTIPART_FORM_DATA_VALUE
            },
            produces = {
                    MediaType.APPLICATION_JSON_VALUE
            }
    )
    @ResponseBody
    public ResponseEntity<?> create(@RequestBody(required = false) JSONObject jsonDataRequest) {
        log.info("order API is running by DemoController");
        String id = orderService.save(jsonDataRequest.getAsString("order"));
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("id", id);
        jsonObject.put("result", true);
        return ResponseEntity.ok().body(jsonObject);
    }

    @GetMapping(path = "/producer-demo/api/v1/order/read/{orderId}")
    @ResponseBody
    public ResponseEntity<?> read(@PathVariable(value = "orderId", required = true) String orderId) {
        log.info("read API is running by DemoController");
        System.out.println("OrderID: "+orderId);
        return ResponseEntity.ok().body("ORDER READING "+orderId+" ...");
    }
    
}
