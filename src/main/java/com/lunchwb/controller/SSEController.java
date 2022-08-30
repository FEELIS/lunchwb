package com.lunchwb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Random;

/** SSE  */
/* 테스트용 SSE - 현재 포기상태 나 안해 */ 

@Controller
public class SSEController {
    @RequestMapping(value="/push",produces="text/event-stream;charset=utf-8")
    @ResponseBody
    public String push() {
        Random r = new Random();
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return "data:Testing 1,2,3" + r.nextInt() +"";
    }
    @RequestMapping(value = "/sseTest", method = RequestMethod.GET)
    public String getSSEView () {
        return "sseTest";
    }
}