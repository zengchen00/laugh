package cn.zc.first.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import cn.zc.first.mapper.VisitRecordMapper;
import cn.zc.first.po.VisitRecordVo;
import cn.zc.first.service.VisitRecordService;

public class VisitRecordServiceImpl implements VisitRecordService{
	
	@Autowired
	private VisitRecordMapper visitRecordMapper;

	@Override
	public void insert(VisitRecordVo visitRecordVo) {
		visitRecordMapper.insert(visitRecordVo);
	}


	
}
