package com.blog.personal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.blog.personal.dao.pojo.Article;
import com.blog.personal.dao.pojo.ArticleBody;
import com.blog.personal.dao.pojo.SysUser;
import com.blog.personal.service.ArticleService;
import com.blog.personal.service.ThreadService;
import com.blog.personal.vo.*;
import com.blog.personal.vo.params.ArticleParam;
import com.blog.personal.vo.params.PageParams;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {
    @Resource
    private ArticleMapper articleMapper;
    @Resource
    private TagService tagService;
    @Resource
    private SysUserService userService;
    @Resource
    ThreadService threadService;

    @Override
    public Result listArticle(PageParams pageParams){
        /**
         * 分页查询article数据库
         */
        Page<Article> page = new Page<Article>(pageParams.getPage(),pageParams.getPageSize());
        IPage<Article> articleIPage = this.articleMapper.listArticle(page,pageParams.getCategoryId(),pageParams.getTagId(),pageParams.getYear(),pageParams.getMonth());
        return Result.success(copyList(articleIPage.getRecords(),true,true));
    }

    private List<ArticleVo> copyList(List<Article> records, boolean isTage, boolean isAutor){
        List<ArticleVo> articleVoList = new ArrayList<ArticleVo>();
        for(Article article : records){
            articleVoList.add(copy(article,isTage,isAutor,false,false));
        }
        return articleVoList;
    }

    private ArticleVo copy(Article article, boolean isTage, boolean isAuthor, boolean isBody, boolean isCategory){
        ArticleVo articleVo = new ArticleVo();
        BeanUtils.copyProperties(article, articleVo);

        if(isTage){
            Long articleId = article.getId();
            articleVo.setTags(tagService.findTagsByArticleId(articleId));
        }
        if(isAuthor){
            Long authorId = article.getAuthorId();
            articleVo.setAuthor(sysUserService.findUserById(authorId).getNickname());
        }

        if(isBody){
            ArticleBodyVo articleBody = findArticleBody(article.getId());
            articleVo.setBody(articleBody);;
        }

        if(isCategory){
            ArticleCategoryVo categoryvo = findCategory(article.getCategoryId());
            articleVo.setCategory(categoryvo);
        }
        return  articleVo ;

    }

    private ArticleBodyVo findArticleBody(Long articleId) {
        LambdaQueryWrapper<ArticleBody> queryWrapper = new LambdaQueryWrapper<ArticleBody>();
        queryWrapper.eq(ArticleBody::getArticleId,articleId);
        queryWrapper.last("LIMIT 1");

        ArticleBody articleBody = articleBodyMapper.selectOne(queryWrapper);
        ArticleBodyVo articleBodyVo = new ArticleBodyVo();
        articleBodyVo.setContent(articleBody.getContent());
        articleBodyVo.setContentHtml(articleBody.getContentHtml());
        return articleBodyVo;
    }

    private ArticleCategoryVo findCategory(Long categoryId){
        return categoryService.findCategoryById(categoryId);
    }

    public Result findHotArticleByViewCounts(int limit){
        List<Article> articleList = articleMapper.findHotArticleByViewCounts(limit);
        if(CollectionUtils.isEmpty(articleList)){
            return Result.fail(ErrorCode.SESSION_TIME_OUT.getCode(),ErrorCode.SESSION_TIME_OUT.getMsg());
        }
        return Result.success(copyList(articleList,false,false));
    }

    @Override
    public Result findNewArticlesByCreateDate(int limit){
        LambdaQueryWrapper<Article> query = new LambdaQueryWrapper<Article>();
        query.orderByDesc(Article::getCreateDate);
        query.select(Article::getId, Article::getTitle);
        query.last("LIMIT"+limit);
        List<Article> articleList = articleMapper.selectList(query);
        return Result.success(copyList(articleList,false,false));
    }

    @Override
    public Result listArticleArchives(){
        List<ArticleArchives> articleArchives = articleMapper.listArticleArchives();
        return Result.success(articleArchives);
            }

    @Override
    public Result findArticleById(Long id){
        Article article = articleMapper.selectById(id);
        ArticleVo articleVo = copy(article,true,true,true,true);
        threadService.updateViewCount(articleMapper,article);
        return Result.success(articleVo);
    }

    @Override
    public Result publish(ArticleParam articleParam){
        SysUser sysUser = UserThreadLocal.get();
        Article article = new Article();

        article.setAuthorId(sysUser.getId());
        article.setCreateDate(new Date());
        article.setSummary(articleParam.getSummary());
        article.setTitle(articleParam.getTitle());
        article.setBodyId(-1L);

        if(articleParam.getCategoryVo().getId() != null){
            article.setCategoryId(articleParam.getCategoryVo().getId());
        }

this.articleMapper.insert(article);

        List<TagVo> tagList = articleParam.getTags();

    }
}
