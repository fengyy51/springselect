package util;

import java.util.HashMap;

/**
 * Created by yy on 2017/9/13.
 */
public class ResponseUtil {
    public static Object okJSON(Object object){
        HashMap<String,Object> returnMap=new HashMap<String, Object>();
        returnMap.put("code",200);
        returnMap.put("data",object);
        return  returnMap;
    }
    public static Object errorJSON(String msg){
        HashMap<String,Object> returnMap=new HashMap<String, Object>();
        HashMap<String,String>errorMsg=new HashMap<String, String>();
        errorMsg.put("msg",msg);
        returnMap.put("code",500);
        returnMap.put("data",errorMsg);
        return returnMap;
    }
}
