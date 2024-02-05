package com.yjc.mmall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yjc.mmall.entity.Product;
import com.yjc.mmall.entity.ProductCategory;
import com.yjc.mmall.mapper.ProductCategoryMapper;
import com.yjc.mmall.mapper.ProductMapper;
import com.yjc.mmall.service.ProductCategoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yjc.mmall.vo.ProductCategoryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author admin
 * @since 2024-02-02
 */
@Service
public class ProductCategoryServiceImpl extends ServiceImpl<ProductCategoryMapper, ProductCategory> implements ProductCategoryService {

    @Autowired
    private ProductCategoryMapper productCategoryMapper;
    @Autowired
    private ProductMapper productMapper;

    /**
     * 构建商品分类菜单
     * @return
     */
    @Override
    public List<ProductCategoryVO> buildProductCategoryMenu() {
        //1.查询所有的商品分类数据
        List<ProductCategory> productCategoryList = this.productCategoryMapper.selectList(null);
        //2.数据类型转换成ProductCategoryVO
        List<ProductCategoryVO> productCategoryVOList = productCategoryList.stream().map(ProductCategoryVO::new).collect(Collectors.toList());
        //3.进行父子级菜单的封装
        List<ProductCategoryVO> levelOneList = buildMenu(productCategoryVOList);
        //4.查找一级分类对应的商品信息
        getLevelOneProduct(levelOneList);
        return levelOneList;
    }

    /**
     * 查询一级分类对应的商品信息
     */
    public void getLevelOneProduct(List<ProductCategoryVO> list){
        for (ProductCategoryVO vo : list) {
            QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("categorylevelone_id",vo.getId());
            List<Product> productList = this.productMapper.selectList(queryWrapper);
            vo.setProductList(productList);
        }
    }

    /**
     * 构建菜单
     * @param list
     */
    public List<ProductCategoryVO> buildMenu(List<ProductCategoryVO> list){
        //找到一级菜单
        List<ProductCategoryVO> levelOneList = list.stream().filter(c -> c.getParentId() == 0).collect(Collectors.toList());
        for (ProductCategoryVO productCategoryVO : levelOneList) {
            recursion(list,productCategoryVO);
        }
        return levelOneList;
    }

    /**
     * 递归分类
     * @param list
     * @param vo
     */
    public void recursion(List<ProductCategoryVO> list,ProductCategoryVO vo){
        //找到子菜单
        List<ProductCategoryVO> children = getChildren(list, vo);
        vo.setChildren(children);
        //继续查找子菜单
        if(children.size()>0){
            for (ProductCategoryVO child : children) {
                recursion(list, child);
            }
        }
    }

    /**
     * 获取子菜单
     * @param list
     * @param vo
     */
    public List<ProductCategoryVO> getChildren(List<ProductCategoryVO> list,ProductCategoryVO vo){
        List<ProductCategoryVO> children = new ArrayList<>();
        Iterator<ProductCategoryVO> iterator = list.iterator();
        while (iterator.hasNext()) {
            ProductCategoryVO next = iterator.next();
            if(next.getParentId().equals(vo.getId())){
                children.add(next);
            }
        }
        return children;
    }

}
