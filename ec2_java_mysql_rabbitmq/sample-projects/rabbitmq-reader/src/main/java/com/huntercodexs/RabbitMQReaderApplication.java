package com.huntercodexs;

import com.huntercodexs.messenger.ReaderMessageSource;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.stream.annotation.EnableBinding;

@SpringBootApplication
@EnableDiscoveryClient
@EnableBinding({ReaderMessageSource.class})
public class RabbitMQReaderApplication {

    public static void main(String[] args) {
        SpringApplication.run(RabbitMQReaderApplication.class, args);
    }

}
