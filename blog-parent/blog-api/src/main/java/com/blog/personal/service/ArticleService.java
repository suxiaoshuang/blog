package com.blog.personal.service;

import com.blog.personal.vo.Result;
import com.blog.personal.vo.params.ArticleParam;
import com.blog.personal.vo.params.PageParams;

public interface ArticleService {
    /**
     * 分页查询文章列表
     * @param pageParams
     * @return
     */
    Result listArticle(PageParams pageParams);


    Result findHotArticleByViewCounts(int limit);

    Result findNewArticlesByCreateDate(int limit);

    Result listArticleArchives();

    Result findArticleById(Long id);

    Result publish(ArticleParam articleParam);

}
