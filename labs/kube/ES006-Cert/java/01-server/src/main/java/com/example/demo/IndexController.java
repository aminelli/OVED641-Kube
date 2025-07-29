package com.example.demo;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@RestController
public class IndexController {  

    @RequestMapping(value = "/")
    public String index() {
        return "Server Test !";
    }

    @RequestMapping(value = "/hello")
    public String hello() {
        return "Hello, World !";
    }

    @RequestMapping(value = "/health")
    public String health() {
        return "Ping success !";
    }

    @GetMapping("/test")
    public Map<String, Object> test() {
        Map<String, Object> response = new HashMap<>();
        response.put("message", "Hello from secure API !");
        response.put("timestamp", LocalDateTime.now().toString());
        response.put("status", "success");
        return response;
    }
    
   


}

