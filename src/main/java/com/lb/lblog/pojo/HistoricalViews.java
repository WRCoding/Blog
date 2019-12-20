package com.lb.lblog.pojo;



import java.io.Serializable;
import java.util.Date;
public class HistoricalViews implements Serializable {
    private Integer views;
    private Date createBy;

    public Integer getViews() {
        return views;
    }

    public void setViews(Integer views) {
        this.views = views;
    }

    public Date getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Date createBy) {
        this.createBy = createBy;
    }

    @Override
    public String toString() {
        return "HistoricalViews{" +
                "views=" + views +
                ", createBy=" + createBy +
                '}';
    }
}
