package com.yjc.mmall.service;

import com.yjc.mmall.entity.Cart;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yjc.mmall.entity.Orders;
import com.yjc.mmall.entity.User;
import com.yjc.mmall.vo.CartVO;

import java.util.List;

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
    public List<CartVO> findVOListByUserId(Integer userId);
    public Boolean update(Integer id,Integer quantity,Float cost);
    public Boolean delete(Integer id);
    public Orders commit(String userAddress, String address, String remark, User user);
}
