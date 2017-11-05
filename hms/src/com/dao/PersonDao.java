package com.dao;

import java.util.List;

import com.bean.Person;

public interface PersonDao {
	public List<Person> getAllPersons();
	public List<Person> getAllPersons_choose1();
	public List<Person> getAllPersons_newHouse();
	public Person getPersonById(String id);
	public int updatePerson(Person p);
	public int updatePerson_choose(Person p);	//抽前后更新tb_person信息
	
	
}
