package com.blog.personal.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.blog.personal.dao.pojo.Article;
import com.blog.personal.dao.pojo.SysUser;
import com.blog.personal.vo.CommentCountVo;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;

@Component
@Transactional
public class ThreadService {
    @Resource
    private SysUserMapper sysUserMapper;
    @Resource
    private ArticleMapper articleMapper;

    @Async("taskExecutor")
    public void updateViewCount(ArticleMapper articleMapper, Article article){
        Article article1 = new Article();
        article1.setViewCounts(article.getViewCounts()+1);
        LambdaQueryWrapper<Article> query = new LambdaQueryWrapper<Article>();
        query.eq(Article::getId,article.getId());
        query.eq(Article::getViewCounts,article.getViewCounts());;
        articleMapper.update(article1,query);
    }

    @Async("taskExecutor")
    public void updataLastLogin(SysUser sysUser){
        sysUser.setLastLogin(new Date());
        sysUserMapper.updateById(sysUser);
    }

    @Async("taskExecutor")
    public void updateCommentCount(CommentCountVo commentCountVo)
    {
        Article article = new Article();
        article.setCommentCounts(commentCountVo.getCount());
        LambdaQueryWrapper<Article> query = new LambdaQueryWrapper<>();
        query.eq(Article::getId,commentCountVo.getArticleId());
        articleMapper.update(article,query);
    }
}
