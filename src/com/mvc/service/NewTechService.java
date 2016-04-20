package com.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvc.dao.EntityDao;
import com.mvc.entity.NewTech;

@Service
public class NewTechService {
	@Autowired
	private EntityDao entityDao;
	
	@Transactional
	public void save(NewTech newTech){
		entityDao.save(newTech);
	}
	
	public Object getNewTech(Integer reId){
		StringBuffer hql = new StringBuffer();
		hql.append("from NewTech ne where ne.reId='"+reId+"'" );
		List<Object> list = entityDao.createQuery(hql.toString());
	    if(list.size()>0){
	    	return list.get(0);
	    }
		return null;
	}
	
}
