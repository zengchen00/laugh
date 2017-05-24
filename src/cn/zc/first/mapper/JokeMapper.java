package cn.zc.first.mapper;

import java.util.List;

import cn.zc.first.po.Joke;
import cn.zc.first.po.JokeVo;

public interface JokeMapper {
	
	Joke selectById(JokeVo jokeVo);
    
    void insert(JokeVo jokeVo);
    
    List<Joke> selectCurrPage(JokeVo avo);
    
    int countNum(int state);
    
    void updateJokeById(JokeVo jokeVo);
    
    Joke selectPreSuf(JokeVo jokeVo);
    
    void updateOpen(JokeVo jokeVo);

	void deleteById(int id);
}