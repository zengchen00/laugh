package cn.zc.first.service;

import java.util.List;

import cn.zc.first.po.Joke;
import cn.zc.first.po.JokeVo;


public interface JokeService {
	
	public void insert(JokeVo jokeVo);

	public Joke queryJokeById(JokeVo jokeVo);
	
	public List<Joke> selectCurrPage(JokeVo jokeVo);
	
	public int countNum(int state);
	
	public void updateState(JokeVo jokeVo);
	
	public Joke selectPreSuf(JokeVo jokeVo);
	
	public void updateOpen(JokeVo jokeVo);
}
