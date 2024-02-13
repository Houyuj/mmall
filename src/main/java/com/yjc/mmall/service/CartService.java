package com.yjc.mmall.service;

import com.yjc.mmall.entity.Cart;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author admin
 * @since 2024-02-02
 */
public interface CartService extends IService<Cart> {
    public Boolean add(Cart cart);
}
