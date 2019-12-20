package com.lb.lblog.controller.oss;

import com.lb.lblog.dto.ResponseResult;
import com.lb.lblog.utils.AliyunOssUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;


/**
 * @author LB
 * @create 2019-07-16 14:53
 */
@Controller
@RequestMapping("/oss")
public class AliyunOssController {

    @Autowired
    private  AliyunOssUtil aliyunOssUtil;

    /**
     * 上传本地图片
     *
     * @param file
     * @return
     */
    @RequestMapping("/upload")
    @ResponseBody
    public ResponseResult upLoad(@RequestParam("editormd-image-file") MultipartFile file) {
        ResponseResult responseResult = new ResponseResult();
        String filename = file.getOriginalFilename();
        System.out.println(filename);
        try {
            if (file != null) {
                if (!"".equals(filename.trim())) {
                    File newFile = new File(filename);
                    FileOutputStream outputStream = new FileOutputStream(newFile);
                    outputStream.write(file.getBytes());
                    outputStream.close();
                    file.transferTo(newFile);
                    String url = aliyunOssUtil.upLoad(newFile);
                    responseResult.setSuccess(1);
                    responseResult.setUrl(url);
                    responseResult.setMessage("上传成功");
                    //上传图片后会在idea生成一个文件，上传成功后将其删除
                    newFile.delete();
                }
            }
        } catch (FileNotFoundException e) {
            responseResult.setSuccess(0);
            responseResult.setMessage("上传失败");
            e.printStackTrace();
        } catch (IOException e) {
            responseResult.setSuccess(0);
            responseResult.setMessage("上传失败");
            e.printStackTrace();
        }
        return responseResult;
    }

    @RequestMapping("/image")
    @ResponseBody
    public ResponseResult image(@RequestParam("imageFile") MultipartFile file, Model model) {
        ResponseResult responseResult = new ResponseResult();
        String filename = file.getOriginalFilename();
        File newFile = new File(filename);
        System.out.println(filename);
        try {
            if (file != null) {
                if (!"".equals(filename.trim())) {
                    FileOutputStream outputStream = new FileOutputStream(newFile);
                    outputStream.write(file.getBytes());
                    outputStream.close();
                    file.transferTo(newFile);
                    String url = aliyunOssUtil.upLoad(newFile);
                    responseResult.setSuccess(1);
                    responseResult.setUrl(url);
                    responseResult.setMessage("上传成功");
                }
            }
        } catch (FileNotFoundException e) {
            responseResult.setSuccess(0);
            responseResult.setMessage("上传失败");
            e.printStackTrace();
        } catch (IOException e) {
            responseResult.setSuccess(0);
            responseResult.setMessage("上传失败");
            e.printStackTrace();
        } catch (MaxUploadSizeExceededException e){
            responseResult.setSuccess(0);
            responseResult.setMessage("文件太大,上传失败");
            e.printStackTrace();
        }
        //上传图片后会在idea生成一个文件，上传成功后将其删除
        newFile.delete();
        return responseResult;
    }
}
