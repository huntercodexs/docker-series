package com.huntercodexs.simpleapidemo.controller;

import com.huntercodexs.simpleapidemo.service.SimpleApiDemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@ControllerAdvice
@CrossOrigin(origins = "*")
@RequestMapping("${api.prefix}")
public class SimpleAPiDemoController {

    @Autowired
    SimpleApiDemoService simpleApiDemoService;

    @GetMapping(path = "/simple-api-demo")
    public ResponseEntity<?> controller() {
        return simpleApiDemoService.service();
    }
}
