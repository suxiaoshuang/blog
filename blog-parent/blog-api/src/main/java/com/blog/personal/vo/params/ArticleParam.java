package com.blog.personal.vo.params;

import com.blog.personal.vo.ArticleCategoryVo;
import com.blog.personal.vo.TagVo;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import java.util.List;

@Data
public class ArticleParam {
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    private ArticleBodyParam body;
    private ArticleCategoryVo categoryVo;
    private String summary;
    private List<TagVo> tags;
    private String title;
}
