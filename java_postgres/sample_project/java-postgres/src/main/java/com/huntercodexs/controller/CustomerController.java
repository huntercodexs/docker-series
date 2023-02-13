package com.huntercodexs.controller;

import com.huntercodexs.dto.CustomerDto;
import com.huntercodexs.model.CustomerEntity;
import com.huntercodexs.repository.CustomerRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@CrossOrigin(origins = "*")
@RequestMapping("${api.prefix}")
public class CustomerController {

    @Autowired
    CustomerRepository customerRepository;

    @PostMapping("/customers")
    @ResponseBody
    public ResponseEntity<?> create(@RequestBody CustomerDto customerDto) {
        CustomerEntity customerEntity = new CustomerEntity();
        customerEntity.setName(customerDto.getName());
        customerEntity.setEmail(customerDto.getEmail());
        customerEntity.setAge(customerDto.getAge());
        customerRepository.save(customerEntity);
        return ResponseEntity.ok().body("ok");
    }

    @GetMapping("/customers")
    @ResponseBody
    public ResponseEntity<List<CustomerEntity>> all() {
        List<CustomerEntity> listCustomers = customerRepository.findAll();
        return ResponseEntity.ok().body(listCustomers);
    }

}
