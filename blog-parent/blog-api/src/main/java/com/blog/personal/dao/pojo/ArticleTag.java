package com.blog.personal.dao.pojo;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

@Data
public class ArticleTag {
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    private Long articleId;

    private Long tagId;
}
