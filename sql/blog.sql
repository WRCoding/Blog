/*
 Navicat Premium Data Transfer

 Source Server         : L
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : l_blog

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 23/01/2020 16:16:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog_article_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_comment`;
CREATE TABLE `blog_article_comment`  (
  `id` bigint(40) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(40) NOT NULL,
  `comment_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_by` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除，默认为0，1为是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article_comment
-- ----------------------------
INSERT INTO `blog_article_comment` VALUES (1, 4, '林北', '测试评论！', '2019-07-28 10:51:18', '2019-08-16 17:10:36', 0);
INSERT INTO `blog_article_comment` VALUES (2, 4, '百事', '测试测试！！', '2019-07-28 10:53:32', '2019-08-16 17:03:09', 0);
INSERT INTO `blog_article_comment` VALUES (3, 4, 'Pepsi', '还是测试！', '2019-07-28 11:06:11', '2019-08-16 16:59:26', 0);
INSERT INTO `blog_article_comment` VALUES (4, 4, '柠檬', '测试测试测试', '2019-07-28 11:08:17', '2019-08-16 17:03:05', 0);
INSERT INTO `blog_article_comment` VALUES (5, 4, '林北', '依旧测试', '2019-07-28 11:10:43', '2019-08-16 16:59:26', 0);
INSERT INTO `blog_article_comment` VALUES (6, 4, '柠檬', '一直测试', '2019-07-28 11:12:29', '2019-08-16 16:59:26', 0);
INSERT INTO `blog_article_comment` VALUES (7, 4, '憨批', '测试', '2019-07-28 11:33:41', '2019-08-16 16:59:26', 0);
INSERT INTO `blog_article_comment` VALUES (8, 4, '憨憨', '害', '2019-07-28 11:36:48', '2019-08-17 10:12:48', 0);
INSERT INTO `blog_article_comment` VALUES (9, 7, '林北', '来啦老弟！', '2019-07-28 11:37:17', '2019-08-16 16:59:26', 0);
INSERT INTO `blog_article_comment` VALUES (10, 7, '哦吼', '怎么图片显示不出来啊？', '2019-07-28 12:10:54', '2019-08-16 17:05:09', 0);
INSERT INTO `blog_article_comment` VALUES (11, 3, '林北', '这是评论', '2019-07-29 18:38:18', '2019-08-17 10:12:48', 0);
INSERT INTO `blog_article_comment` VALUES (14, 8, 'pepsi', 'aop', '2019-08-21 10:26:20', '2019-08-21 10:26:20', 0);
INSERT INTO `blog_article_comment` VALUES (15, 10, '林北', '支持博主！！', '2019-08-27 15:58:44', '2019-08-27 15:58:44', 0);
INSERT INTO `blog_article_comment` VALUES (16, 10, '憨憨', '成功没', '2019-08-27 16:02:08', '2019-08-27 16:02:08', 0);
INSERT INTO `blog_article_comment` VALUES (17, 10, '图hello', '测试正则', '2019-08-28 12:28:59', '2019-08-28 12:28:59', 0);
INSERT INTO `blog_article_comment` VALUES (18, 16, '哈哈', '嘻嘻', '2019-09-22 14:11:39', '2019-09-22 14:11:39', 0);
INSERT INTO `blog_article_comment` VALUES (19, 18, '考呗', '哈哈哈哈', '2019-09-30 08:03:24', '2019-09-30 08:03:24', 0);
INSERT INTO `blog_article_comment` VALUES (20, 21, '林北', '点赞！', '2019-12-29 16:39:37', '2019-12-29 16:39:37', 0);
INSERT INTO `blog_article_comment` VALUES (21, 22, '哈士奇', '点赞点赞！！！', '2020-01-03 11:23:09', '2020-01-03 11:23:09', 0);
INSERT INTO `blog_article_comment` VALUES (22, 22, '柠檬', '哈士奇真棒！', '2020-01-03 11:24:08', '2020-01-03 11:24:08', 0);

-- ----------------------------
-- Table structure for blog_article_content
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_content`;
CREATE TABLE `blog_article_content`  (
  `id` bigint(40) NOT NULL AUTO_INCREMENT,
  `article_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章内容',
  `article_id` bigint(40) NOT NULL COMMENT '文章id,对应info的id',
  `create_by` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_by` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article_content
-- ----------------------------
INSERT INTO `blog_article_content` VALUES (3, '2019-07-17 21:54:16 星期三\n\n------------\n\n![](https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-07-27/411a2b5efdd1472ba8425940f55e0ae5-img_1.jpg)\n', 3, '2019-07-17 21:56:19', '2019-07-27 10:00:52');
INSERT INTO `blog_article_content` VALUES (4, '# SpringBoot\n**搭建博客**', 4, '2019-07-17 22:03:07', '2019-07-17 22:03:07');
INSERT INTO `blog_article_content` VALUES (5, 'LBpepsi', 5, '2019-07-19 16:12:30', '2019-07-26 10:57:13');
INSERT INTO `blog_article_content` VALUES (6, '# 测试测试测试', 6, '2019-07-19 17:05:49', '2019-07-19 17:05:49');
INSERT INTO `blog_article_content` VALUES (7, '>该博客是为了后面搭建博客做的前期准备\n\n## 使用阿里云OSS作图床\n在使用markdown写博客的时候，通常都需要放图片，而markdown需要图片的地址，网络图片还好说，但是本地图片就不太好办了，因此我们可以使用阿里云的OSS来作为我们的图床，把图片上传到阿里云的OSS，然后返回图片的URL用作地址\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190710165850402.png)\n**步骤：**\n**1.注册阿里云，购买OSS** \n[阿里云OSS](https://www.aliyun.com/product/oss?spm=5176.12825654.eofdhaal5.14.3dbd2c4aemxzOJ)\n**2.创建工程**\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190710170650869.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)\n导入相应的依赖\n\n```xml\n    <dependencies>\n        <dependency>\n            <groupId>org.springframework.boot</groupId>\n            <artifactId>spring-boot-starter-thymeleaf</artifactId>\n        </dependency>\n        <dependency>\n            <groupId>org.springframework.boot</groupId>\n            <artifactId>spring-boot-starter-web</artifactId>\n        </dependency>\n\n        <!-- 阿里云OSS-->\n        <dependency>\n            <groupId>com.aliyun.oss</groupId>\n            <artifactId>aliyun-sdk-oss</artifactId>\n            <version>2.4.0</version>\n        </dependency>\n        <dependency>\n            <groupId>commons-fileupload</groupId>\n            <artifactId>commons-fileupload</artifactId>\n            <version>1.3.1</version>\n        </dependency>\n        <dependency>\n            <groupId>org.springframework.boot</groupId>\n            <artifactId>spring-boot-configuration-processor</artifactId>\n            <optional>true</optional>\n        </dependency>\n\n\n        <dependency>\n            <groupId>org.springframework.boot</groupId>\n            <artifactId>spring-boot-starter-test</artifactId>\n            <scope>test</scope>\n        </dependency>\n    </dependencies>\n```\n**3.配置OSS的相关属性**\n\n```java\npublic class AliyunOssConfigConstant {\n    private AliyunOssConfigConstant(){}\n\n    //仓库名称\n    public static final String BUCKE_NAME = \"你的bucket名称\";\n    //地域节点\n    public static final String END_POINT = \"你的endpoint\";\n    //AccessKey ID\n    public static final String AccessKey_ID = \"你的AccessKey ID\";\n    //Access Key Secret\n    public static final String AccessKey_Secret = \"你的Access Key Secret\";\n    //仓库中的文件夹\n    public static final String FILE_HOST = \"你的文件夹名称\";\n}\n```\n除了通过常量类来配置，你还可以通过配置文件来配置，再将其注入到一个配置类中\n\n**4.编写工具类，即文件上传的方法**\n\n```java\n@Component\npublic class AliyunOssUtil {\n    private static String File_URL;\n    private static String bucketName = AliyunOssConfigConstant.BUCKE_NAME;\n    private static String endPoint = AliyunOssConfigConstant.END_POINT;\n    private static String accessKeyId = AliyunOssConfigConstant.AccessKey_ID;\n    private static String accessKeySecret = AliyunOssConfigConstant.AccessKey_Secret;\n    private static String fileHost = AliyunOssConfigConstant.FILE_HOST;\n\n    public  String upLoad(File file){\n        boolean isImage = true;\n        try {\n            Image image = ImageIO.read(file);\n            isImage = image == null?false:true;\n        }catch (Exception e){\n            e.printStackTrace();\n        }\n        SimpleDateFormat format = new SimpleDateFormat(\"yyyy-MM-dd\");\n        String dateStr = format.format(new Date());\n\n        if(file == null){\n            return null;\n        }\n\n        OSSClient ossClient = new OSSClient(endPoint,accessKeyId ,accessKeySecret );\n        try {\n            if(!ossClient.doesBucketExist(bucketName)){\n                ossClient.createBucket(bucketName);\n                CreateBucketRequest createBucketRequest = new CreateBucketRequest(bucketName);\n                createBucketRequest.setCannedACL(CannedAccessControlList.PublicRead);\n                ossClient.createBucket(createBucketRequest);\n            }\n            //设置文件路径,这里再通过时间分成子文件夹\n            String fileUrl = fileHost + \"/\" + (dateStr + \"/\" + UUID.randomUUID().toString().replace(\"-\", \"\")+\"-\"+file.getName());\n            //如果是图片\n            if(isImage){\n                File_URL = \"https://\" + bucketName + \".\" + endPoint + \"/\" + fileUrl;\n            }else {\n                File_URL = \"非图片，不可预览。文件路径为：\" + fileUrl;\n            }\n            //上传文件\n            PutObjectResult result = ossClient.putObject(new PutObjectRequest(bucketName, fileUrl, file));\n            //设置公开读权限\n            ossClient.setBucketAcl(bucketName,CannedAccessControlList.PublicRead);\n        }catch (Exception e){\n            e.printStackTrace();\n        }finally {\n            if(ossClient != null){\n                ossClient.shutdown();\n            }\n        }\n        return File_URL;\n    }\n}\n\n```\n\n**5.编写controller**\n\n```java\n@Controller\n@RequestMapping(\"/oss\")\npublic class AliyunOssController {\n    @Autowired\n    private AliyunOssUtil aliyunOssUtil;\n\n    @RequestMapping(\"/upload\")\n    public String testUpload(@RequestParam(\"file\")MultipartFile file, Model model){\n        String filename = file.getOriginalFilename();\n        System.out.println(filename);\n        try {\n            if(file != null){\n                if(!\"\".equals(filename.trim())){\n                    File newFile = new File(filename);\n                    FileOutputStream outputStream = new FileOutputStream(newFile);\n                    outputStream.write(file.getBytes());\n                    outputStream.close();\n                    file.transferTo(newFile);\n                    //返回图片的URL\n                    String url = aliyunOssUtil.upLoad(newFile);\n                    model.addAttribute(\"url\",url );\n                }\n            }\n        } catch (FileNotFoundException e) {\n            e.printStackTrace();\n        } catch (IOException e) {\n            e.printStackTrace();\n        }\n        return \"success\";\n    }\n}\n```\n**6.编写界面，界面可实现图片预览**\n\nindex.html\n```html\n<body>\n    <form action=\"/oss/upload\" enctype=\"multipart/form-data\" method=\"post\">\n        <div class=\"form-group\" id=\"group\">\n            <input type=\"file\" id=\"img_input\" name=\"file\" accept=\"image/*\">\n            <label for=\"img_input\" ></label>\n        </div>\n        <button type=\"submit\" id=\"submit\">上传</button>\n        <!--预览图片-->\n        <div class=\"preview_box\"></div>\n    </form>\n    <script type=\"text/javascript\">\n\n        $(\"#img_input\").on(\"change\", function (e) {\n            var file = e.target.files[0]; //获取图片资源\n            // 只选择图片文件\n            if (!file.type.match(\'image.*\')) {\n                return false;\n            }\n            var reader = new FileReader();\n            reader.readAsDataURL(file); // 读取文件\n            // 渲染文件\n            reader.onload = function (arg) {\n\n                var img = \'<img class=\"preview\" src=\"\' + reader.result + \'\" alt=\"preview\"/>\';\n                $(\".preview_box\").empty().append(img);\n            }\n        });\n    </script>\n</body>\n```\n![](https://img-blog.csdnimg.cn/201907101721340.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)\n\nsuccess.html\n\n```html\n<body>\n<h1>上传成功！</h1>\n图片地址为：<span th:text=\"${url}\"></span>\n</body>\n```\n![](https://img-blog.csdnimg.cn/20190710172155361.png)\n\n\n## springboot使用editormd\neditor.md是国人写的markdown开源工具，官网实例在 [editor.md](http://pandao.github.io/editor.md/examples/index.html)\neditor.md下载  [下载](http://pandao.github.io/editor.md/)\n\n这是它的一个简单例子\n![](https://img-blog.csdnimg.cn/20190710172747292.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)\n**首先创建工程**\n![](https://img-blog.csdnimg.cn/20190710172954715.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)\n**导入相应的依赖**\n\n```xml\n	<dependencies>\n		<dependency>\n			<groupId>org.springframework.boot</groupId>\n			<artifactId>spring-boot-starter-thymeleaf</artifactId>\n		</dependency>\n		<dependency>\n			<groupId>org.springframework.boot</groupId>\n			<artifactId>spring-boot-starter-web</artifactId>\n		</dependency>\n\n		<!-- 阿里云OSS-->\n		<dependency>\n			<groupId>com.aliyun.oss</groupId>\n			<artifactId>aliyun-sdk-oss</artifactId>\n			<version>2.4.0</version>\n		</dependency>\n		<dependency>\n			<groupId>commons-fileupload</groupId>\n			<artifactId>commons-fileupload</artifactId>\n			<version>1.3.1</version>\n		</dependency>\n\n		<dependency>\n			<groupId>org.springframework.boot</groupId>\n			<artifactId>spring-boot-starter-test</artifactId>\n			<scope>test</scope>\n		</dependency>\n	</dependencies>\n```\n\n**接着引入css和js等相关样式和插件**\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190710173216243.png)\n**创建editor界面**\n\n```html\n<!DOCTYPE html>\n<html lang=\"zh\" xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:th=\"http://www.thymeleaf.org\">\n<head>\n    <meta charset=\"utf-8\" />\n    <title>Simple example - Editor.md examples</title>\n    <link rel=\"stylesheet\" th:href=\"@{/css/style.css}\"  />\n    <link rel=\"stylesheet\" th:href=\"@{/css/editormd.css}\"  />\n    <link rel=\"shortcut icon\" href=\"https://pandao.github.io/editor.md/favicon.ico\" type=\"image/x-icon\" />\n</head>\n<body>\n<div id=\"layout\">\n    <header>\n        <h1>Simple example</h1>\n    </header>\n	\n	    <!--form表单包裹，可上传-->\n    <form action=\"/mark/save\" method=\"post\">\n        <div class=\"editormd\" id=\"test-editormd\">\n            <textarea class=\"editormd-markdown-textarea\"  id=\"content\" name=\"text\"></textarea>\n        </div>\n        <div>\n            <input type=\"submit\" value=\"提交\">\n        </div>\n    </form>\n</div>\n<script th:src=\"@{/js/jquery.min.js}\"></script>\n<script th:src=\"@{/js/editormd.min.js}\"></script>\n<script type=\"text/javascript\">\n    var testEditor;\n\n    $(function() {\n        testEditor = editormd(\"test-editormd\", {\n            width   : \"90%\",\n            height  : 640,\n            syncScrolling : \"single\",\n            path    : \"/lib/\",\n            //开启图片上传\n            imageUpload : true,\n            //图片上传支持的格式\n            imageFormats : [\"jpg\", \"jpeg\", \"gif\", \"png\", \"bmp\", \"webp\"],\n            //图片上传的路径\n            imageUploadURL : \"/mark/upload\",\n            // saveHTMLToTextarea : true\n        });\n    });\n</script>\n</body>\n</html>\n```\n**编写controller**\n\n```java\n  /**\n     * 保存markdown源码\n     * @param text\n     * @return\n     */\n    @RequestMapping(\"/save\")\n    public ModelAndView save(String text){\n        ModelAndView modelAndView = new ModelAndView();\n        modelAndView.addObject(\"markdown\",text );\n        modelAndView.setViewName(\"preview\");\n        System.out.println(text);\n        return modelAndView;\n    }\n\n    /**\n     * 上传本地图片\n     * @param file\n     * @param model\n     * @return\n     */\n    @RequestMapping(\"/upload\")\n    @ResponseBody\n    public ResponseResult testUpload(@RequestParam(\"editormd-image-file\")MultipartFile file, Model model){\n        logger.info(\"文件上传\");\n        ResponseResult responseResult = new ResponseResult();\n        String filename = file.getOriginalFilename();\n        System.out.println(filename);\n        try {\n            if(file != null){\n                if(!\"\".equals(filename.trim())){\n                    File newFile = new File(filename);\n                    FileOutputStream outputStream = new FileOutputStream(newFile);\n                    outputStream.write(file.getBytes());\n                    outputStream.close();\n                    file.transferTo(newFile);\n                    String url = aliyunOssUtil.upLoad(newFile);\n                    responseResult.setSuccess(1);\n                    responseResult.setUrl(url);\n                    responseResult.setMessage(\"上传成功\");\n                }\n            }\n        } catch (FileNotFoundException e) {\n            responseResult.setSuccess(0);\n            responseResult.setMessage(\"上传失败\");\n            e.printStackTrace();\n        } catch (IOException e) {\n            responseResult.setSuccess(0);\n            responseResult.setMessage(\"上传失败\");\n            e.printStackTrace();\n        }\n        return responseResult;\n    }\n```\n图片上传返回的JSON数据必须为如下格式\n\n```json\n{\n    success : 0 | 1,           // 0 表示上传失败，1 表示上传成功\n    message : \"提示的信息，上传成功或上传失败及错误信息等。\",\n    url     : \"图片地址\"        // 上传成功时才返回\n}\n```\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190710174144662.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)\n\n**将markdown转换成html并展示**\n\n```html\n<!DOCTYPE html>\n<html lang=\"zh\" xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:th=\"http://www.thymeleaf.org\">\n<head>\n    <meta charset=\"UTF-8\">\n    <title>Title</title>\n    <!--css-->\n    <link rel=\"stylesheet\" th:href=\"@{/css/style.css}\">\n    <link rel=\"stylesheet\" th:href=\"@{/css/editormd.preview.css}\">\n    <!--js-->\n    <script th:src=\"@{/js/jquery.min.js}\"></script>\n    <script th:src=\"@{/js/marked.min.js}\"></script>\n    <script th:src=\"@{/js/prettify.min.js}\"></script>\n    <script th:src=\"@{/js/raphael.min.js}\"></script>\n    <script th:src=\"@{/js/underscore.min.js}\"></script>\n    <script th:src=\"@{/js/sequence-diagram.min.js}\"></script>\n    <script th:src=\"@{/js/flowchart.min.js}\"></script>\n    <script th:src=\"@{/js/jquery.flowchart.min.js}\"></script>\n    <script th:src=\"@{/js/editormd.js}\"></script>\n</head>\n<body>\n    <div id=\"markdown-to-html\" class=\"markdown-body editormd-html-preview\" >\n        <textarea style=\"display:none;\" name=\"editormd-markdown-doc\" id=\"mdText\" th:text=\"${markdown}\"></textarea>\n    </div>\n    <script type=\"text/javascript\">\n        var markdowntohtml;\n        $(function () {\n            markdowntohtml = editormd.markdownToHTML(\"markdown-to-html\", {\n                htmlDecode: \"true\", // you can filter tags decode\n                emoji: true,\n                taskList: true,\n                tex: true,\n                flowChart: true,\n                sequenceDiagram: true\n            });\n        })\n    </script>\n</body>\n</html>\n```\n**转换前**\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190710174554298.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)\n**转换后**\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190710174729717.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)\n\n完整代码在我的[GitHub](https://github.com/WRCoding/SpringBoot/tree/master/markdown)', 7, '2019-07-20 09:50:53', '2019-07-20 09:50:53');
INSERT INTO `blog_article_content` VALUES (8, '![](https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-07-21/a5df9e10d21c4fc6a3784b3d470f9134-666.png)\n\n---\n\n![](https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-07-21/16a31afdf751427cad64b8ec1db3cd13-888.png)\n\n---\n![](https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-07-21/77c2a4a51eae465e93a0e49b6eff0853-777.png)\n\n**2.测试换行**', 8, '2019-07-21 10:13:19', '2019-07-21 10:13:19');
INSERT INTO `blog_article_content` VALUES (9, '# 这是个测试博客\n## 这是个测试博客\n### 这是个测试博客\n#### 这是个测试博客\n##### 这是个测试博客\n###### 这是个测试博客', 9, '2019-07-27 10:56:53', '2019-07-27 10:56:53');
INSERT INTO `blog_article_content` VALUES (10, '## 数组\n**从排序数组中删除重复项**\n\n给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。\n不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。\n\n**示例一**\n```text\n给定数组 nums = [1,1,2], \n函数应该返回新的长度 2, 并且原数组 nums 的前两个元素被修改为 1, 2。 \n你不需要考虑数组中超出新长度后面的元素。\n```\n**示例二**\n```text\n给定 nums = [0,0,1,1,1,2,2,3,3,4],\n函数应该返回新的长度 5, 并且原数组 nums 的前五个元素被修改为 0, 1, 2, 3, 4。\n你不需要考虑数组中超出新长度后面的元素。\n```\n思路：起初是想用hashset的不可重复性，但是题目要求只能在原地操作，所以用两个指针对数组进行遍历比较\n\nCode:\n```java\nclass Solution {\n    public int removeDuplicates(int[] nums) {\n       if(nums==null)\n			return 0;\n		int i=0;\n		for(int j=0;j<nums.length-1;j++){\n			if(nums[j]!=nums[j+1]){\n				i++;\n				nums[i]=nums[j+1];\n			}\n		}\n		return i+1;\n    }\n}\n```\n**买卖股票的最佳时机 II**\n给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。\n设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。\n注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。\n\n**示例一**\n```text\n输入: [7,1,5,3,6,4]\n输出: 7\n解释: 在第 2 天（股票价格 = 1）的时候买入，在第 3 天（股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。\n     随后，在第 4 天（股票价格 = 3）的时候买入，在第 5 天（股票价格 = 6）的时候卖出, 这笔交易所能获得利润 = 6-3 = 3 。\n```\n**示例二**\n```text\n输入: [1,2,3,4,5]\n输出: 4\n解释: 在第 1 天（股票价格 = 1）的时候买入，在第 5 天 （股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。\n     注意你不能在第 1 天和第 2 天接连购买股票，之后再将它们卖出。\n     因为这样属于同时参与了多笔交易，你必须在再次购买前出售掉之前的股票。\n```\n**示例三**\n```text\n输入: [7,6,4,3,1]\n输出: 0\n解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。\n```\n思路：采用双指针，前一天的价格对比第二天的价格，如果大于不买入，小于则买入，第二天卖出\n\nCode:\n```java\nclass Solution {\n    public int maxProfit(int[] prices) {\n        if(prices == null || prices.length == 0 || prices.length == 1){\n            return 0;\n        }\n        int sum = 0;\n        int i = 0;\n        for(int j=1;j<prices.length;j++){\n            if(prices[i]<prices[j]){\n                sum += prices[j]-prices[i];\n                i++;\n            }else{\n                 i++;\n            }\n        }\n        return sum;\n    }\n}\n```\n**选择数组**\n给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。\n**示例一**\n```text\n输入: [1,2,3,4,5,6,7] 和 k = 3\n输出: [5,6,7,1,2,3,4]\n解释:\n向右旋转 1 步: [7,1,2,3,4,5,6]\n向右旋转 2 步: [6,7,1,2,3,4,5]\n向右旋转 3 步: [5,6,7,1,2,3,4]\n```\n**示例二**\n```text\n输入: [-1,-100,3,99] 和 k = 2\n输出: [3,99,-1,-100]\n解释: \n向右旋转 1 步: [99,-1,-100,3]\n向右旋转 2 步: [3,99,-1,-100]\n```\n思路：看代码就可，k%nums.length是因为，当K比数组本身大的时候，只需要移动超过数组长度那部分的次数即可\n\nCode:\n```java\nclass Solution {\n    public void rotate(int[] nums, int k) {\n        int[] num = new int[nums.length];\n        int i = 0;\n        k = k%nums.length;\n        for(int j = nums.length-k;j<nums.length;j++){\n            num[i] = nums[j];\n            i++;\n        }\n        for(int j = 0;j<nums.length-k;j++){\n            num[i] = nums[j];\n            i++;\n        }\n        for(int j = 0;j<nums.length;j++){\n            nums[j] = num[j];\n        }\n    }\n}\n```\n**存在重复**\n给定一个整数数组，判断是否存在重复元素。\n如果任何值在数组中出现至少两次，函数返回 true。如果数组中每个元素都不相同，则返回 false。\n\n**示例一**\n```text\n输入: [1,2,3,1]\n输出: true\n```\n**示例二**\n```text\n输入: [1,2,3,4]\n输出: false\n```\n思路：利用HashSet的不可重复性，将数组的元素添加到HashSet中，如果HashSet的长度等于数组长度则说明没有重复的，小于则代表有重复的\n\nCode:\n```java\nclass Solution {\n    public boolean containsDuplicate(int[] nums) {\n        HashSet hashSet = new HashSet();\n        if(nums == null || nums.length ==0 ||nums.length == 1){\n            return false;\n        }else{\n             for(int i =0;i<nums.length;i++){\n            hashSet.add(nums[i]);\n        }\n        if(hashSet.size() < nums.length){\n            return true;\n        }else{\n            return false;\n        }\n        }      \n    }\n}\n```\n**只出现一次的数字**\n给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。\n**示例一**\n```text\n输入: [2,2,1]\n输出: 1\n```\n**示例二**\n```text\n输入: [4,1,2,1,2]\n输出: 4\n```\n思路：一开始想的是，用HashMap，key为元素值，value为元素值出现的个数，如果用HashMap包含该元素，value加一，最后遍历key，找到value为1的key\n\nCode:\n```java\nclass Solution {\n    public int singleNumber(int[] nums) {\n        if(nums.length == 1){\n            return nums[0];\n        }\n        int value = 0;\n        HashMap<Integer,Integer> hashMap = new HashMap<>();\n        for(int i = 0; i<nums.length;i++){\n            int count = 1;\n            if(!hashMap.containsKey(nums[i])){\n                hashMap.put(nums[i],count);\n            }else{\n                count = hashMap.get(nums[i]);\n                count++;\n                hashMap.put(nums[i],count);\n            }\n        }\n        Iterator iter = hashMap.keySet().iterator();\n        while (iter.hasNext()) {\n            int key = 0;\n            int integ = 0;\n        // 获取key\n             key = (int)iter.next();\n        // 根据key，获取value\n            integ = (int)hashMap.get(key);\n            if(integ == 1){\n                value = key;\n            }\n        }\n        return value;\n    }\n}\n```\n思路二：第一种思路是可以执行，但是效率很慢，在网上看到了使用异或来进行判断，代码少，而且效率高，相同数字异或为0，0与任何数异或为其本身\n\nCode2:\n```java\nclass Solution {\n    public int singleNumber(int[] nums) {\n        int num = 0;\n        for(int i = 0;i<nums.length;i++){\n            num = num^nums[i];\n        }\n        return num;\n    }\n}\n```\n**两个数组的交集 II**\n给定两个数组，编写一个函数来计算它们的交集。\n**示例一**\n```text\n输入: nums1 = [1,2,2,1], nums2 = [2,2]\n输出: [2,2]\n```\n**示例二**\n```text\n输入: nums1 = [4,9,5], nums2 = [9,4,9,8,4]\n输出: [4,9]\n```\n说明：\n- 输出结果中每个元素出现的次数，应与元素在两个数组中出现的次数一致。\n- 我们可以不考虑输出结果的顺序。\n\n思路：使用HashMap，数组元素为key,出现次数为value，先把数组一的元素添加到HashMap中，接着数组二根据HashMap中的值进行判断\n\nCode:\n```java\nclass Solution {\n   public int[] intersect(int[] nums1, int[] nums2) {\n		  ArrayList<Integer> list = new ArrayList<>();\n\n		    Map<Integer, Integer> map = new HashMap<Integer, Integer>();\n\n		    for (int i = 0; i < nums1.length; i++) {\n		        Integer value = map.get(nums1[i]);\n		        map.put(nums1[i], (value == null ? 0 : value) + 1);\n		    }\n\n		    for (int i = 0; i < nums2.length; i++) {\n		        if (map.containsKey(nums2[i]) && map.get(nums2[i]) != 0) {\n		            list.add(nums2[i]);\n		            map.put(nums2[i], map.get(nums2[i]) - 1);\n		        }\n		    }\n\n		    int[] nums3 = new int[list.size()];\n		    int i = 0;\n		    for (Integer e : list)\n		        nums3[i++] = e;\n		    return nums3;\n}\n}\n```', 10, '2019-08-11 22:22:36', '2019-09-12 09:08:37');
INSERT INTO `blog_article_content` VALUES (11, '撒大大萨达萨达萨达是', 11, '2019-09-13 15:35:07', '2019-09-13 15:35:07');
INSERT INTO `blog_article_content` VALUES (12, '啊倒萨打算', 15, '2019-09-13 16:24:59', '2019-09-13 16:24:59');
INSERT INTO `blog_article_content` VALUES (13, 'asdasdasd\n![](https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-09-15/f3fe0fb7e8854d3ba1e390469031dba1-v2-12ad3b0ada1300b7d89796d62ebcdf68_r.jpg)', 16, '2019-09-15 19:49:19', '2019-09-15 19:49:19');
INSERT INTO `blog_article_content` VALUES (14, '## Redis\nredis是一个key-value的NOSQL数据库，读写的速度很快', 17, '2019-09-29 14:34:55', '2019-09-29 14:34:55');
INSERT INTO `blog_article_content` VALUES (15, '## LPepsi\nLPepsi\nLPepsi\n', 18, '2019-09-29 14:44:26', '2019-09-30 08:02:46');
INSERT INTO `blog_article_content` VALUES (16, '![](https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-12-21/4e01a2b8309542a8b62a98cbc2104c01-img_6.jpg)\n**测试**\n# 哈哈哈哈哈\n', 19, '2019-12-21 11:03:04', '2019-12-21 11:03:04');
INSERT INTO `blog_article_content` VALUES (17, '# 哈士奇\n![](https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-12-21/7517edbe988e466099fbd8bcff92968f-Dog.png)', 20, '2019-12-21 14:58:54', '2019-12-21 14:58:54');
INSERT INTO `blog_article_content` VALUES (18, '## 前言\n写这篇博客的缘由是之前在做网易的笔试的时候，简答题问了浅拷贝和深拷贝的区别和在Java的实现，因为之前都没了解过深，浅拷贝所以白白丢分，所以今天就查阅了资料，好好整理下深，浅拷贝的区别\n\n## 深拷贝和浅拷贝\n**浅拷贝：** 浅拷贝指的是把原对象的所有属性都拷贝到新对象上去，如果字段是值类型的，那么对该字段执行复制；如果该字段是引用类型的话，则复制引用但不复制引用的对象。因此，原始对象及其新对象引用同一个对象。但是String例外，为啥我们下面会讲\n\n**深拷贝：** 深拷贝指的是把原对象的所有属性都复制一份新的再拷贝到新对象上，也就是无论该字段是值类型的还是引用类型，都复制独立的一份。当你修改其中一个对象的任何内容时，都不会影响另一个对象的内容。\n\n## 实现\n浅拷贝通过**clone()方法**实现，clone属于Object里的方法，也就是说所有对象都可以拷贝\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190923093735884.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)\n但是要让类能够实现拷贝，类必须实现**Cloneable**接口，否则会抛出**CloneNotSupportedException** 异常\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190923145632387.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)\n简单来说就是在拷贝的时候，clone()会先检查你要拷贝的类是否实现了**Cloneable**接口，如果没有会抛出异常。\n\n## 实现\n**浅拷贝**\n我们先写一个Son类\n\n```java\npublic class Son implements Cloneable, Serializable {\n    private String name = \"I am son\";\n    private Integer age = 21;\n\n    public String getName() {\n        return name;\n    }\n\n    public void setName(String name) {\n        this.name = name;\n    }\n\n    public Integer getAge() {\n        return age;\n    }\n\n    public void setAge(Integer age) {\n        this.age = age;\n    }\n\n    @Override\n    protected Object clone() throws CloneNotSupportedException {\n        return super.clone();\n    }\n}\n```\n再写一个Father类，类中有Son对象, **注意：必须实现Cloneable接口**\n\n```java\npublic class Father implements Cloneable, Serializable {\n    private String name = \"I am father\";\n    private Integer age = 30;\n    private Son son = new Son();\n\n    public String getName() {\n        return name;\n    }\n\n    public void setName(String name) {\n        this.name = name;\n    }\n\n    public Integer getAge() {\n        return age;\n    }\n\n    public void setAge(Integer age) {\n        this.age = age;\n    }\n\n    public Son getSon() {\n        return son;\n    }\n\n    public void setSon(Son son) {\n        this.son = son;\n    }\n        @Override\n    protected Object clone() throws CloneNotSupportedException {\n        	return super.clone();\n    }\n}\n```\n测试：\n\n```java\n    public static void main(String[] args) {\n        Father father = new Father();\n        try {\n            Father ganFather = (Father) father.clone();\n            System.out.println(\"ganFather == father : \"+ (ganFather == father));\n            System.out.println(\"ganFather: \"+ganFather);\n            System.out.println(\"father: \"+father);\n            System.out.println(\"ganFather.getName() == father.getName() : \"+(ganFather.getName() == father.getName()));\n            System.out.println(ganFather.getName().hashCode());\n            System.out.println(father.getName().hashCode());\n            father.setName(\"Father\");\n            System.out.println(father.getName()+\" , \"+ganFather.getName());\n            father.setAge(55);\n            System.out.println(father.getAge()+\" , \"+ganFather.getAge());\n            System.out.println(\"ganFather.getSon() == father.getSon() : \"+(ganFather.getSon() == father.getSon()));\n            System.out.println(\"ganFather.getSon() : \"+ganFather.getSon());\n            System.out.println(\"father.getSon() : \"+father.getSon());\n            father.getSon().setName(\"Son\");\n            System.out.println(father.getSon().getName()+\" , \"+ganFather.getSon().getName());\n        } catch (Exception e) {\n            e.printStackTrace();\n        }\n    }\n```\n结果：\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190923150405263.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)\n从结果可以看到，父亲的名字和年龄改变了，但干爹的对应数据没有改变，但是修改父亲中儿子的名字，干爹中儿子的名字也跟着改变了，这就是因为浅拷贝只复制了对象的引用。\n可能有人要问String也是引用类型，为啥父亲中String类型的name改变，干爹对应的却没有变呢，这是因为String是不可变的，指向常量池，因为String的不可变性，改变name时并不是改变它本身，而是新创建了个字符串并指向他\n\n初始：\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190923153549351.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)\n修改name之后：\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190923153759336.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)\n可以看到父亲的引用改变了但干爹的引用并没有改变，所以String虽然是引用类型，但是它的改变并不会影响原始对象或者新对象。\n\n而改变父亲Son的名字，干爹Son的名字也会改变是因为，他们引用的是同一个对象\n\n初始：\n\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190923155438600.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)\n修改name之后：\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190923160509231.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)\n所以修改原对象的引用类型，新对象的引用类型也会跟着改变\n\n**深拷贝**\n深拷贝有两种方法\n\n - **让每个引用类型都重写clone() 方法**\n既然引用类型不能实现深拷贝，那么我们将每个引用类型都拆分为基本类型，分别进行浅拷贝。比如上面的例子，Father类有一个引用类型 Son，我们在 Son类内部也重写 clone 方法。如下：\n\n```java\n	Son类\n    @Override\n    protected Object clone() throws CloneNotSupportedException {\n        return super.clone();\n    }\n    Father类\n        @Override\n    protected Object clone() throws CloneNotSupportedException {\n        Father father = (Father) super.clone();\n        father.son = (Son) father.son.clone();\n        return father;\n//        return super.clone();\n    }\n```\n测试跟上面一样，结果如下：\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190923162903110.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)\n可以看到Son是两个对象，父亲的Son改变并没有影响干爹的Son。\n这方法简单，但是有个弊端，这里我们Father类只有一个 Son 引用类型，而 Son 类没有，所以我们只用重写 Son 类的clone 方法，但是如果 Son 类也存在一个引用类型，那么我们也要重写其clone 方法，这样下去，有多少个引用类型，我们就要重写多少次，如果存在很多引用类型，那么代码量显然会很大，所以这种方法不太合适。\n\n - 序列化\n\n序列化是将对象写到流中便于传输，而反序列化则是把对象从流中读取出来。这里将对象序列化写到缓冲区中，然后通过反序列化从缓冲区中获取这个对象。\n\n**注意每个需要序列化的类都要实现 Serializable 接口，如果有某个属性不需要序列化，可以将其声明为 transient，即将其排除在克隆属性之外。**\n\n```java\n    public Father deepClone() throws Exception {\n        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();\n        ObjectOutputStream objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);\n        objectOutputStream.writeObject(this);\n        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(byteArrayOutputStream.toByteArray());\n        ObjectInputStream objectInputStream = new ObjectInputStream(byteArrayInputStream);\n        return (Father) objectInputStream.readObject();\n    }\n```\n\n因为序列化产生的是两个完全独立的对象，所以无论嵌套多少个引用类型，序列化都是能实现深拷贝的。\n', 21, '2019-12-29 16:38:16', '2019-12-29 16:38:16');
INSERT INTO `blog_article_content` VALUES (19, '# 测试用户访问量\n测试用户访问量\n测试用户访问量**测试用户访问量**\n测试用户访问量\n测试用户访问量\n测试用户访问量测试用户访问量\n测试用户访问量\n测试用户访问量\n测试用户访问量', 22, '2020-01-03 11:22:30', '2020-01-03 11:22:30');
INSERT INTO `blog_article_content` VALUES (20, '# 测试分类功能\n# 测试分类功能\n# 测试分类功能\n## 测试分类功能\n---\n![](https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2020-01-05/10b6eb4aa0a34e039d55241e5ac858f2-img_6.jpg)', 23, '2020-01-03 16:21:09', '2020-01-05 10:39:50');

-- ----------------------------
-- Table structure for blog_article_image
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_image`;
CREATE TABLE `blog_article_image`  (
  `id` bigint(40) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(40) NOT NULL COMMENT '对应文章id',
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片url',
  `create_by` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_by` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '这张表用来保存题图url，每一篇文章都应该有题图' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article_image
-- ----------------------------
INSERT INTO `blog_article_image` VALUES (2, 3, 'https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-07-27/05a1717b4f1c47249b1fcc3655cee8a3-wallls.com_203921.jpg', '2019-07-17 21:56:19', '2019-07-27 10:00:52');
INSERT INTO `blog_article_image` VALUES (3, 4, 'https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-07-26/f8dc83eea23a4e828635234d21e3249e-img_1.jpg', '2019-07-17 22:03:07', '2019-07-26 11:41:10');
INSERT INTO `blog_article_image` VALUES (4, 5, 'https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-07-26/5e94dfa6d305421ebd0bdc24553db65f-img_2.jpg', '2019-07-19 16:12:30', '2019-07-26 11:12:46');
INSERT INTO `blog_article_image` VALUES (5, 6, 'https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-07-27/cfc497c5c9e54ef0b850146e227f9643-spiderman.jpg', '2019-07-19 17:05:49', '2019-07-27 15:39:11');
INSERT INTO `blog_article_image` VALUES (6, 7, 'https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-08-27/20b28b8fcdf34be680f820fbdce7e510-dgeqoj.jpg', '2019-07-20 09:50:53', '2019-08-27 15:37:49');
INSERT INTO `blog_article_image` VALUES (7, 8, 'https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-07-27/0d5d3a9655704a5ea5dfeb912740b513-wallls.com_203921.jpg', '2019-07-21 10:13:19', '2019-07-27 15:29:14');
INSERT INTO `blog_article_image` VALUES (8, 9, 'https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-07-27/5304e37fb280419cb9ef8ba052c4c6d6-spiderman.jpg', '2019-07-27 10:56:53', '2019-07-27 10:56:53');
INSERT INTO `blog_article_image` VALUES (9, 10, 'https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-08-11/ebddd2e999f745feb501cd58e395cfbd-img_5.jpg', '2019-08-11 22:22:36', '2019-08-11 22:22:36');
INSERT INTO `blog_article_image` VALUES (10, 11, 'https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-09-13/e4124e954f4c43ee9d502cd0dc0b3f28-v2-12ad3b0ada1300b7d89796d62ebcdf68_r.jpg', '2019-09-13 15:35:07', '2019-09-13 15:35:07');
INSERT INTO `blog_article_image` VALUES (11, 15, 'https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-09-13/a7f364d7eab14e6d947c9a0830cbf487-img_5.jpg', '2019-09-13 16:24:59', '2019-09-13 16:24:59');
INSERT INTO `blog_article_image` VALUES (12, 16, 'https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-09-15/19a51bdc4f544f79ae27bf7edbeba261-wallhaven-0prol9.png', '2019-09-15 19:49:19', '2019-09-15 19:49:19');
INSERT INTO `blog_article_image` VALUES (13, 17, 'https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-09-29/b8ef7bb7b1ce42b1bc391ecc1ea18a85-img_6.jpg', '2019-09-29 14:34:55', '2019-09-29 14:34:55');
INSERT INTO `blog_article_image` VALUES (14, 18, 'https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-09-29/be2b887e07624578a57fa10521c9defb-v2-12ad3b0ada1300b7d89796d62ebcdf68_r.jpg', '2019-09-29 14:44:26', '2019-09-29 14:44:26');
INSERT INTO `blog_article_image` VALUES (15, 19, 'https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-12-21/21861e3b6938492ebc0f3a76f589ab94-kwkg5q.jpg', '2019-12-21 11:03:04', '2019-12-21 11:03:04');
INSERT INTO `blog_article_image` VALUES (16, 20, 'https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-12-21/3b05d199d6454225ab2b487864530a78-Dog2.png', '2019-12-21 14:58:54', '2019-12-21 14:58:54');
INSERT INTO `blog_article_image` VALUES (17, 21, 'https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2019-12-29/5bdc356d263646b59d84a67675faff2b-IMG_4045.JPG', '2019-12-29 16:38:16', '2019-12-29 16:38:16');
INSERT INTO `blog_article_image` VALUES (18, 22, 'https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2020-01-03/585a4639eab24431a24c6e11452bc9c3-Dog.png', '2020-01-03 11:22:30', '2020-01-03 11:22:30');
INSERT INTO `blog_article_image` VALUES (19, 23, 'https://lpepsi.oss-cn-shenzhen.aliyuncs.com/pepsi/2020-01-03/5c57fc0ee91644a3b8be2ccec89951d4-kwkg5q.jpg', '2020-01-03 16:21:09', '2020-01-03 16:21:09');

-- ----------------------------
-- Table structure for blog_article_info
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_info`;
CREATE TABLE `blog_article_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '作者',
  `article_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `article_views` int(10) NOT NULL DEFAULT 0 COMMENT '访问量',
  `create_by` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_by` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除，默认为0，1为是',
  `like_num` int(10) NOT NULL DEFAULT 0 COMMENT '点赞数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_title`(`article_title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article_info
-- ----------------------------
INSERT INTO `blog_article_info` VALUES (3, '林北', 'ssm搭建博客', 2, '2019-07-17 21:56:19', '2019-12-08 09:58:50', 0, 0);
INSERT INTO `blog_article_info` VALUES (4, '林北', 'springmvc+mybatis+sping搭建博客', 0, '2018-07-17 22:03:07', '2019-12-08 09:59:15', 0, 0);
INSERT INTO `blog_article_info` VALUES (5, '林北', 'SpringBoot', 1, '2018-07-19 16:12:30', '2019-12-08 09:59:15', 0, 0);
INSERT INTO `blog_article_info` VALUES (6, '林北', 'admitLet', 13, '2019-07-19 17:05:49', '2019-12-08 11:12:51', 0, 0);
INSERT INTO `blog_article_info` VALUES (7, '林北', 'springboot-使用editor.md及使用阿里云OSS作图床', 0, '2017-07-20 09:50:53', '2019-12-08 09:59:15', 0, 0);
INSERT INTO `blog_article_info` VALUES (8, '柠檬', '测试图片的显示', 0, '2019-07-21 10:13:19', '2019-12-08 10:00:22', 0, 0);
INSERT INTO `blog_article_info` VALUES (9, '柠檬', '测试测试测试啊', 0, '2017-07-27 10:56:53', '2019-12-08 10:00:30', 0, 0);
INSERT INTO `blog_article_info` VALUES (10, '柠檬', 'LeetCode', 4, '2019-08-11 22:22:36', '2020-01-05 17:54:40', 0, 1);
INSERT INTO `blog_article_info` VALUES (11, '林北', 'sd阿萨大', 0, '2017-09-13 15:35:07', '2019-12-08 09:59:15', 1, 0);
INSERT INTO `blog_article_info` VALUES (15, '林北', '更新后的十大弟弟', 3, '2019-09-13 16:24:59', '2020-01-05 17:53:50', 0, 0);
INSERT INTO `blog_article_info` VALUES (16, '小二', 'PDD', 7, '2019-09-15 19:49:19', '2019-12-08 11:15:11', 0, 0);
INSERT INTO `blog_article_info` VALUES (17, '林北', '谈谈Redis', 18, '2019-09-29 14:34:55', '2020-01-05 17:53:50', 0, 0);
INSERT INTO `blog_article_info` VALUES (18, '小二', '林北', 24, '2019-09-29 14:44:26', '2019-12-30 06:21:51', 0, 5);
INSERT INTO `blog_article_info` VALUES (19, '柠檬', '测试', 9, '2019-12-21 11:03:04', '2020-01-05 00:00:02', 0, 1);
INSERT INTO `blog_article_info` VALUES (20, '哈士奇', '哈士奇的第一篇博客', 5, '2019-12-21 14:58:54', '2020-01-15 10:00:30', 0, 1);
INSERT INTO `blog_article_info` VALUES (21, '林北', 'Java浅拷贝和深拷贝的区别和实现', 3, '2019-12-29 16:38:16', '2020-01-19 09:11:40', 0, 1);
INSERT INTO `blog_article_info` VALUES (22, '哈士奇', '测试用户访问量', 1, '2020-01-03 11:22:30', '2020-01-19 09:11:40', 0, 2);
INSERT INTO `blog_article_info` VALUES (23, '哈士奇', '测试分类功能', 2, '2020-01-03 16:21:09', '2020-01-19 09:12:40', 0, 2);

-- ----------------------------
-- Table structure for blog_article_replay
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_replay`;
CREATE TABLE `blog_article_replay`  (
  `id` bigint(40) NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(40) NOT NULL,
  `replay` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_by` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `is_delete` int(10) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article_replay
-- ----------------------------
INSERT INTO `blog_article_replay` VALUES (1, 1, '我是你爹', '2019-07-28 15:00:55', '2019-07-28 15:00:55', 1);
INSERT INTO `blog_article_replay` VALUES (2, 2, '测试回复', '2019-07-29 15:06:02', '2019-07-29 15:06:02', 1);
INSERT INTO `blog_article_replay` VALUES (19, 10, '回复', '2019-07-29 15:43:05', '2019-07-29 15:43:05', 1);
INSERT INTO `blog_article_replay` VALUES (20, 8, '回复回复', '2019-07-29 15:43:19', '2019-07-29 15:43:19', 1);
INSERT INTO `blog_article_replay` VALUES (21, 6, '测试回复测试', '2019-07-29 15:43:48', '2019-07-29 15:43:48', 1);
INSERT INTO `blog_article_replay` VALUES (22, 5, '测试回复', '2019-07-29 15:53:01', '2019-07-29 15:53:01', 1);
INSERT INTO `blog_article_replay` VALUES (23, 11, '这是回复', '2019-07-29 18:38:46', '2019-07-29 18:38:46', 1);
INSERT INTO `blog_article_replay` VALUES (24, 4, '111', '2019-08-10 09:23:48', '2019-08-10 09:23:48', 1);
INSERT INTO `blog_article_replay` VALUES (25, 13, '测试直接回复', '2019-08-10 09:37:21', '2019-08-10 09:37:21', 1);
INSERT INTO `blog_article_replay` VALUES (26, 15, '谢谢！！！', '2019-08-27 15:59:00', '2019-08-27 15:59:00', 1);
INSERT INTO `blog_article_replay` VALUES (30, 18, '哈哈', '2019-09-22 14:11:51', '2019-09-22 14:11:51', 1);
INSERT INTO `blog_article_replay` VALUES (31, 19, 'dd', '2019-12-21 15:18:17', '2019-12-21 15:18:17', 1);

-- ----------------------------
-- Table structure for blog_blog_num
-- ----------------------------
DROP TABLE IF EXISTS `blog_blog_num`;
CREATE TABLE `blog_blog_num`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `views` int(10) NOT NULL COMMENT '每日的访问量',
  `create_by` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 335 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_blog_num
-- ----------------------------
INSERT INTO `blog_blog_num` VALUES (1, 1024, '2019-11-01 23:59:59');
INSERT INTO `blog_blog_num` VALUES (2, 1040, '2019-11-02 23:59:59');
INSERT INTO `blog_blog_num` VALUES (3, 1075, '2019-11-03 23:59:59');
INSERT INTO `blog_blog_num` VALUES (4, 1090, '2019-12-09 23:59:59');
INSERT INTO `blog_blog_num` VALUES (5, 1110, '2019-12-26 23:59:59');
INSERT INTO `blog_blog_num` VALUES (6, 10, '2019-12-30 23:59:59');
INSERT INTO `blog_blog_num` VALUES (7, 15, '2019-12-31 23:59:59');

-- ----------------------------
-- Table structure for blog_historical_views
-- ----------------------------
DROP TABLE IF EXISTS `blog_historical_views`;
CREATE TABLE `blog_historical_views`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `views` int(10) NOT NULL COMMENT '每日的访问量',
  `create_by` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 335 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_historical_views
-- ----------------------------
INSERT INTO `blog_historical_views` VALUES (1, 1024, '2019-11-01 23:59:59');
INSERT INTO `blog_historical_views` VALUES (2, 1040, '2019-11-02 23:59:59');
INSERT INTO `blog_historical_views` VALUES (3, 1075, '2019-11-03 23:59:59');
INSERT INTO `blog_historical_views` VALUES (4, 1090, '2019-12-09 23:59:59');
INSERT INTO `blog_historical_views` VALUES (5, 1110, '2019-12-26 23:59:59');
INSERT INTO `blog_historical_views` VALUES (6, 1127, '2019-12-30 23:59:59');
INSERT INTO `blog_historical_views` VALUES (7, 1131, '2019-12-31 23:59:59');

-- ----------------------------
-- Table structure for blog_info_sort
-- ----------------------------
DROP TABLE IF EXISTS `blog_info_sort`;
CREATE TABLE `blog_info_sort`  (
  `id` bigint(40) NOT NULL AUTO_INCREMENT,
  `sort_id` bigint(40) NOT NULL COMMENT '分类id',
  `article_id` bigint(40) NOT NULL COMMENT '文章id',
  `create_by` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_by` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_effective` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_info_sort
-- ----------------------------
INSERT INTO `blog_info_sort` VALUES (1, 1, 15, '2019-09-13 16:24:59', '2019-09-13 16:24:59', 1);
INSERT INTO `blog_info_sort` VALUES (2, 2, 15, '2019-09-13 16:24:59', '2019-09-13 16:24:59', 1);
INSERT INTO `blog_info_sort` VALUES (3, 1, 4, '2019-09-13 17:41:30', '2019-09-13 17:41:30', 1);
INSERT INTO `blog_info_sort` VALUES (4, 4, 4, '2019-09-13 17:41:38', '2019-09-13 17:41:38', 1);
INSERT INTO `blog_info_sort` VALUES (5, 2, 4, '2019-09-13 17:41:48', '2019-09-13 17:41:48', 1);
INSERT INTO `blog_info_sort` VALUES (6, 3, 5, '2019-09-13 17:42:08', '2019-09-13 17:42:08', 1);
INSERT INTO `blog_info_sort` VALUES (7, 2, 16, '2019-09-15 19:49:19', '2019-09-15 19:49:19', 1);
INSERT INTO `blog_info_sort` VALUES (8, 3, 16, '2019-09-15 19:49:19', '2019-09-15 19:49:19', 1);
INSERT INTO `blog_info_sort` VALUES (9, 4, 16, '2019-09-15 19:49:19', '2019-09-15 19:49:19', 1);
INSERT INTO `blog_info_sort` VALUES (10, 2, 3, '2019-09-28 12:25:42', '2019-09-28 12:25:42', 1);
INSERT INTO `blog_info_sort` VALUES (11, 3, 6, '2019-09-28 12:25:48', '2019-09-28 12:25:48', 1);
INSERT INTO `blog_info_sort` VALUES (12, 1, 7, '2019-09-28 12:25:53', '2019-09-28 12:25:53', 1);
INSERT INTO `blog_info_sort` VALUES (13, 3, 8, '2019-09-28 12:26:04', '2019-09-28 12:26:04', 1);
INSERT INTO `blog_info_sort` VALUES (14, 4, 9, '2019-09-28 12:26:10', '2019-09-28 12:26:10', 1);
INSERT INTO `blog_info_sort` VALUES (15, 2, 10, '2019-09-28 12:26:15', '2019-09-28 12:26:15', 1);
INSERT INTO `blog_info_sort` VALUES (16, 3, 11, '2019-09-28 12:26:29', '2019-09-28 12:26:29', 1);
INSERT INTO `blog_info_sort` VALUES (17, 5, 17, '2019-09-29 14:34:55', '2019-09-29 14:34:55', 1);
INSERT INTO `blog_info_sort` VALUES (18, 6, 18, '2019-09-29 14:44:26', '2019-09-29 14:44:26', 1);
INSERT INTO `blog_info_sort` VALUES (19, 3, 19, '2019-12-21 11:03:04', '2019-12-21 11:03:04', 1);
INSERT INTO `blog_info_sort` VALUES (20, 7, 20, '2019-12-21 14:58:54', '2019-12-21 14:58:54', 1);
INSERT INTO `blog_info_sort` VALUES (21, 5, 21, '2019-12-29 16:38:16', '2019-12-29 16:38:16', 1);
INSERT INTO `blog_info_sort` VALUES (22, 7, 22, '2020-01-03 11:22:30', '2020-01-03 11:22:30', 1);
INSERT INTO `blog_info_sort` VALUES (23, 1, 23, '2020-01-03 16:21:09', '2020-01-03 16:21:09', 1);
INSERT INTO `blog_info_sort` VALUES (24, 2, 23, '2020-01-03 16:21:09', '2020-01-03 16:21:09', 1);

-- ----------------------------
-- Table structure for blog_like_num
-- ----------------------------
DROP TABLE IF EXISTS `blog_like_num`;
CREATE TABLE `blog_like_num`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `views` int(10) NOT NULL COMMENT '每日的访问量',
  `create_by` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 259 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_like_num
-- ----------------------------
INSERT INTO `blog_like_num` VALUES (1, 1024, '2019-11-01 23:59:59');
INSERT INTO `blog_like_num` VALUES (2, 1040, '2019-11-02 23:59:59');
INSERT INTO `blog_like_num` VALUES (3, 1075, '2019-11-03 23:59:59');
INSERT INTO `blog_like_num` VALUES (4, 1090, '2019-12-09 23:59:59');
INSERT INTO `blog_like_num` VALUES (5, 1110, '2019-12-26 23:59:59');
INSERT INTO `blog_like_num` VALUES (6, 50, '2019-12-30 23:59:59');
INSERT INTO `blog_like_num` VALUES (7, 60, '2019-12-31 23:59:59');

-- ----------------------------
-- Table structure for blog_sort
-- ----------------------------
DROP TABLE IF EXISTS `blog_sort`;
CREATE TABLE `blog_sort`  (
  `id` bigint(40) NOT NULL AUTO_INCREMENT,
  `sort_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `sort_number` tinyint(10) NOT NULL DEFAULT 0 COMMENT '数量',
  `create_by` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_by` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_effective` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效，默认1有效，0无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_sort
-- ----------------------------
INSERT INTO `blog_sort` VALUES (1, 'SpringMVC', 4, '2019-09-13 14:54:47', '2020-01-03 16:23:08', 1);
INSERT INTO `blog_sort` VALUES (2, 'Spring', 6, '2019-09-13 14:58:45', '2020-01-03 16:23:38', 1);
INSERT INTO `blog_sort` VALUES (3, 'SpringBoot', 5, '2019-09-13 14:59:54', '2020-01-03 16:31:24', 1);
INSERT INTO `blog_sort` VALUES (4, 'MyBatis', 3, '2019-09-13 17:04:47', '2020-01-03 16:24:05', 1);
INSERT INTO `blog_sort` VALUES (5, 'Java基础', 2, '2019-09-23 16:48:11', '2019-12-29 16:38:16', 1);
INSERT INTO `blog_sort` VALUES (6, 'Linux', 1, '2019-09-24 07:14:10', '2019-09-29 14:44:26', 1);
INSERT INTO `blog_sort` VALUES (7, '生活', 2, '2019-12-21 14:53:25', '2020-01-03 11:22:30', 1);

-- ----------------------------
-- Table structure for blog_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名',
  `login_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `login_role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '是否激活，默认为0',
  `create_by` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user
-- ----------------------------
INSERT INTO `blog_user` VALUES (1, 'admin', '$2a$10$2GUI.ArknQlbg2Jte4XAkOc/8bqQWTDT6lOuqi7vSgglmey7q1bh2', '林北', 'ROLE_ADMIN', 1, '2019-12-28 14:17:02');
INSERT INTO `blog_user` VALUES (3, '777@jd.com', '$2a$10$P/HWU3k6R52zE9EaMcxoeOURrWsIjzyu3EceGcT3xNgvZ0CZj933K', '柠檬', 'ROLE_USER', 1, '2019-12-28 14:17:02');
INSERT INTO `blog_user` VALUES (5, '66@jd.com', '$2a$10$OiadPu25uUs.cSV3r2RViObPVaOY.0/.weNHAtaKKNwn9slm8Qs8O', '哈哈', 'ROLE_USER', 0, '2019-12-28 14:17:02');
INSERT INTO `blog_user` VALUES (6, '555@tgu.com', '$2a$10$W4V6wi51PgPin53urP93Aexbo.QE4tG9FfHGeJsvrStbqc.L8R1y.', '老6', 'ROLE_USER', 0, '2019-12-28 14:17:02');
INSERT INTO `blog_user` VALUES (7, '789@jd.com', '$2a$10$0MC8O6vPyBMA/90o8/ct0e8yz8ZJYFsY6bihi5PujbgpX30yBK5gm', '小二', 'ROLE_USER', 0, '2019-12-28 14:17:02');
INSERT INTO `blog_user` VALUES (46, '846179345@qq.com', '$2a$10$HZA.etwGUiV7n.L2wab71uaOO0evxxAI8BqlV0QQ43/skt9sIKhwq', 'jkjkjk', 'ROLE_USER', 1, '2019-12-28 14:17:02');
INSERT INTO `blog_user` VALUES (47, 'wanglongjun6@jd.com', '$2a$10$MlGkBR9OHYbKTDasYSp3UeY7c3RYfdLTc3XaPmzlTR2Hj6TsSlIuS', '哈士奇', 'ROLE_USER', 1, '2019-12-28 14:17:02');

-- ----------------------------
-- Table structure for blog_user_like
-- ----------------------------
DROP TABLE IF EXISTS `blog_user_like`;
CREATE TABLE `blog_user_like`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `article_id` bigint(20) NOT NULL COMMENT '被点赞的文章id',
  `like_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '用户是否点赞，默认为0，0未点赞，1点赞',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user_like
-- ----------------------------
INSERT INTO `blog_user_like` VALUES (1, '林北', 21, 1);
INSERT INTO `blog_user_like` VALUES (2, '林北', 18, 1);
INSERT INTO `blog_user_like` VALUES (3, '林北', 17, 0);
INSERT INTO `blog_user_like` VALUES (4, '小二', 17, 0);
INSERT INTO `blog_user_like` VALUES (5, '林北', 5, 0);
INSERT INTO `blog_user_like` VALUES (6, '林北', 3, 0);
INSERT INTO `blog_user_like` VALUES (7, '林北', 16, 0);
INSERT INTO `blog_user_like` VALUES (8, '小二', 18, 1);
INSERT INTO `blog_user_like` VALUES (9, 'anonymousUser', 18, 0);
INSERT INTO `blog_user_like` VALUES (10, '柠檬', 18, 1);
INSERT INTO `blog_user_like` VALUES (11, '老6', 18, 1);
INSERT INTO `blog_user_like` VALUES (12, '哈哈', 18, 1);
INSERT INTO `blog_user_like` VALUES (13, '柠檬', 19, 0);
INSERT INTO `blog_user_like` VALUES (14, 'anonymousUser', 19, 0);
INSERT INTO `blog_user_like` VALUES (15, 'anonymousUser', 10, 0);
INSERT INTO `blog_user_like` VALUES (16, '柠檬', 20, 0);
INSERT INTO `blog_user_like` VALUES (17, '哈士奇', 20, 1);
INSERT INTO `blog_user_like` VALUES (18, '哈士奇', 18, 0);
INSERT INTO `blog_user_like` VALUES (19, 'anonymousUser', 22, 0);
INSERT INTO `blog_user_like` VALUES (20, '哈士奇', 22, 1);
INSERT INTO `blog_user_like` VALUES (21, '哈士奇', 19, 1);
INSERT INTO `blog_user_like` VALUES (22, '哈士奇', 23, 0);
INSERT INTO `blog_user_like` VALUES (23, 'anonymousUser', 21, 0);
INSERT INTO `blog_user_like` VALUES (24, '哈士奇', 21, 0);
INSERT INTO `blog_user_like` VALUES (25, 'anonymousUser', 23, 0);
INSERT INTO `blog_user_like` VALUES (26, '林北', 23, 1);
INSERT INTO `blog_user_like` VALUES (27, 'jkjkjk', 23, 1);
INSERT INTO `blog_user_like` VALUES (28, '林北', 15, 0);
INSERT INTO `blog_user_like` VALUES (29, '林北', 10, 1);
INSERT INTO `blog_user_like` VALUES (30, 'jkjkjk', 22, 1);
INSERT INTO `blog_user_like` VALUES (31, 'anonymousUser', 20, 0);
INSERT INTO `blog_user_like` VALUES (32, '林北', 22, 0);

-- ----------------------------
-- Table structure for blog_user_view
-- ----------------------------
DROP TABLE IF EXISTS `blog_user_view`;
CREATE TABLE `blog_user_view`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `view` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user_view
-- ----------------------------
INSERT INTO `blog_user_view` VALUES (1, '小二', 10);
INSERT INTO `blog_user_view` VALUES (2, '林北', 3);
INSERT INTO `blog_user_view` VALUES (3, '柠檬', 1);
INSERT INTO `blog_user_view` VALUES (5, '哈士奇', 1);

SET FOREIGN_KEY_CHECKS = 1;
