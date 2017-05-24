package cn.zc.first.service;

import java.util.List;

import cn.zc.first.po.ArticleDetail;
import cn.zc.first.po.ArticleDetailVo;

public interface ArticleDetailService {
	public void insert(ArticleDetail articleDetail);
	
	public List<ArticleDetail> selectCurrPage(ArticleDetailVo articleDetailVo);
	
	public int countNum(int articleId);
	
	public  ArticleDetail selectById(int id);
	
	public List<ArticleDetail> selectByAId(int AId);
	
	public void deleteById(int id);
}
