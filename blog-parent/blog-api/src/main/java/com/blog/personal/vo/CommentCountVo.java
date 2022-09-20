package com.blog.personal.vo;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

@Data
public class CommentCountVo {
    @JsonSerialize(using = ToStringSerializer.class)
    private Long articleId;
    private Integer count;
}
