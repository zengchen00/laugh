package cn.zc.first.task;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import cn.zc.first.common.MyConstants;
import cn.zc.first.common.Page;
import cn.zc.first.po.Article;
import cn.zc.first.po.ArticleVo;
import cn.zc.first.po.Joke;
import cn.zc.first.po.JokeVo;
import cn.zc.first.service.ArticleService;
import cn.zc.first.service.JokeService;

@Component
public class OnlineTask {
	
	private SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	@Autowired
	private ArticleService articleServiceImpl;
	
	@Autowired
	private JokeService jokeService;
	
    @Scheduled(cron = "0 0 3 * * ?")
    public void autoOnline(){
    	//gif自动上线
    	ArticleVo articleVo = new ArticleVo();
    	Page page = new Page();
    	page.setStartPage(0);
    	page.setNumPerPage(1);
    	articleVo.setState(MyConstants.ARTICLE_STATE_READY);
    	articleVo.setPage(page);
    	articleVo.setOrderBy("periods");
    	articleVo.setOrderType("asc");
    	List<Article> articles = articleServiceImpl.selectCurrPage(articleVo);
    	if(null != articles && articles.size()> 0){
    		Article article = articles.get(0);
    		
    		ArticleVo articleVo1 = new ArticleVo();
    		articleVo1.setUserName(article.getUserName());
    		articleVo1.setState(MyConstants.ARTICLE_STATE_ONLINE);
    		articleVo1.setId(article.getId());
    		Date date = new Date();
    		articleVo1.setModifyDate(date);
    		articleVo1.setModifyDateStr(df.format(date));
    		articleServiceImpl.updateById(articleVo1);
    	}
    	//笑话自动上线
    	JokeVo jokeVo = new JokeVo();
    	page = new Page();
    	page.setStartPage(0);
    	page.setNumPerPage(1);
    	jokeVo.setState(MyConstants.JOKE_STATE_READY);
    	jokeVo.setPage(page);
    	jokeVo.setOrderBy("periods");
    	jokeVo.setOrderType("asc");
    	List<Joke> jokes = jokeService.selectCurrPage(jokeVo);
    	if(null != jokes && jokes.size()> 0){
    		Joke joke = jokes.get(0);
    		JokeVo jokeVo1 = new JokeVo();
    		jokeVo1.setAuthor(joke.getAuthor());
    		jokeVo1.setState(MyConstants.JOKE_STATE_ONLINE);
    		jokeVo1.setId(joke.getId());
    		Date date = new Date();
    		jokeVo1.setModifyDate(date);
    		jokeVo1.setModifyDateStr(df.format(date));
    		jokeService.updateState(jokeVo1);
    	}
    }
}