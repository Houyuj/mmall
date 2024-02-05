package com.yjc.mmall.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yjc.mmall.entity.User;

import com.yjc.mmall.exception.MMallException;
import com.yjc.mmall.form.UserLoginForm;
import com.yjc.mmall.form.UserRegisterForm;
import com.yjc.mmall.result.ResponseEnum;
import com.yjc.mmall.service.UserService;
import com.yjc.mmall.utils.RegexValidateUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author admin
 * @since 2024-02-02
 */
@Controller
@RequestMapping("/user")
@Slf4j
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 用户注册
     * @param userRegisterForm
     * @param bindingResult
     * @return
     */
    @PostMapping("/register")
    public String register(@Valid UserRegisterForm userRegisterForm, BindingResult bindingResult){
        //非空校验
        if(bindingResult.hasErrors()){
            log.info("【用户注册】用户信息不能为空");
            throw new MMallException(ResponseEnum.USER_INFO_NULL);

        }
        User register = this.userService.register(userRegisterForm);
        if(register == null){
            log.info("【用户注册】添加用户失败");
            throw new MMallException(ResponseEnum.USER_REGISTER_ERROR);
        }
        return "redirect:/login";   //重定向redirect
    }

    /**
     * 用户登录
     * @return
     */
    @PostMapping("/login")
    public String login(@Valid UserLoginForm userLoginForm, BindingResult bindingResult, HttpSession session){
        //非空校验
        if(bindingResult.hasErrors()){
            log.info("【用户登录】用户信息不能为空");
            throw new MMallException(ResponseEnum.USER_INFO_NULL);
        }
        User login = this.userService.login(userLoginForm);
        session.setAttribute("user",login);
        return "redirect:/productCategory/main";
    }
}

