package com.yjc.mmall.exception;

import com.yjc.mmall.result.ResponseEnum;

public class MMallException extends RuntimeException{
    private ResponseEnum responseEnum;

    public ResponseEnum getResponseEnum() {
        return responseEnum;
    }

    public void setResponseEnum(ResponseEnum responseEnum) {
        this.responseEnum = responseEnum;
    }

    public MMallException(ResponseEnum responseEnum) {
        super(responseEnum.getMsg());
        this.responseEnum = responseEnum;

    }
}
