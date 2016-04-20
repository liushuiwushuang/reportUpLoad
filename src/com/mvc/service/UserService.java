package com.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvc.dao.EntityDao;
import com.mvc.entity.User;

@Service
public class UserService {
	@Autowired
	private EntityDao entityDao;
	
	@Transactional
	public void save(User us){
		entityDao.save(us);
	}
	
	public Object getUser(User userBo){
		StringBuffer hql = new StringBuffer();
		hql.append("from User u where u.userName='"+userBo.getUserName()+"' and u.password='"+userBo.getPassword()+"'" );
		List<Object> list = entityDao.createQuery(hql.toString());
	    if(list.size()>0){
	    	return list.get(0);
	    }
		return null;
	}
	
}

