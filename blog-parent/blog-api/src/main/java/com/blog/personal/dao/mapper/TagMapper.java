package com.blog.personal.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.blog.personal.dao.pojo.Tag;

import java.util.List;

public interface TagMapper extends BaseMapper<Tag> {
    List<Tag> findTagsByArticleId(Long articleId);

    List<Long> findHotTags(int limit);

    List<Tag> findTagsByTagIds(List<Long> tagIds);
}
