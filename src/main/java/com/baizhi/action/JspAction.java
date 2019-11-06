package com.baizhi.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/first")
public class JspAction {

    @RequestMapping("/jsp")
    public String jap() throws  Exception{
        System.out.println("jsp");
        return "index";
    }
}
