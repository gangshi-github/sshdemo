package com.virgo.action;


import com.opensymphony.xwork2.ActionSupport;
import com.virgo.core.response.R;
import lombok.Getter;
import lombok.Setter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Getter
@Setter
public class BaseAction extends ActionSupport {
    
    private static final long serialVersionUID = 1L;
    
    protected final Logger log = LoggerFactory.getLogger(getClass());
    
    protected R<?> result;
    protected Integer page = 1;
    protected Integer rows = 10;
    protected String sort;
    protected String order = "asc";
    
    protected int getStart() {
        return (page - 1) * rows;
    }
    
    protected String getOrderBy() {
        if (sort != null && !sort.isEmpty()) {
            return sort + " " + order;
        }
        return null;
    }

    protected void setSuccessResult() {
        this.result = R.ok();
    }

    protected void setSuccessResult(Object data) {
        this.result = R.ok(data);
    }

    protected void setFailResult(String message) {
        this.result = R.fail(message);
    }

    protected void setFailResult(Integer code, String message) {
        this.result = R.fail(code, message);
    }
} 