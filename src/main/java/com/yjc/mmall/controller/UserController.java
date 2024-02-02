package com.yjc.mmall.controller;

import com.yjc.mmall.entity.User;

import com.yjc.mmall.form.UserRegisterForm;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

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
public class UserController {

    @PostMapping("/register")
    public String register(@Valid UserRegisterForm userRegisterForm, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            for (ObjectError allError : allErrors) {
                System.out.println(allError.getDefaultMessage());
            }
        }
        return null;
    }

}

