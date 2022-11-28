package com.hanssem.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HeaderTestController {
    @RequestMapping("/header")
    public String header() {
        return "header";
    }
}
