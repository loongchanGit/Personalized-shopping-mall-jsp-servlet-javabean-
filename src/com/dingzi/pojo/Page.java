package com.dingzi.pojo;

import java.util.List;

public class Page<T> {

    public static final Integer PAGE_SIZE=10;
    private Integer pageNo;//当前页
    private Integer pageTotal;//总页数
    private Integer pageSize=PAGE_SIZE;//页大小
    private Integer pageTotalCount;//总记录数
    private List<T> item;//当前页数据



    public Integer getPageTotalCount() {
        return pageTotalCount;
    }

    public void setPageTotalCount(Integer pageTotalCount) {
        this.pageTotalCount = pageTotalCount;
    }

    public List<T> getItem() {
        return item;
    }

    public void setItem(List<T> item) {
        this.item = item;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getPageTotal() {
        return pageTotal;
    }

    public void setPageTotal(Integer pageTotal) {
        this.pageTotal = pageTotal;
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageNo=" + pageNo +
                ", pageTotal=" + pageTotal +
                ", pageSize=" + pageSize +
                ", pageTotalCount=" + pageTotalCount +
                ", item=" + item +
                '}';
    }
}
