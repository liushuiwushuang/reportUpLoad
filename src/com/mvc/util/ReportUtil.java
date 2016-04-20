package com.mvc.util;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.BeanUtils;
import com.mvc.Vo.ReportVo;

public class ReportUtil  {

	public static ReportVo convertToVo(Object obj) {
		ReportVo vo = new ReportVo();
		if (obj == null) {
			return vo;
		}
		BeanUtils.copyProperties(obj, vo, new String[] {});
		return vo;
	}

	public static List<ReportVo> convertToVos(List<Object> entityList) {
		List<ReportVo> voList = new ArrayList<ReportVo>();
		if (entityList == null || entityList.size() == 0) {
			return voList;
		}
		for (Object entity : entityList) {
			voList.add(convertToVo(entity));
		}
		return voList;
	}
	
}
