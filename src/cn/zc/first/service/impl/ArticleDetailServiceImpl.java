package cn.zc.first.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.zc.first.mapper.ArticleDetailMapper;
import cn.zc.first.po.ArticleDetail;
import cn.zc.first.po.ArticleDetailVo;
import cn.zc.first.service.ArticleDetailService;

public class ArticleDetailServiceImpl implements ArticleDetailService {
	
	@Autowired
	ArticleDetailMapper articleDetailMapper;

	@Override
	public void insert(ArticleDetail articleDetail) {
		articleDetailMapper.insert(articleDetail);
	}

	@Override
	public List<ArticleDetail> selectCurrPage(ArticleDetailVo articleDetailVo) {
		return articleDetailMapper.selectCurrPage(articleDetailVo);
	}

	@Override
	public int countNum(int articleId) {
		return articleDetailMapper.countNum(articleId);
	}

	@Override
	public ArticleDetail selectById(int id) {
		return articleDetailMapper.selectById(id);
	}

	@Override
	public List<ArticleDetail> selectByAId(int AId) {
		return articleDetailMapper.selectByAId(AId);
	}

	@Override
	public void deleteById(int id) {
		articleDetailMapper.deleteById(id);
	}

}
