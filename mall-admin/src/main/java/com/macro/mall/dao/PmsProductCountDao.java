package com.macro.mall.dao;

import org.apache.ibatis.annotations.Mapper;

/**
 * @author hxh
 * @version 1.0.0
 * @date 2020/12/4 11:46
 */
public interface PmsProductCountDao {
    /**
     * 获取所有商品数量
     * @return 商品数量
     */
    Long getAll();
}
