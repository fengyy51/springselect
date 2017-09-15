package com.yy.dao;

import com.yy.model.Credit;

import java.util.List;
import java.util.Map;

/**
 * Created by yy on 2017/9/7.
 */
public interface CreditDao {
    public List<Credit> getAllCredit();
    public List<Credit>queryCredits(Map queryUser);
    public Credit getOneCredit(int id);
    public boolean editCredit(Credit usercredit);
    public boolean insertCredit(Credit usercredit);
    public boolean deleteCredit(int id);
}
