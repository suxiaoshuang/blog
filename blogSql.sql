-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blog_admin`
--

DROP TABLE IF EXISTS `blog_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '加密盐值',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `creator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_admin`
--

LOCK TABLES `blog_admin` WRITE;
/*!40000 ALTER TABLE `blog_admin` DISABLE KEYS */;
INSERT INTO `blog_admin` VALUES (1,'admin','$2a$10$GfiHUCm3bBvQpqU0E4J.W.o0dL9.3n1Kh.kiCPV66BRgTW8G0KgEG',NULL,'1543395054@qq.com','2022-05-06 14:52:06','admin'),(12,'root','$2a$10$uGloOjUaGiIaXFzEspCFtOxUzjbGCcaQJAwl9sK6Rg8whCPLChjIi',NULL,'root@123.com','2022-05-06 15:50:11','admin'),(15,'user','$2a$10$hM1Deuxs63Y9tpie7iiEkupia1ZixKT4vLfiFFnmM5fIqPn0ucBO.',NULL,'user','2022-05-08 15:05:59','admin');
/*!40000 ALTER TABLE `blog_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_admin_permission`
--

DROP TABLE IF EXISTS `blog_admin_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_admin_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_admin_permission`
--

LOCK TABLES `blog_admin_permission` WRITE;
/*!40000 ALTER TABLE `blog_admin_permission` DISABLE KEYS */;
INSERT INTO `blog_admin_permission` VALUES (2,11,1),(3,11,1),(4,11,10),(5,11,11),(6,11,12),(7,11,13);
/*!40000 ALTER TABLE `blog_admin_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_article` (
  `id` bigint(20) NOT NULL,
  `comment_counts` int(11) DEFAULT '0' COMMENT '评论数量',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '简介',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `view_counts` int(11) DEFAULT '0' COMMENT '浏览数量',
  `weight` int(11) DEFAULT '0' COMMENT '是否置顶 1为置顶 0为不置顶',
  `author_id` bigint(20) DEFAULT NULL COMMENT '作者id',
  `body_id` bigint(20) DEFAULT NULL COMMENT '内容id',
  `category_id` bigint(20) DEFAULT NULL COMMENT '类别id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (1,0,'2022-02-21 08:45:49','通过Spring Boot实现的服务，只需要依靠一个Java类，把它打包成jar，并通过`java -jar`命令就可以运行起来。\r\n\r\n这一切相较于传统Spring应用来说，已经变得非常的轻便、简单。','springboot介绍以及入门案例',223,0,1505704762788126721,1,2),(10,0,'2022-03-21 08:45:47','本节将介绍如何在项目中使用 Element。','Element相关',21,0,1505704762788126721,21,2),(1508411230628941825,1,'2022-03-28 19:50:37','图片上传成功','图片上传成功',8,0,1506809372143575041,1508411230628941827,2),(1508624022300569601,0,'2022-03-29 09:56:10','springboot','springboot',7,0,1506809372143575041,1508624022422204418,2),(1508630069580988418,0,'2022-03-29 10:20:12','spring','spring',6,0,1506809372143575041,1508630069610348545,2);
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article_body`
--

DROP TABLE IF EXISTS `blog_article_body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_article_body` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '文章内容',
  `content_html` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `article_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `article_id` (`article_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1523236450598449157 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article_body`
--

LOCK TABLES `blog_article_body` WRITE;
/*!40000 ALTER TABLE `blog_article_body` DISABLE KEYS */;
INSERT INTO `blog_article_body` VALUES (1,'# 1. Spring Boot介绍\r\n\r\n## 1.1 简介\r\n\r\n在您第1次接触和学习Spring框架的时候，是否因为其繁杂的配置而退却了？\r\n\r\n在你第n次使用Spring框架的时候，是否觉得一堆反复黏贴的配置有一些厌烦？\r\n\r\n那么您就不妨来试试使用Spring Boot来让你更易上手，更简单快捷地构建Spring应用！\r\n\r\nSpring Boot让我们的Spring应用变的更轻量化。\r\n\r\n我们不必像以前那样繁琐的构建项目、打包应用、部署到Tomcat等应用服务器中来运行我们的业务服务。\r\n\r\n通过Spring Boot实现的服务，只需要依靠一个Java类，把它打包成jar，并通过`java -jar`命令就可以运行起来。\r\n\r\n这一切相较于传统Spring应用来说，已经变得非常的轻便、简单。\r\n\r\n**总结一下Spring Boot的主要优点：**\r\n\r\n1. 为所有Spring开发者更快的入门\r\n2. 开箱即用，提供各种默认配置来简化项目配置\r\n3. 内嵌式容器简化Web项目\r\n4. 没有冗余代码生成和XML配置的要求\r\n5. 统一的依赖管理\r\n6. 自动装配，更易使用，更易扩展\r\n\r\n## 1.2 使用版本说明\r\n\r\nSpringboot版本：使用最新的2.5.0版本\r\n\r\n教程参考了官方文档进行制作，权威。\r\n\r\n其他依赖版本：\r\n\r\n	1. Maven  需求：3.5+\r\n\r\n   	2. JDK 需求  8+\r\n   	3. Spring Framework 5.3.7以上版本\r\n   	4. Tomcat 9.0\r\n   	5. Servlet版本 4.0  但是可以部署到Servlet到3.1+的容器中\r\n\r\n# 2. 快速入门\r\n\r\n快速的创建一个Spring Boot应用，并且实现一个简单的Http请求处理。通过这个例子对Spring Boot有一个初步的了解，并体验其结构简单、开发快速的特性。\r\n\r\n教程使用的Idea版本：2019.3\r\n\r\n## 2.1 创建基础项目\r\n\r\n**第一步：** 创建maven项目\r\n\r\npom.xml :\r\n\r\n~~~xml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<project xmlns=\"http://maven.apache.org/POM/4.0.0\"\r\n         xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n         xsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd\">\r\n    <modelVersion>4.0.0</modelVersion>\r\n\r\n    <groupId>com.xiaopizhu</groupId>\r\n    <artifactId>helloSpringBoot</artifactId>\r\n    <version>1.0-SNAPSHOT</version>\r\n	<!--springboot的父工程其中定义了常用的依赖，并且无依赖冲突-->\r\n    <parent>\r\n        <groupId>org.springframework.boot</groupId>\r\n        <artifactId>spring-boot-starter-parent</artifactId>\r\n        <version>2.5.0</version>\r\n    </parent>\r\n</project>\r\n~~~\r\n\r\n注意上方的parent必须加，其中定义了springboot官方支持的n多依赖，基本上常用的已经有了，所以接下来导入依赖的时候，绝大部分都可以不加版本号。\r\n\r\n此时的工程结构为：\r\n\r\n![image-20210523173241557](img/image-20210523173241557.png)\r\n\r\n**第二步：** 添加web依赖\r\n\r\n~~~xml\r\n<dependencies>\r\n    <dependency>\r\n        <groupId>org.springframework.boot</groupId>\r\n        <artifactId>spring-boot-starter-web</artifactId>\r\n    </dependency>\r\n</dependencies>\r\n~~~\r\n\r\n添加上方的web依赖，其中间接依赖了spring-web，spring-webmvc，spring-core等spring和springmvc的包，并且集成了tomcat。\r\n\r\n**第三步：** 编写启动类\r\n\r\n~~~java\r\npackage com.xiaopizhu.springboot;\r\n\r\nimport org.springframework.boot.SpringApplication;\r\nimport org.springframework.boot.autoconfigure.SpringBootApplication;\r\n\r\n@SpringBootApplication\r\npublic class HelloApp {\r\n\r\n    public static void main(String[] args) {\r\n        SpringApplication.run(HelloApp.class,args);\r\n    }\r\n}\r\n\r\n~~~\r\n\r\n@SpringBootApplication注解标识了HelloApp为启动类，也是Spring Boot的核心。\r\n\r\n**第四步：** 运行启动类的main方法\r\n\r\n![image-20210523173712142](img/image-20210523173712142.png)\r\n\r\n看到如上配置，证明启动成功，tomcat端口号默认为8080。\r\n\r\n**第五步：**  如果想要修改端口号，可以在resources目录下新建application.properties\r\n\r\n~~~properties\r\nserver.port=8082\r\n~~~\r\n\r\n**第六步：** 重新运行\r\n\r\n![image-20210523174011613](img/image-20210523174011613.png)\r\n\r\n此时的项目结构为：\r\n\r\n![image-20210523174032053](img/image-20210523174032053.png)\r\n\r\n**src/main/java :**  编写java代码，注意启动类需要放在项目的根包下。\r\n\r\n**src/main/resources:**  放置资源的目录，比如springboot的配置文件，静态文件，mybatis配置，日志配置等。\r\n\r\n**src/test/java:**  测试代码\r\n\r\n## 2.2 编写一个Http接口\r\n\r\n**第一步：**创建`HelloController`类，内容如下：\r\n\r\n~~~java\r\npackage com.xiaopizhu.springboot.controller;\r\n\r\nimport org.springframework.web.bind.annotation.GetMapping;\r\nimport org.springframework.web.bind.annotation.RequestMapping;\r\nimport org.springframework.web.bind.annotation.RestController;\r\n\r\n@RestController\r\n@RequestMapping(\"hello\")\r\npublic class HelloController {\r\n\r\n    @GetMapping(\"boot\")\r\n    public String hello(){\r\n        return \"hello spring boot\";\r\n    }\r\n\r\n}\r\n\r\n~~~\r\n\r\n**注意包名，必须在启动类所在的包名下。**\r\n\r\n**第二步：**重启程序，使用postman或者直接在浏览器输入http://localhost:8082/hello/boot\r\n\r\n得到结果：hello spring boot\r\n\r\n## 2.3 编写单元测试用例\r\n\r\n**第一步：**添加spring boot测试依赖\r\n\r\n~~~xml\r\n		<dependency>\r\n            <groupId>org.springframework.boot</groupId>\r\n            <artifactId>spring-boot-starter-test</artifactId>\r\n            <scope>test</scope>\r\n        </dependency>\r\n~~~\r\n\r\n**第二步：**在src/test 下，编写测试用例\r\n\r\n~~~java\r\npackage com.xiaopizhu.springboot.controller;\r\n\r\nimport org.junit.jupiter.api.BeforeAll;\r\nimport org.junit.jupiter.api.BeforeEach;\r\nimport org.junit.jupiter.api.Test;\r\nimport org.springframework.boot.test.context.SpringBootTest;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.test.web.servlet.MockMvc;\r\nimport org.springframework.test.web.servlet.request.MockMvcRequestBuilders;\r\nimport org.springframework.test.web.servlet.setup.MockMvcBuilders;\r\n\r\nimport static org.hamcrest.Matchers.equalTo;\r\nimport static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;\r\nimport static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;\r\n\r\n@SpringBootTest\r\npublic class TestHelloController {\r\n\r\n    private MockMvc mockMvc;\r\n\r\n    @BeforeEach\r\n    public void beforeEach(){\r\n        mockMvc = MockMvcBuilders.standaloneSetup(new HelloController()).build();\r\n    }\r\n    @Test\r\n    public void testHello() throws Exception {\r\n        mockMvc.perform(MockMvcRequestBuilders.get(\"/hello/boot\")\r\n                .accept(MediaType.APPLICATION_JSON))\r\n                .andExpect(status().isOk())\r\n                .andExpect(content().string(equalTo(\"hello spring boot\")));\r\n    }\r\n}\r\n\r\n~~~\r\n\r\n上面的测试用例，是构建一个空的`WebApplicationContext`，并且在before中加载了HelloController，得以在测试用例中mock调用，模拟请求。\r\n\r\n## 2.4 打包为jar运行\r\n\r\n**第一步：**添加打包(maven构建springboot)插件\r\n\r\n~~~xml\r\n  <build>\r\n        <plugins>\r\n            <plugin>\r\n                <groupId>org.springframework.boot</groupId>\r\n                <artifactId>spring-boot-maven-plugin</artifactId>\r\n            </plugin>\r\n        </plugins>\r\n    </build>\r\n~~~\r\n\r\n在idea的右侧 maven中，使用package来打包程序，打包完成后，在target目录下生成helloSpringBoot-1.0-SNAPSHOT.jar\r\n\r\n![image-20210523181737720](img/image-20210523181737720.png)\r\n\r\n**第二步：**打开cmd：找到jar对应的目录\r\n\r\n输入命令\r\n\r\n~~~shell\r\njava -jar helloSpringBoot-1.0-SNAPSHOT.jar\r\n~~~\r\n\r\n![image-20210523182426404](img/image-20210523182426404.png)\r\n\r\n**第三步：**测试，使用postman或者直接在浏览器输入http://localhost:8082/hello/boot\r\n\r\n得到结果：hello spring boot\r\n\r\n## 2.5 查看jar包内容\r\n\r\n~~~shell\r\njar tvf helloSpringBoot-1.0-SNAPSHOT.jar\r\n~~~\r\n\r\n# 3. 小结\r\n\r\n1. 通过Maven构建了一个空白Spring Boot项目，再通过引入web模块实现了一个简单的请求处理。\r\n2. 通过修改配置文件，更改端口号\r\n3. 编写了测试用例\r\n4. 打包jar包运行\r\n\r\n','<h2>2018-01-04</h2>\n<pre><code class=\"lang-\"># 使用vue的Webpack模板生成脚手架\n</code></pre>\n<h2>2018-01-05</h2>\n<pre><code class=\"lang-\"># 引入ElementUI\n\n# babel-plugin-component自定义主题\n# 首页\n# 登陆页\n# 注册页面\n# 日志页\n</code></pre>\n<h2>2018-01-07</h2>\n<pre><code class=\"lang-\"># 调整底部栏始终固定在底部\n# 日志页 添加时间轴\n# 首页的文章列表\n</code></pre>\n<h2>2018-01-08</h2>\n<pre><code class=\"lang-\"># 使用组件-博客作者tab页 \n# 添加第三方图标\n</code></pre>\n<h2>2018-01-09</h2>\n<pre><code class=\"lang-\"># 调整顶部导航栏：激活文字颜色，click点击\n# 组件-最新文章tab页\n\n# 最新文章、最热文章使用相同组件\n# 底部栏设计\n# 页面与两边边距改为100\n</code></pre>\n<h2>2018-01-10</h2>\n<pre><code class=\"lang-\"># 写博客 引入mavonEditor编辑器\n# 顶部导航栏都放入一个Menu中\n# 写文章页面\n#　mavonEditor局部引入\n\n#　页面的中间区域固定宽度，自动居中\n# 发布和取消\n# 发布dialog\n\n</code></pre>\n<h2>2018-01-11</h2>\n<pre><code class=\"lang-\"># 文章组件用守卫来改变body背景色\n# 调整登陆和注册页面，使其居中\n\n#子页面调整根元素为div\n#文章详情页\n\n</code></pre>\n<h2>2018-01-12</h2>\n<pre><code class=\"lang-\"># 文章详情页  内容  评论等\n\n</code></pre>\n<h2>2018-01-13</h2>\n<pre><code class=\"lang-\">## 重新调整页面结构	\n#顶部和底部 抽成  BaseHeader BaseFooter 组件\n#BlogView为单独页，以前是Home的子路由\n\n</code></pre>\n<h2>2018-01-15</h2>\n<pre><code class=\"lang-\"># 文章分类去掉子级\n# 将首页的文章列表抽成 ArticleItem组件\n# 增加文章的评论展示\n# 增加文章分类、标签页\n\n</code></pre>\n<h2>2018-01-15  2</h2>\n<pre><code class=\"lang-\"># 回到顶部去掉过渡动画（影响顶部导航栏）\n# 顶部导航栏 增加登录后菜单\n# 首页增加 最热标签\n# 增加 文章分类 标签的详情页\n# 将文章详情页、 文章分类标签页 改为Home的子路由（以前单独页）\n# Home组件增加路由判断：更正导航栏的状态、条件显示底部栏\n\n</code></pre>\n<h2>2018-01-16</h2>\n<pre><code class=\"lang-\"># 将写文章的顶部Header合并到BaseHeader中\n# 图片都放到了static目录下\n\n</code></pre>\n<h2>2018-01-24</h2>\n<pre><code class=\"lang-\"># 将自定义的theme放到assets下\n# 加入axios\n# 加入vuex\n# 实现登录\n# 实现退出\n\n</code></pre>\n<h2>2018-01-25</h2>\n<pre><code class=\"lang-\"># 实现注册逻辑\n# 写文章功能实现\n# 写文章时支持插入图片\n\n</code></pre>\n<h2>2018-01-26</h2>\n<pre><code class=\"lang-\"># 引入lodash工具类\n# 优化写文章的工具栏：滚动时固定顶部\n# 写文章 后台获取文章分类和标签\n\n# 首页的文章列表\n\n</code></pre>\n<h2>2018-01-27</h2>\n<pre><code class=\"lang-\"># 修改首页文章列表的样式\n# 首页加载文章功能\n# 文章查看功能\n# 文章分类和标签功能列表\n\n</code></pre>\n<h2>2018-01-28</h2>\n<pre><code class=\"lang-\"># 文章分类和标签详情\n\n</code></pre>\n<h2>2018-01-29</h2>\n<pre><code class=\"lang-\"># 文章分类和标签的文章数\n# 首页最热文章\n# 首页最新文章\n# 首页最热标签\n\n</code></pre>\n<h2>2018-01-30</h2>\n<pre><code class=\"lang-\"># BaseHeader放回views中\n# 修改Axios后置拦截，全局处理错误\n# 将登录 退出 和头像 放到一起\n\n</code></pre>\n',1),(21,'## 快速上手\n\n本节将介绍如何在项目中使用 Element。\n\n### 使用 Starter Kit\n我们提供了通用的项目模板，你可以直接使用。对于 Laravel 用户，我们也准备了相应的模板，同样可以直接下载使用。\n\n如果不希望使用我们提供的模板，请继续阅读。\n\n### 使用 vue-cli\n\n我们还可以使用 vue-cli 初始化项目，命令如下：\n\n```language\n> npm i -g vue-cli\n> mkdir my-project && cd my-project\n> vue init webpack\n> npm i && npm i element-ui\n```\n\n### 引入 Element\n你可以引入整个 Element，或是根据需要仅引入部分组件。我们先介绍如何引入完整的 Element。\n\n#### 完整引入\n在 main.js 中写入以下内容：\n```javascript\nimport Vue from \'vue\'\nimport ElementUI from \'element-ui\'\nimport \'element-ui/lib/theme-chalk/index.css\'\nimport App from \'./App.vue\'\n\nVue.use(ElementUI)\n\nnew Vue({\n  el: \'#app\',\n  render: h => h(App)\n})\n\n```\n以上代码便完成了 Element 的引入。需要注意的是，样式文件需要单独引入。\n\n#### 按需引入\n借助 babel-plugin-component，我们可以只引入需要的组件，以达到减小项目体积的目的。\n\n首先，安装 babel-plugin-component：\n\n','<h2>快速上手</h2>\n<p>本节将介绍如何在项目中使用 Element。</p>\n<h3>使用 Starter Kit</h3>\n<p>我们提供了通用的项目模板，你可以直接使用。对于 Laravel 用户，我们也准备了相应的模板，同样可以直接下载使用。</p>\n<p>如果不希望使用我们提供的模板，请继续阅读。</p>\n<h3>使用 vue-cli</h3>\n<p>我们还可以使用 vue-cli 初始化项目，命令如下：</p>\n<pre><code class=\"lang-language\">&gt; npm i -g vue-cli\n&gt; mkdir my-project &amp;&amp; cd my-project\n&gt; vue init webpack\n&gt; npm i &amp;&amp; npm i element-ui\n</code></pre>\n<h3>引入 Element</h3>\n<p>你可以引入整个 Element，或是根据需要仅引入部分组件。我们先介绍如何引入完整的 Element。</p>\n<h4>完整引入</h4>\n<p>在 main.js 中写入以下内容：</p>\n<pre><div class=\"hljs\"><code class=\"lang-javascript\"><span class=\"hljs-keyword\">import</span> Vue <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'vue\'</span>\n<span class=\"hljs-keyword\">import</span> ElementUI <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'element-ui\'</span>\n<span class=\"hljs-keyword\">import</span> <span class=\"hljs-string\">\'element-ui/lib/theme-chalk/index.css\'</span>\n<span class=\"hljs-keyword\">import</span> App <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'./App.vue\'</span>\n\nVue.use(ElementUI)\n\n<span class=\"hljs-keyword\">new</span> Vue({\n  <span class=\"hljs-attr\">el</span>: <span class=\"hljs-string\">\'#app\'</span>,\n  <span class=\"hljs-attr\">render</span>: <span class=\"hljs-function\"><span class=\"hljs-params\">h</span> =&gt;</span> h(App)\n})\n\n</code></div></pre>\n<p>以上代码便完成了 Element 的引入。需要注意的是，样式文件需要单独引入。</p>\n<h4>按需引入</h4>\n<p>借助 babel-plugin-component，我们可以只引入需要的组件，以达到减小项目体积的目的。</p>\n<p>首先，安装 babel-plugin-component：</p>\n',10),(1508411230628941827,'![4ECC3AECD1D8D2B62421E2D3453DC465.jfif](http://r9g425jpy.hd-bkt.clouddn.com/b4fd5f43-1dda-41a4-81d0-f15165e91117.jfif)','<p><img src=\"http://r9g425jpy.hd-bkt.clouddn.com/b4fd5f43-1dda-41a4-81d0-f15165e91117.jfif\" alt=\"4ECC3AECD1D8D2B62421E2D3453DC465.jfif\" /></p>\n',1508411230628941825),(1508606428285833220,'1![wallhavenv9v3r5.jpg](http://r9g425jpy.hd-bkt.clouddn.com/1280a69c-cbeb-40a2-8174-6d307ebd251f.jpg)','<p>1<img src=\"http://r9g425jpy.hd-bkt.clouddn.com/1280a69c-cbeb-40a2-8174-6d307ebd251f.jpg\" alt=\"wallhavenv9v3r5.jpg\" /></p>\n',1508606428269056001),(1508624022422204418,'![4ECC3AECD1D8D2B62421E2D3453DC465.jfif](http://r9g425jpy.hd-bkt.clouddn.com/2fcb0e7b-c5d5-4866-8646-ad220b188ab6.jfif)','<p><img src=\"http://r9g425jpy.hd-bkt.clouddn.com/2fcb0e7b-c5d5-4866-8646-ad220b188ab6.jfif\" alt=\"4ECC3AECD1D8D2B62421E2D3453DC465.jfif\" /></p>\n',1508624022300569601),(1508630069610348545,'![45d69e43d892d1be99958099ccf802b5.jfif](http://r9g425jpy.hd-bkt.clouddn.com/bfbd1de5-b581-4bf8-996c-2d05dec25317.jfif)','<p><img src=\"http://r9g425jpy.hd-bkt.clouddn.com/bfbd1de5-b581-4bf8-996c-2d05dec25317.jfif\" alt=\"45d69e43d892d1be99958099ccf802b5.jfif\" /></p>\n',1508630069580988418),(1522384150799618051,'666','<p>666</p>\n',1522384150799618049),(1522391436502798338,'666','<p>666</p>\n',1522391436435689474),(1522489501918228481,'666',NULL,1522489501918228482),(1522489887211126785,'777',NULL,1522489887211126786);
/*!40000 ALTER TABLE `blog_article_body` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article_tag`
--

DROP TABLE IF EXISTS `blog_article_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_article_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `tag_id` bigint(20) NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `article_id` (`article_id`) USING BTREE,
  KEY `tag_id` (`tag_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1523236450598449156 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article_tag`
--

LOCK TABLES `blog_article_tag` WRITE;
/*!40000 ALTER TABLE `blog_article_tag` DISABLE KEYS */;
INSERT INTO `blog_article_tag` VALUES (1,1,7),(2,1,5),(3,1,8),(1508411230628941826,1508411230628941825,5),(1508606428285833218,1508606428269056001,5),(1508606428285833219,1508606428269056001,8),(1508624022422204417,1508624022300569601,5),(1508630069580988419,1508630069580988418,6),(1522384150799618050,1522384150799618049,8),(1522391436502798337,1522391436435689474,8),(1523218869019799555,1523218869019799554,8),(1523220307133394947,1523220307133394946,8);
/*!40000 ALTER TABLE `blog_article_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类图标',
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类描述',
  `creator` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1523220208730836994 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (1,'/static/category/front.png','前端','前端是什么，大前端',NULL,NULL),(2,'/static/category/back.png','后端','后端最牛叉',NULL,NULL),(3,'/static/category/lift.jpg','生活','生活趣事',NULL,NULL),(4,'/static/category/database.png','数据库','没数据库，啥也不管用',NULL,NULL),(5,'/static/category/language.png','编程语言','好多语言，该学哪个？',NULL,NULL);
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_comment`
--

DROP TABLE IF EXISTS `blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `author_id` bigint(20) NOT NULL COMMENT '评论者id',
  `parent_id` bigint(20) DEFAULT '0',
  `to_uid` bigint(20) DEFAULT '0' COMMENT '给谁评论',
  `level` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论楼数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `article_id` (`article_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1523236463772758018 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comment`
--

LOCK TABLES `blog_comment` WRITE;
/*!40000 ALTER TABLE `blog_comment` DISABLE KEYS */;
INSERT INTO `blog_comment` VALUES (1508334713131544578,'真不错1','2022-03-28 14:46:34',1,1506809372143575041,0,1505704762788126721,'1'),(1508411259146014721,'真不错','2022-03-28 19:50:44',10,1506809372143575041,0,1506809372143575041,'1'),(1522844903205875713,'真不错','2022-05-07 15:44:53',1508411230628941825,1506809372143575041,0,1506809372143575041,'1'),(1523204025956716546,'1','2022-05-08 15:31:54',1508411230628941825,1,0,1506809372143575041,'1'),(1523210422358450178,'10','2022-05-08 15:57:19',10,1,0,1505704762788126721,'1');
/*!40000 ALTER TABLE `blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_permission`
--

DROP TABLE IF EXISTS `blog_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_permission`
--

LOCK TABLES `blog_permission` WRITE;
/*!40000 ALTER TABLE `blog_permission` DISABLE KEYS */;
INSERT INTO `blog_permission` VALUES (1,'查询权限','/admin/permission/permissionList','查询权限'),(8,'删除权限','/admin/permission/add','新增权限'),(9,'修改权限','/admin/permission/update','修改权限'),(10,'登录权限','/admin/user/user','登录权限'),(11,'用户查询权限','/admin/user/userList','用户查询权限'),(12,'用户修改权限','/admin/user/update','用户修改权限'),(13,'新增用户权限','/admin/user/add','用户新增权限');
/*!40000 ALTER TABLE `blog_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_sys_log`
--

DROP TABLE IF EXISTS `blog_sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `module` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `nickname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_sys_log`
--

LOCK TABLES `blog_sys_log` WRITE;
/*!40000 ALTER TABLE `blog_sys_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_sys_user`
--

DROP TABLE IF EXISTS `blog_sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '账号',
  `admin` varchar(1) DEFAULT '0' COMMENT '是否管理员 0普通用户 1管理员',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `create_date` datetime DEFAULT NULL COMMENT '注册时间',
  `deleted` varchar(1) DEFAULT '1' COMMENT '是否删除 0为删除 1为未删除',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `last_login` datetime DEFAULT NULL COMMENT '最后登录时间',
  `mobile_phone_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加密盐',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1523256283293609986 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_sys_user`
--

LOCK TABLES `blog_sys_user` WRITE;
/*!40000 ALTER TABLE `blog_sys_user` DISABLE KEYS */;
INSERT INTO `blog_sys_user` VALUES (1,'admin','1','/static/img/logo.b3a48c0.png','2022-05-06 14:52:06','1','1543395054@qq.com','2022-05-08 15:04:34',NULL,'admin','$2a$10$GfiHUCm3bBvQpqU0E4J.W.o0dL9.3n1Kh.kiCPV66BRgTW8G0KgEG',NULL,NULL),(12,'root','1','/static/img/logo.b3a48c0.png',NULL,'1','root@123.com','2022-05-08 14:49:51',NULL,'root','$2a$10$uGloOjUaGiIaXFzEspCFtOxUzjbGCcaQJAwl9sK6Rg8whCPLChjIi',NULL,NULL),(15,'user','1','/static/img/logo.b3a48c0.png','2022-05-08 15:05:59','1','user','2022-05-08 15:06:07',NULL,'user','$2a$10$hM1Deuxs63Y9tpie7iiEkupia1ZixKT4vLfiFFnmM5fIqPn0ucBO.',NULL,NULL),(1505704762788126721,'康立楠','0','/static/img/logo.b3a48c0.png','2022-05-06 15:03:04','1',NULL,'2022-05-08 14:48:54',NULL,'康立楠','939096C8E5BA243C3385E564C9DB1102','737E4A4C-E7F2-48D3-A47A-EAB19FA8939F',NULL),(1506809372143575041,'张三','0','/static/img/logo.b3a48c0.png','2022-05-06 15:03:44','1',NULL,'2022-05-07 15:54:08',NULL,'张三','4DBBC5650BD07CA91919B3DF94E54FBE','D5EE0703-C7B0-409D-ABC3-16528ACB88EB',NULL),(1523193933064634370,'李四','0','/static/img/logo.b3a48c0.png','2022-05-08 14:51:48','1',NULL,'2022-05-08 14:51:48',NULL,'李四','A9BED360862507E1F09AA2CE104E2FDB','8D34BA49-9CA7-4A2E-B885-DCD2E06D14B7',NULL),(1523256283293609985,'123','0','/static/img/logo.b3a48c0.png','2022-05-08 18:59:33','1',NULL,'2022-05-08 18:59:33',NULL,'1234','293C598939850FCF3C2060FAE95D778C','56822DA7-B4A0-46F9-B27C-311A21D432FF',NULL);
/*!40000 ALTER TABLE `blog_sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1523245477055213570 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (6,'/static/tag/java.png','spring',NULL,NULL),(7,'/static/tag/java.png','springmvc',NULL,NULL),(8,'/static/tag/css.png','111',NULL,NULL),(1523226617119846402,NULL,'Linux',NULL,NULL);
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-10  9:29:51
