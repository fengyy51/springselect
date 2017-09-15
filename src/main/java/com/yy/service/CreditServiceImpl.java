package com.yy.service;

import com.yy.dao.CreditDao;
import com.yy.model.Credit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by yy on 2017/9/7.
 */
@Service("CreditService")
public class CreditServiceImpl implements CreditService{
    @Autowired
    CreditDao creditMap;
    public List<Credit> getCredit(){
        List<Credit> user_credit_ls=creditMap.getAllCredit();
        return user_credit_ls;
    }
    public Credit getOneCredit(int id){
        return creditMap.getOneCredit(id);
    }
    public List<Credit>queryCredits(Map queryUser){
        List<Credit>user_credit_query=creditMap.queryCredits(queryUser);
        if(user_credit_query.size()==0){
            System.out.print("cuowu");
        }
        System.out.println(user_credit_query);
        return user_credit_query;
    }
    public boolean editCredit(Credit usercredit){
        if(creditMap.editCredit(usercredit)){
            return true;
        }
        return false;
    };
    public boolean deleteCredit(int id){
        if(creditMap.deleteCredit(id)){
            return true;
        }
        return false;
    };
    public boolean addCredit(Credit usercredit){
        if(creditMap.insertCredit(usercredit)){
            return true;
        }
        return false;
    };


}
