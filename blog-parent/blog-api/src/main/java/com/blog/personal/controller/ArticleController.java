package com.blog.personal.controller;

import com.blog.personal.dao.pojo.Article;
import com.blog.personal.service.ArticleService;
import com.blog.personal.vo.Result;
import com.blog.personal.vo.params.PageParams;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("articles")
public class ArticleController {
    @Resource
    private ArticleService articleService;

    @PostMapping
    public Result articles(@RequestBody PageParams pageParams){
        return articleService.listArticle(pageParams);
    }

    @PostMapping("/hot")
    public Result hotArticle(){
        int limit = 5;
        return articleService.findHotArticleByViewCounts(limit);
    }
}
