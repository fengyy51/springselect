package com.yy.controller;

import com.yy.model.Credit;
import com.yy.model.User;
import com.yy.service.CreditService;
import com.yy.service.UserService;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import util.ResponseUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;

/**
 * Created by yy on 2017/9/6.
 */
//@Controller注解用于标示本类为web层控制组件
@Controller
//@RequestMapping("/user")用于标定访问时对url位置
@RequestMapping("/user")
//在默认情况下springmvc的实例都是单例模式,所以使用scope域将其注解为每次都创建一个新的实例
@Scope("prototype")
public class UserController {
    private static final org.slf4j.Logger LOGGER = LoggerFactory.getLogger(UserController.class);
    //自动注入业务层的userService类
    @Autowired
    UserService userService;
    @Autowired
    CreditService creditService;
    //login业务的访问位置为/user/login
    @ResponseBody
    @RequestMapping("/login")
    public Object login(@RequestParam("username")String username,@RequestParam("password")String password) {
//            ,HttpServletRequest request){
        //调用login方法来验证是否是注册用户
        System.out.println(username + password);
        try {
            boolean loginType = userService.login(username, password);
            if (loginType) {
                HashMap<String,Boolean>returnResult=new HashMap<String, Boolean>();
                returnResult.put("result",true);
                return ResponseUtil.okJSON(returnResult);
            }else{
                HashMap<String,Boolean>returnResult=new HashMap<String, Boolean>();
                returnResult.put("result",false);
                return ResponseUtil.okJSON(returnResult);
            }
        } catch (Exception e) {
                LOGGER.error("获取collect初始数据出错，username：" + username);
                return ResponseUtil.errorJSON("用户登录失败");
        }
    }
//            request.setAttribute("user",user);
//            return "redirect:/user/queryAll.do";
//        }else{
//            //若不对,则将错误信息显示到错误页面
//            request.setAttribute("message", "用户名密码错误");
//            return "page/fail";
//        }
//    }
    @ResponseBody
    @RequestMapping("/queryAll")
    public Object queryAll(){
        try {
            List<Credit> user_credit = creditService.getCredit();
            for(int i=0;i<user_credit.size();i++){
                System.out.println(user_credit.get(i));
            }
            if (user_credit.size()!=0) {
                HashMap<String,Object>returnResult=new HashMap<String, Object>();
                returnResult.put("result",true);
                returnResult.put("item",user_credit);
                System.out.println(ResponseUtil.okJSON(returnResult));
                return ResponseUtil.okJSON(returnResult);
            }else{
                HashMap<String,Boolean>returnResult=new HashMap<String, Boolean>();
                returnResult.put("result",false);
                return ResponseUtil.okJSON(returnResult);
            }
        } catch (Exception e) {
            LOGGER.error("获取查询初始数据出错");
            return ResponseUtil.errorJSON("查询全部数据失败");
        }

            //如果验证通过,则将用户信息传到前台
//            request.setAttribute("credit",user_credit);
//            if(user_credit!=null){
//                System.out.println(user_credit.getCredit()+user_credit.getId());
//            }
            //并跳转到success.jsp页面
//            return "page/success";

    }
    @ResponseBody
    @RequestMapping("/queryUser")
    public Object queryUser(@RequestParam("nameVal")String nameVal,@RequestParam("xuehaoVal")String xuehaoVal,
                            @RequestParam("xuekeVal")String xuekeVal){
        try {
            HashMap<String,String>queryUser=new HashMap<String, String>();
            queryUser.put("nameVal",nameVal);
            queryUser.put("xuehaoVal",xuehaoVal);
            queryUser.put("xuekeVal",xuekeVal);
            System.out.println(queryUser);
            List<Credit> user_credit = creditService.queryCredits(queryUser);
            System.out.println(user_credit);
            for(int i=0;i<user_credit.size();i++){
                System.out.println(user_credit.get(i));
            }
            if (user_credit.size()!=0) {
                HashMap<String,Object>returnResult=new HashMap<String, Object>();
                returnResult.put("result",true);
                returnResult.put("item",user_credit);
                System.out.println(ResponseUtil.okJSON(returnResult));
                return ResponseUtil.okJSON(returnResult);
            }else{
                HashMap<String,Boolean>returnResult=new HashMap<String, Boolean>();
                returnResult.put("result",false);
                return ResponseUtil.okJSON(returnResult);
            }
        } catch (Exception e) {
            System.out.println(e);
            LOGGER.error("获取查询初始数据出错");
            return ResponseUtil.errorJSON("查询数据失败");
        }
    }
    @RequestMapping("/beforeEdit")
    public String beforeEdit(@RequestParam("id")int id,HttpServletRequest request){
        Credit usercredit=creditService.getOneCredit(id);
        System.out.println(usercredit.getCreditname()+usercredit.getXueke()+usercredit.getCredit());
        request.setAttribute("editcredit",usercredit);
        return "edit";
    }
    @RequestMapping("/edit")
    public String Edit(Credit usercredit,HttpServletRequest request){
        System.out.println(usercredit.getCreditname()+usercredit.getXueke()+usercredit.getCredit());
        if(creditService.editCredit(usercredit)){
            System.out.println("修改成功");

        }else{
            System.out.println("修改失败");
        }
        return "success";
    }
    @RequestMapping("/add")
    public String Add(Credit usercredit,HttpServletRequest request){
        System.out.println(usercredit.getXuehao()+usercredit.getCredit()+usercredit.getCreditname()+usercredit.getXueke());
        if(creditService.addCredit(usercredit)){
            System.out.println("增加成功");
        }
        else{
            System.out.println("增加失败");
        }
        return "success";
    }
    @RequestMapping("/delete")
    public String delete(@RequestParam("id")int id,HttpServletRequest request){
        boolean b=creditService.deleteCredit(id);
        if(b){
            System.out.println("删除成功");
        }else {
            System.out.println("删除失败");
        }
        return "success";
    }

}
