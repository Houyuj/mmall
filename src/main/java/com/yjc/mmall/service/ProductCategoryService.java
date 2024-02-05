package com.yjc.mmall.service;

import com.yjc.mmall.entity.ProductCategory;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yjc.mmall.vo.ProductCategoryVO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author admin
 * @since 2024-02-02
 */
public interface ProductCategoryService extends IService<ProductCategory> {
    public List<ProductCategoryVO> buildProductCategoryMenu();
}
