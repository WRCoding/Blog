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

 Date: 23/11/2019 13:22:26
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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '这张表用来保存题图url，每一篇文章都应该有题图' ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for blog_article_info
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_info`;
CREATE TABLE `blog_article_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `article_views` int(10) NOT NULL DEFAULT 0 COMMENT '访问量',
  `create_by` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_by` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除，默认为0，1为是',
  `like_num` int(10) NOT NULL DEFAULT 0 COMMENT '点赞数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_title`(`article_title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article_info
-- ----------------------------
INSERT INTO `blog_article_info` VALUES (3, 'ssm搭建博客', 2, '2019-07-17 21:56:19', '2019-11-17 16:30:14', 0, 0);
INSERT INTO `blog_article_info` VALUES (4, 'springmvc+mybatis+sping搭建博客', 0, '2018-07-17 22:03:07', '2019-09-28 12:39:10', 0, 0);
INSERT INTO `blog_article_info` VALUES (5, 'SpringBoot', 1, '2018-07-19 16:12:30', '2019-11-16 13:59:59', 0, 0);
INSERT INTO `blog_article_info` VALUES (6, 'admitLet', 12, '2019-07-19 17:05:49', '2019-11-16 16:59:59', 0, 0);
INSERT INTO `blog_article_info` VALUES (7, 'springboot-使用editor.md及使用阿里云OSS作图床', 0, '2017-07-20 09:50:53', '2019-09-28 12:39:30', 0, 0);
INSERT INTO `blog_article_info` VALUES (8, '测试图片的显示', 0, '2019-07-21 10:13:19', '2019-09-28 12:39:30', 0, 0);
INSERT INTO `blog_article_info` VALUES (9, '测试测试测试啊', 0, '2017-07-27 10:56:53', '2019-09-28 12:39:30', 0, 0);
INSERT INTO `blog_article_info` VALUES (10, 'LeetCode', 1, '2019-08-11 22:22:36', '2019-11-12 21:59:59', 0, 0);
INSERT INTO `blog_article_info` VALUES (11, 'sd阿萨大', 0, '2017-09-13 15:35:07', '2019-09-28 12:38:33', 1, 0);
INSERT INTO `blog_article_info` VALUES (15, '更新后的十大弟弟', 2, '2019-09-13 16:24:59', '2019-11-12 21:59:59', 0, 0);
INSERT INTO `blog_article_info` VALUES (16, 'PDD', 4, '2019-09-15 19:49:19', '2019-11-16 14:59:59', 0, 0);
INSERT INTO `blog_article_info` VALUES (17, '谈谈Redis', 8, '2019-09-29 14:34:55', '2019-11-16 13:59:59', 0, 0);
INSERT INTO `blog_article_info` VALUES (18, '林北', 10, '2019-09-29 14:44:26', '2019-11-23 10:19:36', 0, 5);

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
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_sort
-- ----------------------------
INSERT INTO `blog_sort` VALUES (1, 'SpringMVC', 2, '2019-09-13 14:54:47', '2019-09-28 12:21:17', 1);
INSERT INTO `blog_sort` VALUES (2, 'Spring', 3, '2019-09-13 14:58:45', '2019-09-15 19:49:19', 1);
INSERT INTO `blog_sort` VALUES (3, 'SpringBoot', 2, '2019-09-13 14:59:54', '2019-09-15 19:49:19', 1);
INSERT INTO `blog_sort` VALUES (4, 'MyBatis', 2, '2019-09-13 17:04:47', '2019-09-15 19:49:19', 1);
INSERT INTO `blog_sort` VALUES (5, 'Java基础', 1, '2019-09-23 16:48:11', '2019-09-29 14:34:55', 1);
INSERT INTO `blog_sort` VALUES (6, 'Linux', 1, '2019-09-24 07:14:10', '2019-09-29 14:44:26', 1);

-- ----------------------------
-- Table structure for blog_sysrecord
-- ----------------------------
DROP TABLE IF EXISTS `blog_sysrecord`;
CREATE TABLE `blog_sysrecord`  (
  `id` bigint(40) NOT NULL AUTO_INCREMENT,
  `visit_time` datetime(0) NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 192 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_sysrecord
-- ----------------------------
INSERT INTO `blog_sysrecord` VALUES (1, '2019-08-21 10:58:20', '0:0:0:0:0:0:0:1', '/', NULL);
INSERT INTO `blog_sysrecord` VALUES (2, '2019-08-21 10:58:36', '0:0:0:0:0:0:0:1', '/show/10', NULL);
INSERT INTO `blog_sysrecord` VALUES (3, '2019-08-21 10:59:16', '0:0:0:0:0:0:0:1', '/page/2', NULL);
INSERT INTO `blog_sysrecord` VALUES (4, '2019-08-21 10:59:19', '0:0:0:0:0:0:0:1', '/show/6', NULL);
INSERT INTO `blog_sysrecord` VALUES (5, '2019-08-23 22:36:13', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (6, '2019-08-23 22:37:34', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (7, '2019-08-27 09:25:35', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (8, '2019-08-27 09:26:20', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (9, '2019-08-27 09:27:03', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (10, '2019-08-27 09:27:09', '0:0:0:0:0:0:0:1', '/page/2', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (11, '2019-08-27 09:27:12', '0:0:0:0:0:0:0:1', '/page/3', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (12, '2019-08-27 09:27:14', '0:0:0:0:0:0:0:1', '/page/2', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (13, '2019-08-27 09:27:39', '0:0:0:0:0:0:0:1', '/page/2', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (14, '2019-08-27 09:34:12', '0:0:0:0:0:0:0:1', '/page/2', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (15, '2019-08-27 09:36:53', '0:0:0:0:0:0:0:1', '/page/2', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (16, '2019-08-27 09:37:26', '0:0:0:0:0:0:0:1', '/page/3', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (17, '2019-08-27 09:37:29', '0:0:0:0:0:0:0:1', '/page/2', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (18, '2019-08-27 09:37:32', '0:0:0:0:0:0:0:1', '/page/1', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (19, '2019-08-27 09:37:46', '0:0:0:0:0:0:0:1', '/page/1', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (20, '2019-08-27 15:30:55', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (21, '2019-08-27 15:31:04', '0:0:0:0:0:0:0:1', '/page/2', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (22, '2019-08-27 15:31:16', '0:0:0:0:0:0:0:1', '/page/2', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (23, '2019-08-27 15:31:19', '0:0:0:0:0:0:0:1', '/page/1', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (24, '2019-08-27 15:31:22', '0:0:0:0:0:0:0:1', '/page/2', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (25, '2019-08-27 15:31:30', '0:0:0:0:0:0:0:1', '/show/10', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (26, '2019-08-27 15:31:39', '0:0:0:0:0:0:0:1', '/page/1', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (27, '2019-08-27 15:31:44', '0:0:0:0:0:0:0:1', '/page/2', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (28, '2019-08-27 15:32:27', '0:0:0:0:0:0:0:1', '/page/2', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (29, '2019-08-27 15:32:29', '0:0:0:0:0:0:0:1', '/show/10', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (30, '2019-08-27 15:34:59', '0:0:0:0:0:0:0:1', '/show/10', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (31, '2019-08-27 15:35:11', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (32, '2019-08-27 15:35:14', '0:0:0:0:0:0:0:1', '/show/10', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (33, '2019-08-27 15:36:04', '0:0:0:0:0:0:0:1', '/show/10', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (34, '2019-08-27 15:36:27', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (35, '2019-08-27 15:36:41', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (36, '2019-08-27 15:36:44', '0:0:0:0:0:0:0:1', '/show/10', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (37, '2019-08-27 15:36:53', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (38, '2019-08-27 15:36:59', '0:0:0:0:0:0:0:1', '/page/2', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (39, '2019-08-27 15:37:02', '0:0:0:0:0:0:0:1', '/page/1', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (40, '2019-08-27 15:37:53', '0:0:0:0:0:0:0:1', '/page/1', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (41, '2019-08-27 15:37:58', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (42, '2019-08-27 15:38:07', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (43, '2019-08-27 15:41:06', '0:0:0:0:0:0:0:1', '/page/2', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (44, '2019-08-27 15:41:10', '0:0:0:0:0:0:0:1', '/page/1', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (45, '2019-08-27 15:42:09', '0:0:0:0:0:0:0:1', '/show/7', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (46, '2019-08-27 15:43:15', '0:0:0:0:0:0:0:1', '/show/7', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (47, '2019-08-27 15:44:57', '0:0:0:0:0:0:0:1', '/show/7', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (48, '2019-08-27 15:45:33', '0:0:0:0:0:0:0:1', '/show/7', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (49, '2019-08-27 15:46:41', '0:0:0:0:0:0:0:1', '/show/7', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (50, '2019-08-27 15:48:43', '0:0:0:0:0:0:0:1', '/show/7', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (51, '2019-08-27 15:49:50', '0:0:0:0:0:0:0:1', '/show/7', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (52, '2019-08-27 15:50:25', '0:0:0:0:0:0:0:1', '/show/8', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (53, '2019-08-27 15:50:28', '0:0:0:0:0:0:0:1', '/show/10', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (54, '2019-08-27 15:50:56', '0:0:0:0:0:0:0:1', '/show/10', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (55, '2019-08-27 15:52:31', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (56, '2019-08-27 15:52:39', '0:0:0:0:0:0:0:1', '/show/10', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (57, '2019-08-27 15:52:59', '0:0:0:0:0:0:0:1', '/show/10', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (58, '2019-08-27 15:53:03', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (59, '2019-08-27 15:53:44', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (60, '2019-08-27 15:58:44', '0:0:0:0:0:0:0:1', '/saveComment', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (61, '2019-08-27 15:59:00', '0:0:0:0:0:0:0:1', '/saveReplay', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (62, '2019-08-27 16:02:08', '0:0:0:0:0:0:0:1', '/saveComment', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (63, '2019-08-27 16:06:03', '0:0:0:0:0:0:0:1', '/show/10', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (64, '2019-08-27 16:06:52', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (65, '2019-08-28 09:33:41', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (66, '2019-08-28 09:34:23', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (67, '2019-08-28 09:35:46', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (68, '2019-08-28 09:36:36', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (69, '2019-08-28 09:39:21', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (70, '2019-08-28 09:39:50', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (71, '2019-08-28 09:40:50', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (72, '2019-08-28 09:45:32', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (73, '2019-08-28 09:47:39', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (74, '2019-08-28 09:48:53', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (75, '2019-08-28 09:49:25', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (76, '2019-08-28 09:50:09', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (77, '2019-08-28 09:50:48', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (78, '2019-08-28 09:52:19', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (79, '2019-08-28 09:52:33', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (80, '2019-08-28 10:50:56', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (81, '2019-08-28 10:51:05', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (82, '2019-08-28 10:51:09', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (83, '2019-08-28 10:51:09', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (84, '2019-08-28 10:54:05', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (85, '2019-08-28 10:54:11', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (86, '2019-08-28 10:55:59', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (87, '2019-08-28 10:56:04', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (88, '2019-08-28 10:56:13', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (89, '2019-08-28 10:56:16', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (90, '2019-08-28 10:57:38', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (91, '2019-08-28 10:57:41', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (92, '2019-08-28 10:57:50', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (93, '2019-08-28 10:57:55', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (94, '2019-08-28 11:00:11', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (95, '2019-08-28 11:00:17', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (96, '2019-08-28 11:01:22', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (97, '2019-08-28 11:01:30', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (98, '2019-08-28 11:02:33', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (99, '2019-08-28 11:02:36', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (100, '2019-08-28 11:06:10', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (101, '2019-08-28 11:06:20', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (102, '2019-08-28 11:07:24', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (103, '2019-08-28 11:07:26', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (104, '2019-08-28 11:07:29', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (105, '2019-08-28 11:09:22', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (106, '2019-08-28 11:09:27', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (107, '2019-08-28 11:10:36', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (108, '2019-08-28 11:10:48', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (109, '2019-08-28 11:12:55', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (110, '2019-08-28 11:12:59', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (111, '2019-08-28 11:13:18', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (112, '2019-08-28 11:18:41', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (113, '2019-08-28 11:19:16', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (114, '2019-08-28 11:19:19', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (115, '2019-08-28 11:19:26', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (116, '2019-08-28 11:19:26', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (117, '2019-08-28 11:19:30', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (118, '2019-08-28 11:19:30', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (119, '2019-08-28 11:19:30', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (120, '2019-08-28 11:19:31', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (121, '2019-08-28 11:25:11', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (122, '2019-08-28 11:26:38', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (123, '2019-08-28 11:26:46', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (124, '2019-08-28 11:26:51', '0:0:0:0:0:0:0:1', '/searchPage/2', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (125, '2019-08-28 11:26:59', '0:0:0:0:0:0:0:1', '/searchPage/2', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (126, '2019-08-28 11:27:23', '0:0:0:0:0:0:0:1', '/searchPage/1', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (127, '2019-08-28 11:28:45', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (128, '2019-08-28 11:29:16', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (129, '2019-08-28 11:29:53', '0:0:0:0:0:0:0:1', '/show/10', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (130, '2019-08-28 11:29:56', '0:0:0:0:0:0:0:1', '/show/10', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (131, '2019-08-28 11:32:06', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (132, '2019-08-28 11:32:58', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (133, '2019-08-28 11:33:01', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (134, '2019-08-28 11:34:12', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (135, '2019-08-28 11:34:36', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (136, '2019-08-28 11:34:43', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (137, '2019-08-28 11:35:22', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (138, '2019-08-28 11:35:33', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (139, '2019-08-28 11:35:43', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (140, '2019-08-28 11:43:36', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (141, '2019-08-28 11:44:09', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (142, '2019-08-28 11:44:33', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (143, '2019-08-28 11:47:24', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (144, '2019-08-28 11:48:23', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (145, '2019-08-28 11:49:15', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (146, '2019-08-28 11:49:19', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (147, '2019-08-28 11:49:21', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (148, '2019-08-28 11:49:27', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (149, '2019-08-28 12:00:54', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (150, '2019-08-28 12:01:11', '0:0:0:0:0:0:0:1', '/searchTitle', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (151, '2019-08-28 12:01:12', '0:0:0:0:0:0:0:1', '/searchTitle', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (152, '2019-08-28 12:01:13', '0:0:0:0:0:0:0:1', '/searchTitle', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (153, '2019-08-28 12:01:13', '0:0:0:0:0:0:0:1', '/searchTitle', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (154, '2019-08-28 12:01:13', '0:0:0:0:0:0:0:1', '/searchTitle', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (155, '2019-08-28 12:01:44', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (156, '2019-08-28 12:01:47', '0:0:0:0:0:0:0:1', '/searchTitle', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (157, '2019-08-28 12:01:47', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (158, '2019-08-28 12:01:54', '0:0:0:0:0:0:0:1', '/searchTitle', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (159, '2019-08-28 12:01:54', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (160, '2019-08-28 12:03:37', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (161, '2019-08-28 12:03:46', '0:0:0:0:0:0:0:1', '/searchTitle', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (162, '2019-08-28 12:03:46', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (163, '2019-08-28 12:03:59', '0:0:0:0:0:0:0:1', '/searchTitle', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (164, '2019-08-28 12:03:59', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (165, '2019-08-28 12:04:45', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (166, '2019-08-28 12:04:48', '0:0:0:0:0:0:0:1', '/searchTitle', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (167, '2019-08-28 12:04:49', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (168, '2019-08-28 12:04:54', '0:0:0:0:0:0:0:1', '/searchTitle', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (169, '2019-08-28 12:05:33', '0:0:0:0:0:0:0:1', '/searchTitle', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (170, '2019-08-28 12:13:45', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (171, '2019-08-28 12:14:12', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (172, '2019-08-28 12:14:15', '0:0:0:0:0:0:0:1', '/searchTitle', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (173, '2019-08-28 12:14:15', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (174, '2019-08-28 12:14:21', '0:0:0:0:0:0:0:1', '/searchTitle', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (175, '2019-08-28 12:14:21', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (176, '2019-08-28 12:14:33', '0:0:0:0:0:0:0:1', '/searchTitle', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (177, '2019-08-28 12:14:33', '0:0:0:0:0:0:0:1', '/search', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (178, '2019-08-28 12:14:42', '0:0:0:0:0:0:0:1', '/searchTitle', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (179, '2019-08-28 12:14:57', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (180, '2019-08-28 12:15:01', '0:0:0:0:0:0:0:1', '/show/10', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (181, '2019-08-28 12:19:27', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (182, '2019-08-28 12:19:29', '0:0:0:0:0:0:0:1', '/show/10', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (183, '2019-08-28 12:20:32', '0:0:0:0:0:0:0:1', '/show/10', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (184, '2019-08-28 12:22:25', '0:0:0:0:0:0:0:1', '/show/10', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (185, '2019-08-28 12:28:33', '0:0:0:0:0:0:0:1', '/show/10', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (186, '2019-08-28 12:29:00', '0:0:0:0:0:0:0:1', '/saveComment', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (187, '2019-08-28 12:30:06', '0:0:0:0:0:0:0:1', '/show/10', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (188, '2019-09-04 14:18:14', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (189, '2019-09-04 14:18:49', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (190, '2019-09-04 14:19:07', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (191, '2019-09-04 14:19:30', '0:0:0:0:0:0:0:1', '/', '无法解析');
INSERT INTO `blog_sysrecord` VALUES (192, '2019-09-04 14:19:31', '0:0:0:0:0:0:0:1', '/', '无法解析');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user
-- ----------------------------
INSERT INTO `blog_user` VALUES (1, 'admin', '$2a$10$2GUI.ArknQlbg2Jte4XAkOc/8bqQWTDT6lOuqi7vSgglmey7q1bh2', '林北', 'ROLE_ADMIN');
INSERT INTO `blog_user` VALUES (2, '846179345@qq.com', '$2a$10$bQ2cJhEiqtFwm2wu4ZWO4eJoHg0iJUNwVvH.fZUL2zVCSNlSPgJmC', '林北', 'ROLE_USER');
INSERT INTO `blog_user` VALUES (3, '777@jd.com', '$2a$10$P/HWU3k6R52zE9EaMcxoeOURrWsIjzyu3EceGcT3xNgvZ0CZj933K', '柠檬', 'ROLE_USER');
INSERT INTO `blog_user` VALUES (4, '888@jd.com', '$2a$10$92mu3dBWcopoJsbi59maLutCfTAcZOWhaLEtFcSFQGy.1YY56tid6', '??', 'ROLE_USER');
INSERT INTO `blog_user` VALUES (5, '66@jd.com', '$2a$10$OiadPu25uUs.cSV3r2RViObPVaOY.0/.weNHAtaKKNwn9slm8Qs8O', '哈哈', 'ROLE_USER');
INSERT INTO `blog_user` VALUES (6, '555@tgu.com', '$2a$10$W4V6wi51PgPin53urP93Aexbo.QE4tG9FfHGeJsvrStbqc.L8R1y.', '老6', 'ROLE_USER');
INSERT INTO `blog_user` VALUES (7, '789@jd.com', '$2a$10$0MC8O6vPyBMA/90o8/ct0e8yz8ZJYFsY6bihi5PujbgpX30yBK5gm', '小二', 'ROLE_USER');

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user_like
-- ----------------------------
INSERT INTO `blog_user_like` VALUES (1, '林北', 21, 0);
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

SET FOREIGN_KEY_CHECKS = 1;
