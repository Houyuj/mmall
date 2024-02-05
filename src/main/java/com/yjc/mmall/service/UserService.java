package com.yjc.mmall.service;

import com.yjc.mmall.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yjc.mmall.form.UserLoginForm;
import com.yjc.mmall.form.UserRegisterForm;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author admin
 * @since 2024-02-02
 */
public interface UserService extends IService<User> {
    public User register(UserRegisterForm userRegisterForm);
    public User login(UserLoginForm userLoginForm);
}
