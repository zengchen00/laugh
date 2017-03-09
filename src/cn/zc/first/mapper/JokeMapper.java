package cn.zc.first.mapper;

import cn.zc.first.po.Joke;
import cn.zc.first.po.JokeVo;

public interface JokeMapper {
	
	Joke selectById(JokeVo jokeVo);
    
    void insert(JokeVo jokeVo);
    
//    List<Comment> selectCurrPage(CommentVo avo);
    
//    int countNum(int articleId);
}