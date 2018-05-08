package cn.website.service.video;

import cn.website.common.pojo.FileEntity;
import cn.website.mapper.video.VideoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class VideoService {
    @Autowired
    private VideoMapper videoMapper;

    public List<FileEntity> getVideoList(String type){
        List<FileEntity> videoList = videoMapper.getVideoList(type);
        return videoList;
    }

    public List<FileEntity> getVideoById(Integer id){
        return videoMapper.getVideoById(id);
    }

}
