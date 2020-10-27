## 微服务平台
微服务平台由服务注册中心、服务网关、鉴权中心和RBAC权限管理服务组成。
主要技术栈为Spring Cloud + Nacos + Spring GateWay + Sentinal + Spring Security Oauth2 + Spring Feign。
微服务平台的主要目标是提供一个快捷易上手的微服务脚手架。
用户只需基于Spring Boot开发业务程序，通过在POM文件中导入一定的包，就可以高效使用Spring Cloud全家桶的一系列功能。
降低单体应用升级到微服务的难度和微服务的上手难度，基本做到只需掌握Spring Boot就可参与Spring Cloud微服务的开发。
### 代码组成
代码分为admin、gateway、oauth三个模块，每个模块可分别打包。
admin模块是抽离并实现业务开发流程中的用户、角色、权限等通用功能，让用户更集中于业务逻辑开发。
gateway模块是微服务网关，所有服务的统一入口，配合oauth模块实现了统一鉴权和登陆认证功能。
oauth模块是认证与鉴权中心，基于Spring Security和Oauth2实现了单点登陆和认证鉴权功能。
#### admin模块
admin模块主要是实现用户管理、角色管理、菜单管理和权限管理以及代码生成功能。
admin是可完全独立运行的程序，用户开发业务程序可仿照admin。
#### gateway模块
gateway模块是配置各服务的路由，并解析JWT，获取当前用户权限，并判断该用户是否有权限访问后端URL，实现统一认证与鉴权。
#### oauth模块
oauth模块是结合Spring Security和Oauth2实现认证与鉴权。
通过配置授权服务器，实现登陆认证和配置Token，使用JWT进行Token的加密和无状态传输。
通过配置资源服务器，保证授权服务器的安全性。

### 使用方法
用户只需将新建的Spring Boot项目注册到Nacos，使用Feign调用admin模块的通用功能模块。
admin模块已实现RBAC权限管理，并支持网页操作，通过网页可快速定制用户角色权限关系。
网页访问地址http://localhost:9092，登陆名/密码：zhangsan/123456

#### POM配置
POM文件增加如下依赖：
```<dependency>
               <groupId>com.alibaba.cloud</groupId>
               <artifactId>spring-cloud-starter-alibaba-nacos-discovery</artifactId>
           </dependency>
           <dependency>
               <groupId>org.springframework.cloud</groupId>
               <artifactId>spring-cloud-starter-openfeign</artifactId>
           </dependency>
           <dependency>
               <groupId>com.alibaba.cloud</groupId>
               <artifactId>spring-cloud-starter-alibaba-sentinel</artifactId>
           </dependency>
   
           <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-starter-web</artifactId>
           </dependency>
           <dependency>
               <groupId>mysql</groupId>
               <artifactId>mysql-connector-java</artifactId>
               <version>8.0.18</version>
           </dependency>
           <dependency>
               <groupId>com.baomidou</groupId>
               <artifactId>mybatis-plus-boot-starter</artifactId>
               <version>3.3.0</version>
           </dependency>
```
启动文件增加注解：
```
@SpringBootApplication
@EnableFeignClients #远程调用其它微服务接口
@EnableDiscoveryClient #注册服务
```
登陆接口调用方法：
post请求，URL为http://gateway模块的ip:8000/uaa/oauth/token
请求body参数为：
client_id:password
client_secret:wangu123!@#
username:用户名
password:密码
grant_type:password

