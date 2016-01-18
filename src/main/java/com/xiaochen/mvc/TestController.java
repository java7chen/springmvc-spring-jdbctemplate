package com.xiaochen.mvc;

import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xiaochen.service.ApiService;
import com.xiaochen.service.TestService;
import com.xiaochen.util.SpringContextUtil;

@Controller
@RequestMapping("/test")
public class TestController {

    @Autowired
    private TestService testService;

    @RequestMapping(value = "/ind")
    public String ind(Model model) {
        Map<String, ApiService> apiServiceMap = SpringContextUtil.getCtx()
                .getBeansOfType(ApiService.class);
        Set<String> apiServiceSet = apiServiceMap.keySet();
        model.addAttribute("apiServiceSet", apiServiceSet);
        return "test/idx";
    }
}
