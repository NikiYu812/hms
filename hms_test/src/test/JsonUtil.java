package test;

import net.sf.json.JSONObject;

import com.bean.Person;

public class JsonUtil {
	
	public static void convertObject(){
		Person p = new Person();
		p.setId("123");
		p.setP0_name("杜建红");
		p.setP1_name("杜建红");
		
		//使用JSONObject
		JSONObject json = JSONObject.fromObject(p);
		
		String strJson = json.toString();
		
		System.out.println(strJson);
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Person p = new Person();
		p.setId("123");
		p.setP0_name("杜建红");
		p.setP1_name("杜建红");
		
		JSONObject json = JSONObject.fromObject(p);
		String strJson = json.toString();
		System.out.println(strJson);
		
		JSONObject jsonObject = JSONObject.fromObject(strJson);
		Person person = (Person)JSONObject.toBean(jsonObject,Person.class);
		System.out.println(person.getId());
	}

}
