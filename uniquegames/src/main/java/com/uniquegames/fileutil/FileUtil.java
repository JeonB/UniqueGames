package com.uniquegames.fileutil;

import com.uniquegames.vo.IntroVo;
import java.io.File;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {


    MultipartFile uploadFile;
    IntroVo vo;
    String root_path;


    public FileUtil(IntroVo vo, HttpServletRequest request) throws IOException {
        this.uploadFile = vo.getUploadFile();
        this.vo = vo;
        this.root_path = request.getSession().getServletContext().getRealPath("/");
    }
    public IntroVo getUpload() throws IOException {
        String attach_path = "\\resources\\upload\\";
        if(uploadFile!=null && !uploadFile.isEmpty()){
            String fileName = uploadFile.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String upload = uuid + "_" + fileName;
            uploadFile.transferTo(new File(root_path+attach_path + upload));
            vo.setUpload(upload);
        }
        return vo;
    }

}
