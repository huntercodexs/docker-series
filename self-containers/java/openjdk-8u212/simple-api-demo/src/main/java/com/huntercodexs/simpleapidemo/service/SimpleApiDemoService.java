package com.huntercodexs.simpleapidemo.service;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public class SimpleApiDemoService {

    public ResponseEntity<?> service() {
        return ResponseEntity.ok().body("OK, it is working fine !");
    }
}
