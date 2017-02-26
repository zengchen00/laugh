package cn.zc.first.mapper;

import java.util.List;

import cn.zc.first.po.Article;
import cn.zc.first.po.ArticleVo;


public interface ArticleMapper {
    int insert(Article article);
    
    List<Article> selectArticleByStatus(int status);
    
    void updateArticleById(ArticleVo avo);
    
    void updateArticleOpens(ArticleVo avo);
    
    List<Article> selectForIndex();
    
    Integer selectMaxIndex();
    
    int selectTotal(int state);
    
    List<Article> selectCurrPage(ArticleVo avo);
    
    Article selectArticleById(int id);
}