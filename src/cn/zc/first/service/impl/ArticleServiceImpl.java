package cn.zc.first.service.impl;

import java.util.List;
import org.apache.commons.lang.StringUtils;

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

	@Override
	public List<Article> selectForIndex() {
		return articleMapper.selectForIndex();
	}

	@Override
	public int selectMaxIndex() {
		Integer indexNum = articleMapper.selectMaxIndex();
		if(indexNum == null){
			return 0;
		}
		return indexNum;
	}

	@Override
	public int selectTotal(int state) {
		return articleMapper.selectTotal(state);
	}

	@Override
	public List<Article> selectCurrPage(ArticleVo avo) {
		return articleMapper.selectCurrPage(avo);
	}

	@Override
	public Article selectArticleById(int id) {
		return articleMapper.selectArticleById(id);
	}

}
