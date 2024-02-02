package com.yjc.mmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RedirectController {
    @GetMapping("/{url}")
    public String redirect(@PathVariable("url") String url){
        return url;
    }

    @GetMapping("/")
    public String main(){
        return "redirect:/main";
    }

    @GetMapping("favicon.ico")
    @ResponseBody
    void returnNoFavicon() {
    }
}
