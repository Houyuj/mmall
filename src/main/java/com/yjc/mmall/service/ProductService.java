package com.yjc.mmall.service;

import com.yjc.mmall.entity.Product;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author admin
 * @since 2024-02-02
 */
public interface ProductService extends IService<Product> {
    public List<Product> findAllByTypeAndProductCategoryId(Integer type, Integer id);

}
