package com.yjc.mmall.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.yjc.mmall.entity.Product;
import com.yjc.mmall.entity.ProductCategory;
import lombok.Data;

import java.util.List;

@Data
public class ProductCategoryVO {

    private Integer id;
    private String name;
    private Integer parentId;
    private List<ProductCategoryVO> children;
    private List<Product> productList;

    public ProductCategoryVO(ProductCategory productCategory){
        this.id = productCategory.getId();
        this.name = productCategory.getName();
        this.parentId = productCategory.getParentId();
    }
}
