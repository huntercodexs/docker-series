package com.huntercodexs.example;

import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
@EnableRabbit
public class Consumer2DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(Consumer2DemoApplication.class, args);
    }

}
