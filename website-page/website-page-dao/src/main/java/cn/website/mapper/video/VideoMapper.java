package cn.website.mapper.video;

import cn.website.common.pojo.FileEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VideoMapper {

    public List<FileEntity> getVideoList(@Param("type") String type);

    public List<FileEntity> getVideoById(@Param("id") Integer id);
}
