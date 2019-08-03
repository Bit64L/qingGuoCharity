package org.qingGuo.model;

public class CommodityType {
    private Integer id;

    private String intro;

    private String firstClassName;

    private String secondClassName;

    public CommodityType(Integer id, String intro, String firstClassName, String secondClassName) {
        this.id = id;
        this.intro = intro;
        this.firstClassName = firstClassName;
        this.secondClassName = secondClassName;
    }

    public CommodityType() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro == null ? null : intro.trim();
    }

    public String getFirstClassName() {
        return firstClassName;
    }

    public void setFirstClassName(String firstClassName) {
        this.firstClassName = firstClassName == null ? null : firstClassName.trim();
    }

    public String getSecondClassName() {
        return secondClassName;
    }

    public void setSecondClassName(String secondClassName) {
        this.secondClassName = secondClassName == null ? null : secondClassName.trim();
    }
}