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
	public int countNum() {
		return jokeMapper.countNum();
	}


	@Override
	public List<Joke> selectCurrPage(JokeVo jokeVo) {
		return jokeMapper.selectCurrPage(jokeVo);
	}
}
