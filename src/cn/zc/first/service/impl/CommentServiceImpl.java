package cn.zc.first.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.zc.first.mapper.CommentMapper;
import cn.zc.first.po.Comment;
import cn.zc.first.po.CommentVo;
import cn.zc.first.service.CommentService;

public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private CommentMapper commentMapper;


	@Override
	public void insert(Comment comment) {
		commentMapper.insert(comment);
		
	}

	@Override
	public List<Comment> selectByArtId(String articleId) {
		return commentMapper.selectByArtId(articleId);
	}

	@Override
	public List<Comment> selectCurrPage(CommentVo commentVo) {
		return commentMapper.selectCurrPage(commentVo);
	}

	@Override
	public int countNum(int articleId) {
		return commentMapper.countNum(articleId);
	}

}
