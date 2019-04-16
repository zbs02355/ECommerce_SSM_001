# 基于SSM的电子商务平台使用说明
### 开发环境
---
- eclipse-j2EE
- jdk1.8
- Spring5.0.2
- Spring MVC5.0.2
- Mybatis5.0.2
- MySQL 5.7

### 使用步骤
---
1. 在文件根目录下有一个`shop.sql`文件，执行该SQL文件，会生成该电子商务平台所对应的数据库结构
2. 将项目添加到Tomcat中，并启动Tomcat
3. 在浏览器地址栏中输入localhost:端口号//ECommerce_SSM_001/before进入平台首页，如图所示
![](description/p1.jpg)
4. 在浏览器地址栏中输入localhost:端口号//ECommerce_SSM_001/toLogin进入登陆界面，如图所示
![](description/p2.jpg)
5.在浏览器地址栏中输入localhost:端口号//ECommerce_SSM_001/admin进入后台管理首页，如图所示
![](description/p3.jpg)

### 附录
---
- 测试中的管理员账户
   - user: admin
   - password: 123456
- 测试中的普通用户
   - user: tom
   - password: 123456