package com.yy.model;

/**
 * Created by yy on 2017/9/7.
 */
public class Credit {
    private int id;
    private String creditname;
    private int credit;
    private String xueke;
    private int xuehao;
    public int getId(){
        return this.id;
    }
    public void setId(int id){
        this.id=id;
    }
    public String getCreditname(){
        return this.creditname;
    }
    public void setCreditname(String creditname){
        this.creditname=creditname;
    }
    public int getCredit(){
        return this.credit;
    }
    public void setCredit(int credit){
        this.credit=credit;
    }
    public void setXueke(String xueke){
        this.xueke=xueke;
    }
    public String getXueke(){
        return xueke;
    }
    public void setXuehao(int xuehao){
        this.xuehao=xuehao;
    }
    public int getXuehao(){
        return xuehao;
    }
}
