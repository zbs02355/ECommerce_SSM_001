package com.util;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpSession;
import com.po.Consumer;
public class MyUtil {
	//���ʱ���ַ���
	public static String getStringID(){
		String id=null;
		Date date=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyyMMddHHmmss"); 
		id=df.format(date);
		return id;
	}
	//����û�ID
	public static Integer getUserId(HttpSession session) {
		Consumer user = (Consumer)session.getAttribute("consumer");
		return user.getId();
	}
}
