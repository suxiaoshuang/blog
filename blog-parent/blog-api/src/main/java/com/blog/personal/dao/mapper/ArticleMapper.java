package com.blog.personal.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.blog.personal.dao.dos.ArticleArchives;
import com.blog.personal.dao.pojo.Article;

import java.util.List;

public interface ArticleMapper extends BaseMapper<Article> {
    /**
     * 根据流量数量查询排名前的limit的文章
     * @param limit
     * @return 符合条件的文章集合
     */
    List<Article> findHotArticleByViewCounts(int limit);

    List<Article> findNewArticlesByCreateDate(int limit);

    List<ArticleArchives> listArticleArchives();

    IPage<Article> listArticle(Page<Article> page,
                               Long categoryId,
                               Long tagId,
                               String year,
                               String month);
}
