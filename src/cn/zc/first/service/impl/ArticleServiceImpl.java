package cn.zc.first.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.zc.first.mapper.ArticleMapper;
import cn.zc.first.po.Article;
import cn.zc.first.po.ArticleVo;
import cn.zc.first.service.ArticleService;

public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
	ArticleMapper articleMapper;

	@Override
	public void insert(Article article) {
		articleMapper.insert(article);
	}

	@Override
	public List<Article> selectArticleByStatus(int status) {
		return articleMapper.selectArticleByStatus(status);
	}

	@Override
	public void updateById(ArticleVo avo) {
		articleMapper.updateArticleById(avo);
	}

}
