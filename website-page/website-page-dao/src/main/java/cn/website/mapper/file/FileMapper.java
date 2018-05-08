package cn.website.mapper.file;

import cn.website.common.pojo.FileEntity;

public interface FileMapper {

    //将上传的文件存入数据库
    public int insertFile(FileEntity fileEntity);

}
