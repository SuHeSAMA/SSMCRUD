package com.SuHe.bean;

import com.github.pagehelper.PageInfo;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用返回值的类
 *
 * @author shy
 * @create 2021-07-29 15:38
 */
public class Msg {

//    状态码100正确200错误
    private int code;

//    提示信息
    private String msg;

//    用户要返回给浏览器的数据
    private Map<String,Object> data = new HashMap<String, Object>();

    public static Msg success(){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("处理成功");
        return result;
    }

    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("处理失败");
        return result;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setExtend(Map<String, Object> extend) {
        this.data = extend;
    }

    public Msg() {
    }

    public Msg(int code, String msg, Map<String, Object> extend) {
        this.code = code;
        this.msg = msg;
        this.data = extend;
    }

    public Msg add(String key, Object value) {

        this.getData().put(key,value);
        return this;
    }
}
