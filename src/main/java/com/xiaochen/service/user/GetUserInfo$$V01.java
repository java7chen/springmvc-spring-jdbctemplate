package com.xiaochen.service.user;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.xiaochen.service.ApiService;

/**
 * 获取用户信息
 * 
 * @author 小陈
 *
 */
@Service("user$$getUserInfo$$V01")
public class GetUserInfo$$V01 implements ApiService {

    @Override
    public Object execute(Map<String, Object> paramMap) {
        System.out.println("====");
        return null;
    }

}
