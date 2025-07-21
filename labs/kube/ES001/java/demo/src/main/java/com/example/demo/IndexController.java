package com.example.demo;

import org.springframework.web.bind.annottaion.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class IndexController {  

    @RequestMapping(value = "/")
    public String index() {
        return "Hello, World!";
    }

}

