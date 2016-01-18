package com.xiaochen.repo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TestDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Map<String, Object>> ind() {
        String sql = "select * from user";
        List<Map<String, Object>> resMaps = jdbcTemplate.queryForList(sql);
        return resMaps;
    }
}
