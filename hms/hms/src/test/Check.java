package test;

import java.util.List;

import com.bean.OldHouse;
import com.dao.OldHouseDao;
import com.dao.OldHouseDaoImpl;

public class Check {
	/**
	 * @param args
	 * 检查oldHouse中的sign_state和Person中的sign_state是否一致
	 */
	public void checkSign_state(){
		OldHouseDao ohd = new OldHouseDaoImpl();
		List<OldHouse> ohs = ohd.getAllOldHouses();
		int i = 0;
		for (OldHouse oh : ohs) {
			if(oh.getSign_state() != oh.getPerson().getSign_state()){
				i = 1;
				System.out.println(oh.toString());
			}
		}
		System.out.println(i);
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Check check = new Check();
		check.checkSign_state();
	}

}
