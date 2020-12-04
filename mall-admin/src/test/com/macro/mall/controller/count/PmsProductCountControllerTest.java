package com.macro.mall.controller.count;

import com.macro.mall.common.api.CommonResult;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;
@SpringBootTest
@RunWith(SpringRunner.class)
public class PmsProductCountControllerTest {

    @Autowired
    private PmsProductCountController countController;

    @Test
    public void getAllCount() {

        CommonResult<Long> allCount = countController.getAllCount();
        Assert.assertNotNull(allCount);
    }
}