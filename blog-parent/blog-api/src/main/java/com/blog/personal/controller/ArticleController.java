package com.blog.personal.controller;

import com.blog.personal.service.ArticleService;
import com.blog.personal.vo.Result;
import com.blog.personal.vo.params.ArticleParam;
import com.blog.personal.vo.params.PageParams;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("articles")
public class ArticleController {
    @Resource
    private ArticleService articleService;

    @PostMapping
    public Result articles(@RequestBody PageParams pageParams){
        return articleService.listArticle(pageParams);
    }

    /**
     * 查询最多次数的文章
     * @return
     */
    @PostMapping("/hot")
    public Result hotArticle(){
        int limit = 5;
        return articleService.findHotArticleByViewCounts(limit);
    }

    /**
     * 最新的文章
     * @return
     */
    @PostMapping("/new")
    public Result newArticles(){
        int limit = 5;
        return articleService.findNewArticlesByCreateDate(limit);
    }

    /**
     * 文章按年月归档
     * @return
     */
    @PostMapping("/listArchives")
    public Result articleArchives(){
        return articleService.listArticleArchives();
    }

    /**
     * 文章详情
     * @param id
     * @return
     */
    @PostMapping("/view/{id}")
    public Result findArticleById(@PathVariable("id") Long id){
        return articleService.findArticleById(id);
    }

    /**
     * 发布文章
     * @param articleParam
     * @return
     */
    @PostMapping("/publish")
    public Result publish(@RequestBody ArticleParam articleParam){
        return articleService.publish(articleParam);
    }
}
