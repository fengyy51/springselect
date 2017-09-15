package com.yy.service;
import com.yy.model.Credit;
import  org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

/**
 * Created by yy on 2017/9/7.
 */
public interface CreditService {
    public List<Credit> getCredit();
    public Credit getOneCredit(int id);
    public List<Credit>queryCredits(Map queryUser);
    public boolean editCredit(Credit usercredit);
    public boolean deleteCredit(int id);
    public boolean addCredit(Credit usercredit);
}
