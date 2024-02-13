package com.yjc.mmall.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yjc.mmall.entity.Cart;
import com.yjc.mmall.entity.User;
import com.yjc.mmall.service.CartService;
import com.yjc.mmall.service.ProductCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author admin
 * @since 2024-02-02
 */
@Controller
@RequestMapping("/productCategory")
public class ProductCategoryController {

    @Autowired
    private ProductCategoryService productCategoryService;
    @Autowired
    private CartService cartService;

    /**
     * 首页数据
     * @param session
     * @return
     */
    @GetMapping("/main")
    public ModelAndView main(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("main");
        //封装商品分类菜单
        modelAndView.addObject("list",this.productCategoryService.buildProductCategoryMenu());
        //封装一级分类对应的商品信息
        modelAndView.addObject("levelOneProductList",this.productCategoryService.findAllProductByCategoryLevelOne());
        //判断是否为登录用户
        User user = (User) session.getAttribute("user");
        if(user == null){
            //未登录
            modelAndView.addObject("cartList",new ArrayList<>());
        }else{
            //登录用户
            //查询该用户的购物车记录
            QueryWrapper<Cart> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("user_id",user.getId());
            modelAndView.addObject("cartList",this.cartService.list(queryWrapper));
        }
        return modelAndView;
    }
}

