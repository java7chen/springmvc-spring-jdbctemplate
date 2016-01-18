package com.xiaochen.service;

import java.util.Map;

/**
 * 统一接口地址
 * 
 * @author 小陈
 *
 */
public interface ApiService {

    public Object execute(Map<String, Object> paramMap);
}
