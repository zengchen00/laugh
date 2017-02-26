package cn.zc.first.service;

import java.util.List;

import cn.zc.first.po.Comment;
import cn.zc.first.po.CommentVo;


public interface CommentService {
	public void insert(Comment comment);
	
	public List<Comment> selectByArtId(String articleId);
	
	public List<Comment> selectCurrPage(CommentVo commentVo);
	
	public int countNum(int articleId);
}
