package cn.zc.first.service;

import java.util.List;

import cn.zc.first.po.Article;
import cn.zc.first.po.ArticleVo;

public interface ArticleService {
	public void insert(Article article);
	public List<Article> selectArticleByStatus(int status);
	public void updateById(ArticleVo avo);
	public List<Article> selectForIndex();
}
