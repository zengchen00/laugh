package cn.zc.first.mapper;

import java.util.List;

import cn.zc.first.po.Comment;
import cn.zc.first.po.CommentVo;

public interface CommentMapper {
	
    List<Comment> selectByArtId(String articleId);
    
    void insert(Comment comment);
    
    List<Comment> selectCurrPage(CommentVo avo);
    
    int countNum(int articleId);
}