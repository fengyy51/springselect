package com.yy.dao;
import com.yy.model.User;
/**
 * Created by yy on 2017/9/6.
 */
public interface IUserDao {
    public User selectById(int id);
    public User selectByName(String name);
}
