package com.huntercodexs.example;

import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
@EnableRabbit
public class Producer2DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(Producer2DemoApplication.class, args);
    }

}
