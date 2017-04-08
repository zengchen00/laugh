package cn.zc.first.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.zc.first.mapper.JokeMapper;
import cn.zc.first.po.Joke;
import cn.zc.first.po.JokeVo;
import cn.zc.first.service.JokeService;

public class JokeServiceImpl implements JokeService{
	
	@Autowired
	private JokeMapper jokeMapper;


	@Override
	public void insert(JokeVo jokeVo) {
		jokeMapper.insert(jokeVo);
		
	}


	@Override
	public Joke queryJokeById(JokeVo jokeVo) {
		return jokeMapper.selectById(jokeVo);
	}


	@Override
	public int countNum(int state) {
		return jokeMapper.countNum(state);
	}


	@Override
	public List<Joke> selectCurrPage(JokeVo jokeVo) {
		return jokeMapper.selectCurrPage(jokeVo);
	}


	@Override
	public void updateState(JokeVo jokeVo) {
		jokeMapper.updateJokeById(jokeVo);
		
	}
	
	@Override
	public Joke selectPreSuf(JokeVo jokeVo) {
		return jokeMapper.selectPreSuf(jokeVo);
	}
	
	@Override
	public void updateOpen(JokeVo jokeVo) {
		jokeMapper.updateOpen(jokeVo);
	}
	
}
