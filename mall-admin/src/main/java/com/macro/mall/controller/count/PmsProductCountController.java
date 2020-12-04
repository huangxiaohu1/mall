package com.macro.mall.controller.count;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.service.count.PmsProductCountService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.lang.reflect.Method;

/**
 * 商品统计
 *
 * @author hxh
 * @version 1.0.0
 * @date 2020/12/4 11:28
 */
@Controller
@RequestMapping("/count/product")
@Api(tags = "PmsProductCountController", description = "商品数量")
public class PmsProductCountController {

    @Autowired
    private PmsProductCountService service;

    /**
     * 获取所有商品数量
     */
    @ApiOperation("获取全部商品数量")
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<Long> getAllCount() {
        Long all = service.getAll();
        return CommonResult.success(all);
    }
}
