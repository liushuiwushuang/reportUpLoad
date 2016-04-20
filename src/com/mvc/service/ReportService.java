package com.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvc.dao.EntityDao;
import com.mvc.entity.Report;

@Service
public class ReportService {
	@Autowired
	private EntityDao entityDao;
	
	@Transactional
	public List<Object> getReportList(){
		StringBuffer sff = new StringBuffer();
		sff.append("select re from ").append(Report.class.getSimpleName()).append(" re ");
		List<Object> list = entityDao.createQuery(sff.toString());
		return list;
	}
	
	@Transactional
	public Object getReport(Integer reId){
		StringBuffer hql = new StringBuffer();
		hql.append("from Report re where re.reId='"+reId+"'" );
		List<Object> list = entityDao.createQuery(hql.toString());
	    if(list.size()>0){
	    	return list.get(0);
	    }
		return null;
	}
	
	@Transactional
	public Object getReIdByReTitle(String reTitle){
		StringBuffer hql = new StringBuffer();
		hql.append("from Report re where re.reTitle='"+reTitle+"'" );
		List<Object> list = entityDao.createQuery(hql.toString());
	    if(list.size()>0){
	    	return list.get(0);
	    }
		return null;
	}
	
	@Transactional
	public void save(Report re){
		entityDao.save(re);
	}
	
	@Transactional
	public void delete(Object obj){
		entityDao.delete(obj);
	}
	
}

