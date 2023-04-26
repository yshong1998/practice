package com.example.practice.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;

@RestController
@RequiredArgsConstructor
public class TestController {

    private final Environment env;

    @GetMapping("test/port")
    public String checkServerPort(){
        return Arrays.stream(env.getActiveProfiles()).findFirst().orElse("");
    }

}
