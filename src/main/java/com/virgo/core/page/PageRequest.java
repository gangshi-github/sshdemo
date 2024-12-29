package com.virgo.core.page;

import lombok.Data;

@Data
public class PageRequest {
    private Integer pageNum = 1;
    private Integer pageSize = 10;
    private String orderBy;
    private Boolean asc = true;

    public int getStart() {
        return (pageNum - 1) * pageSize;
    }

    public String getOrderByClause() {
        if (orderBy != null && !orderBy.isEmpty()) {
            return orderBy + (asc ? " ASC" : " DESC");
        }
        return null;
    }
} 