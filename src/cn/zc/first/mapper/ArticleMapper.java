package cn.zc.first.mapper;

import java.util.List;

import cn.zc.first.po.Article;
import cn.zc.first.po.ArticleVo;


public interface ArticleMapper {
    int insert(Article article);
    
    List<Article> selectArticleByStatus(int status);
    
    void updateArticleById(ArticleVo avo);
    
    List<Article> selectForIndex();
}