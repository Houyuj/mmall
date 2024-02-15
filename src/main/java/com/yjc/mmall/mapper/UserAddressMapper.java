package com.yjc.mmall.mapper;

import com.yjc.mmall.entity.UserAddress;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author admin
 * @since 2024-02-02
 */
public interface UserAddressMapper extends BaseMapper<UserAddress> {
    public int setDefault(Integer id);
}
