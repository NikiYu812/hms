package test;

import com.dao.OldHouseDao;
import com.dao.OldHouseDaoImpl;
import com.dao.PersonDao;
import com.dao.PersonDaoImpl;

public class tmpTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		PersonDao pd = new PersonDaoImpl();
//		pd.getPersonById("2081");
		
		OldHouseDao ohd = new OldHouseDaoImpl();
		ohd.getOldHousesByPerson_id("2046");
//		ohd.getAllOldHouses();
	}

}
