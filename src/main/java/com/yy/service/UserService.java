package com.yy.service;
import com.yy.model.User;
import  org.springframework.ui.Model;
/**
 * Created by yy on 2017/9/6. 业务层
 */
public interface UserService {
    public  boolean login(String username,String password);
}
