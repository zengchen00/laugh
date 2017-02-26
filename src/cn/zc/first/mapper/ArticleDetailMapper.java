package cn.zc.first.mapper;

import java.util.List;

import cn.zc.first.po.ArticleDetail;
import cn.zc.first.po.ArticleDetailVo;


public interface ArticleDetailMapper {
    void insert(ArticleDetail articleDetail);
    
    List<ArticleDetail> selectCurrPage(ArticleDetailVo avo);
    
    int countNum(int articleId);
}