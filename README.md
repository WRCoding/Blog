
## 前言

一直觉得有个自己的博客是件很酷的事情，而且在搭建的过程能够提升的自己的编程能力，所以趁着空闲的时候完成了这个项目，前前后后花了半个月的时间吧，后面会持续更新

---

2019-11-23：博客从发布到现在已经更新了数次，功能完善了许多，最新更新加入了权限控制和点赞功能，只有登录才能查看文章内容


博客演示：[林北的博客](http://lpepsi.top/)

数据库测试文件也一同上传了，MySQL版本为5.7的用后缀为5.7的文件，MySQL为8的用无后缀的文件，如果对你有帮助请点个Star,谢谢啦（最新的更新只更新了8的数据库测试文件，如需要5.7的可自行修改）
因为目前实力有限，博客还有很多可以改进，有什么建议可以一起讨论
## 本次所用到的技术和框架

 - SpringBoot
 - Mysql
 - Mybatis
 - Thymeleaf
 - SpringSecurity
 - PageHelper
 - Druid
 - Redis
 - Quartz

页面与展示使用的是：[AmazeUI](https://amazeui.clouddeep.cn/)
后台管理使用的是：[AdminLte3](https://adminlte.io/themes/dev/AdminLTE/index3.html)

## 功能
**主页**

 - 以分页列表的形式展示文章，以及文章的作者和创作时间
 - 能够查看最新的文章
 - 通过分类查询文章
 - 能够查看访问量最多的文章
 - 登录后能够对每篇文章进行评论并且能够回复评论以及对文章点赞
 - 根据时间归档
 - 通过二维码扫描在手机端浏览
 - 登录和注册

**后台管理**

 - 记录网站的访问量，博客数以及评论数
 - 历史浏览量可视化
 - 以MarkDown的形式发布文章，支持插入本地图片和网络图片
 - 博客管理，以分页的形式展示文章信息，对文章进行编辑和删除
 - 评论管理，以分页的形式展示评论信息，对评论进行回复和删除
 - 分类管理


**本项目的关键点**

 - 采用SpringBoot开发，数据库采用Mybatis，页面渲染使用Thymeleaf
 - 对于系统的关键业务如访问量最高的文章和使用Redis缓存，加快响应速度。
 - 使用Quartz进行历史浏览量的定时操作以及定时存储浏览量和访问量
 - 使用Quartz对点赞状态和点赞数量进行定时持久化操作
 - 使用SpringSecurity进行权限控制
 - 本项目采用前台展示+后台管理的方式搭建，前台展示博客内容以及个人介绍，后台管理用于编辑文章，管理评论留言。
 - 使用阿里云OSS对图片进行存储，让markdown也能使用本地文件


## 页面展示
**主页**
登录前：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191123133033371.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191106174913891.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)
登录后：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191123133147373.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)
**登录页面**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191123133324155.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)
**注册页面**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191123133350897.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)
**全部分类**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191106174817978.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)
**按时间归档**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190923170713473.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)

**文章展示**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190930083052457.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190922160249297.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)
**点赞：**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191123133235140.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)

**扫码手机访问**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190916065329397.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)


**自定义的错误页面**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190914084713827.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)


**评论**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190801113257687.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)
**后台管理**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191106143744140.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)
**历史浏览量可视化**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191106144043321.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)
**发布博客**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190916070420198.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)
**编辑文章**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190916070448733.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)
**博客管理**
![在这里插入图片描述](https://img-blog.csdnimg.cn/2019080111360271.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)
**评论管理**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190801113633125.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)
**分类管理**
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190914084031822.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQwODY2ODk3,size_16,color_FFFFFF,t_70)