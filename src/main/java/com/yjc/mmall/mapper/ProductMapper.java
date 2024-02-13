package com.yjc.mmall.mapper;

import com.yjc.mmall.entity.Product;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author admin
 * @since 2024-02-02
 */
public interface ProductMapper extends BaseMapper<Product> {
    public Integer updateStockById(Integer id, Integer stock);
    public Integer getStockById(Integer id);
}
