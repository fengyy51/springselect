package com.yy.service;

import com.yy.dao.IUserDao;
import com.yy.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.context.annotation.Scope;
import org.springframework.ui.Model;

/**
 * Created by yy on 2017/9/6.
 */
//@Service("UserService") 注解用于标示此类为业务层组件,在使用时会被注解的类会自动由spring进行注入,无需我们创建实例
@Service("UserService")
public class UserServiceImpl implements UserService {
    //自动注入iuserdao 用于访问数据库
     @Autowired
      IUserDao Mapper;

        //登录方法的实现,从jsp页面获取username与password
      public boolean login(String username, String password) {
          System.out.println("输入的账号:" + username + "输入的密码:" + password);
         //对输入账号进行查询,取出数据库中保存对信息
          User user = Mapper.selectByName(username);
          if (user != null) {
              System.out.println("查询出来的账号:" + user.getUsername() + "密码:" + user.getPassword());
              System.out.println("---------");
              if (user.getUsername().equals(username) && user.getPassword().equals(password))
                  return true;
          }
          return false;
      }
}
