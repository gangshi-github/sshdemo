package com.virgo.core.response;

import lombok.Data;
import org.apache.struts2.json.annotations.JSON;

@Data
public class R<T> {
    private int code;
    private String message;
    private T data;

    public static <T> R<T> ok() {
        return ok(null);
    }

    @JSON(serialize = false)
    public static <T> R<T> ok(T data) {
        R<T> response = new R<>();
        response.setCode(200);
        response.setMessage("Success");
        response.setData(data);
        return response;
    }

    @JSON(serialize = false)
    public static <T> R<T> fail(String message) {
        R<T> response = new R<>();
        response.setCode(500);
        response.setMessage(message);
        return response;
    }
    @JSON(serialize = false)
    public static <T> R<T> fail(int code, String message) {
        R<T> response = new R<>();
        response.setCode(code);
        response.setMessage(message);
        return response;
    }
} 