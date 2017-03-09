package cn.zc.first.service;

import cn.zc.first.po.Joke;
import cn.zc.first.po.JokeVo;


public interface JokeService {
	public void insert(JokeVo jokeVo);

	public Joke queryJokeById(JokeVo jokeVo);
	
	
//	public List<Comment> selectCurrPage(CommentVo commentVo);
	
//	public int countNum(int articleId);
}
