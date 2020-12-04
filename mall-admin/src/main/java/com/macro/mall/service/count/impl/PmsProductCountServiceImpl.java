package com.macro.mall.service.count.impl;

import com.macro.mall.dao.PmsProductCountDao;
import com.macro.mall.service.count.PmsProductCountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 商品统计业务实现
 *
 * @author hxh
 * @version 1.0.0
 * @date 2020/12/4 11:45
 */
@Service
public class PmsProductCountServiceImpl implements PmsProductCountService {

    @Autowired
    private PmsProductCountDao dao;

    /**
     * 获取所有商品数量
     * @return
     */
    @Override
    public Long getAll() {
        Long all = dao.getAll();
        return all;
    }
}
