package com.yjc.mmall.result;

public enum ResponseEnum {
    USER_INFO_NULL(300,"用户信息不能为空"),
    EMAIL_ERROR(301,"邮箱格式错误"),
    MOBILE_ERROR(302,"手机格式错误"),
    USERNAME_EXISTS(303,"用户名已存在"),
    USER_REGISTER_ERROR(304,"用户注册失败"),
    USERNAME_NOT_EXISTS(305,"用户名不存在"),
    PASSWORD_ERROR(306,"密码错误"),
    PARAMETER_NULL(307,"参数为空"),
    NOT_LOGIN(308,"未登录"),
    CART_ADD_ERROR(309,"添加购物车失败"),
    PRODUCT_NOT_EXISTS(310,"商品不存在"),
    PRODUCT_STOCK_ERROR(311,"商品库存不足");



    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    private Integer code;
    private String msg;

    ResponseEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
