package com.yjc.mmall.service.impl;

import com.yjc.mmall.entity.Product;
import com.yjc.mmall.mapper.ProductMapper;
import com.yjc.mmall.service.ProductService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author admin
 * @since 2024-02-02
 */
@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {

}
