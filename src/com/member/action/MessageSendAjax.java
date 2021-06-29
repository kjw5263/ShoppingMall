package com.member.action;

import java.util.HashMap;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


public class MessageSendAjax {

	public static void call(String userTel, String rm) {
		String api_key = "NCSOUQT9X9CSH30V";
	    String api_secret = "LCNW7OCHVSYCZDTQGYH4EEM8UDEXJNER";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userTel);	// 수신전화번호
	    params.put("from", "01023370140");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "인증번호는" + "["+ rm + "]" + "입니다.");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	}

}
