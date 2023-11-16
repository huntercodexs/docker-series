package com.huntercodexs.example;

import com.huntercodexs.example.messenger.OrderMessageChannel;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.stream.annotation.EnableBinding;

@SpringBootApplication
@EnableDiscoveryClient
@EnableBinding({OrderMessageChannel.class})
public class ProducerDemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(ProducerDemoApplication.class, args);
    }

}
