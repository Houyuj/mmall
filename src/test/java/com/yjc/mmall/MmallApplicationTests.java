package com.yjc.mmall;

import com.yjc.mmall.service.ProductCategoryService;
import com.yjc.mmall.vo.ProductCategoryVO;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class MmallApplicationTests {

    @Autowired
    private ProductCategoryService service;
    @Test
    void contextLoads() {
        List<ProductCategoryVO> productCategoryVOList = this.service.buildProductCategoryMenu();
        int i = 0;
    }

}
