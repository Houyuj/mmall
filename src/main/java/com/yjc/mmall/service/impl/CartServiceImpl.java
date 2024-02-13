package com.yjc.mmall.service.impl;

import com.yjc.mmall.entity.Cart;
import com.yjc.mmall.exception.MMallException;
import com.yjc.mmall.mapper.CartMapper;
import com.yjc.mmall.mapper.ProductMapper;
import com.yjc.mmall.result.ResponseEnum;
import com.yjc.mmall.service.CartService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author admin
 * @since 2024-02-02
 */
@Service
@Slf4j
public class CartServiceImpl extends ServiceImpl<CartMapper, Cart> implements CartService {

    @Autowired
    private CartMapper cartMapper;
    @Autowired
    private ProductMapper productMapper;
    @Override
    @Transactional
    public Boolean add(Cart cart) {
        //添加购物车
        int insert = this.cartMapper.insert(cart);
        if(insert != 1){
            log.info("【添加购物车】添加失败");
            throw new MMallException(ResponseEnum.CART_ADD_ERROR);
        }
        //商品减库存
        Integer stock = this.productMapper.getStockById(cart.getProductId());
        if(stock == null){
            log.info("【添加购物车】商品不存在");
            throw new MMallException(ResponseEnum.PRODUCT_NOT_EXISTS);
        }
        if(stock == 0){
            log.info("【添加购物车】库存不足");
            throw new MMallException(ResponseEnum.PRODUCT_STOCK_ERROR);
        }
        Integer newStock = stock - cart.getQuantity();
        if(newStock < 0){
            log.info("【添加购物车】库存不足");
            throw new MMallException(ResponseEnum.PRODUCT_STOCK_ERROR);
        }
        this.productMapper.updateStockById(cart.getProductId(),newStock);
        return true;
    }
}
