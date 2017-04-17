# dbhomework
数据库作业

### 这是一个用python实现的，基于tornado框架的网站，URL地址是118.89.25.125:8080

用下载源代码在本机运行，需要**安装python2**，并**配置tornado环境**：
```
pip install tornado
```
在python中操作数据库，需要安装数据库驱动：
```
pip install pymysql
```

此外还需要新建mysql数据库:
```sql
mysql>create database university;
```
并运行项目中的`Create_tables.sql`和`insert_datas.sql`来建表和插入数据

运行时只需在命令行进入项目文件夹，输入：
```
python homework.py
```

然后就可以在浏览器输入`localhost:8080`访问

### 整个网站是一个数据库应用，可以对university数据库的student数据表进行CURD操作

- 在`/select`下，通过输入学生id来查找学生记录；若输入为空，则返回全部学生记录
- 在`/delete`下，通过输入学生id来删除学生记录，不支持空输入
- 在`/update`，`/insert`下通过输入学生记录的所有字段来进行更新和插入操作，不支持空输入
