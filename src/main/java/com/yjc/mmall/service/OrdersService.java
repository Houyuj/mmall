package com.yjc.mmall.service;

import com.yjc.mmall.entity.Orders;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yjc.mmall.vo.OrdersVO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author admin
 * @since 2024-02-02
 */
public interface OrdersService extends IService<Orders> {
    public List<OrdersVO> findAllByUserId(Integer id);
}
