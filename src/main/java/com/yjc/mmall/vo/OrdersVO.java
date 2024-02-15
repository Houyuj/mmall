package com.yjc.mmall.vo;

import com.yjc.mmall.entity.OrderDetail;
import lombok.Data;
import org.springframework.core.annotation.Order;

import java.util.List;

@Data
public class OrdersVO {
    private Integer id;

    private String loginName;

    private String userAddress;

    private Float cost;

    private String serialnumber;

    private List<OrderDetailVO> orderDetailVOList;
}
