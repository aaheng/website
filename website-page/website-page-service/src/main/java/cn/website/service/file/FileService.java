package cn.website.service.file;

import cn.website.common.pojo.FileEntity;
import cn.website.mapper.file.FileMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("fileService")
public class FileService {

    @Resource(name = "fileMapper")
    private FileMapper fileMapper;

    public boolean insertFile(FileEntity fileEntity){
        return fileMapper.insertFile(fileEntity)>0?true:false;
    }

}
