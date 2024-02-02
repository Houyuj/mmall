package com.yjc.mmall.service.impl;

import com.yjc.mmall.entity.User;
import com.yjc.mmall.mapper.UserMapper;
import com.yjc.mmall.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author admin
 * @since 2024-02-02
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

}
