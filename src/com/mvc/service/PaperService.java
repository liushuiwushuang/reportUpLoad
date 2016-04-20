package com.mvc.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mvc.dao.EntityDao;
import com.mvc.entity.Paper;

@Service
public class PaperService {
	@Autowired
	private EntityDao entityDao;
	
	@Transactional
	public void save(Paper pa){
		entityDao.save(pa);
	}
	
	@Transactional
	public Object getPaper(Integer reId){
		StringBuffer hql = new StringBuffer();
		hql.append("from Paper pa where pa.reId='"+reId+"'" );
		List<Object> list = entityDao.createQuery(hql.toString());
	    if(list.size()>0){
	    	return list.get(0);
	    }
		return null;
	}
	
}

