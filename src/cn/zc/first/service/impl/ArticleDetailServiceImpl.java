package cn.zc.first.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import cn.zc.first.mapper.ArticleDetailMapper;
import cn.zc.first.po.ArticleDetail;
import cn.zc.first.service.ArticleDetailService;

public class ArticleDetailServiceImpl implements ArticleDetailService {
	
	@Autowired
	ArticleDetailMapper articleDetailMapper;

	@Override
	public void insert(ArticleDetail articleDetail) {
		articleDetailMapper.insert(articleDetail);
	}

}
