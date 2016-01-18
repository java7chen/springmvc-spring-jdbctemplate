package com.xiaochen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiaochen.repo.TestDao;

@Service
public class TestService {

    @Autowired
    private TestDao testDao;
    
    public void ind() {
        testDao.ind();
    }
}
