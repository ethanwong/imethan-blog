<p>
    <span style="color:#548dd4;font-family:微软雅黑, Microsoft YaHei;font-size:24px">开发环境</span>
</p>
<ol>
    <li>
        <p>
            移除开发环境配置文件，仅保留项目源代码和gradle配置文件，自由选择开发工具。
        </p>
    </li>
    <li>
        <p>
            使用自动化工具Gradle 4作为项目的构建工具，Gradle为类似Maven类的构建工具，比Maven简洁。
        </p>
    </li>
    <li>
        <p>
             JDK版本为1.8，使用tomcat 8作为运行服务， 数据库使用的是MySQL 5。
        </p>
    </li>
    <li>
        <p>
            在Windows NT环境下开发，部署于云服务环境。
        </p>
    </li>
</ol>
<p>
    <br/>
</p>
<p>
    <span style="color:#548dd4;font-family:微软雅黑, Microsoft YaHei;font-size:24px">技术架构</span>
</p>
<ol>
    <li>
        <p>
            使用Spring作为IOC容器，实现AOP功能，并且整合项目中用到的其他开源框架，例如:Apache shiro,Hibernate等。<br/>
        </p>
    </li>
    <li>
        <p>
            使用Spring data jpa作为数据库持久层规范，底层实现采用的是Hibernate框架，Hibernate是一个轻量级的ORM框架。
        </p>
    </li>
    <li>
        <p>
            使用Spring MVC框架，开始使用了Spring MVC后才发现，Struts2是那么的“厚重”。
        </p>
    </li>
    <li>
        <p>
            使用Apache shiro作为权限框架，Apache shiro相对会比Spring Security简单,<span style="line-height: 22.8571434020996px; white-space: normal;">Spring Security功能更加强大</span>。
        </p>
    </li>
    <li>
        <p>
            为了减少页面开发代码的冗余，还引入了SiteMesh装饰框架，简单易用，提高开发效率。
        </p>
    </li>
    <li>
        <p>
            前端页面展现使用了Bootstrap开源框架，做出来效果简洁大方，节省了大量的时间。
        </p>
    </li>
    <li>
        <p>
            页面交互使用了较多的Ajax交互，页面渲染性能不是很高，后期学习了NodeJs后再来完善。
        </p>
    </li>
    <li>
        <p>
            Jquery插件是使用如下：
        </p>
    </li>
</ol>
<ul>
    <li>
        富文本编辑器，即此刻编写这边文章在用的编辑器使用的百度前端开发团队的UEditor。
    </li>
    <li>
        图片上传插件，使用的也是百度前端开发团队的webuploader。
    </li>
    <li>
        “Blog”模块的下拉滚动插件使<span id="_baidu_bookmark_start_1" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_start_3" style="display: none; line-height: 0px;">‍</span>用的是<a href="https://github.com/ethanxm/imethan/blob/master/WebContent/theme/js/jquery.infinitescroll.js" id="5634f3947cec655e21a22d0307717713-88633e12e2164348e56f1bd96d515a7747a83eca" title="jquery.infinitescroll.js">jquery.infinitescroll.js<span id="_baidu_bookmark_end_2" style="display: none; line-height: 0px;">‍</span></a>。<span id="_baidu_bookmark_end_4" style="display: none; line-height: 0px;">‍</span>
    </li>
    <li>
        文章阅读更多使<span id="_baidu_bookmark_start_6" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_start_8" style="display: none; line-height: 0px;">‍</span>用的插件是<a href="https://github.com/ethanxm/imethan/blob/master/WebContent/theme/js/readmore.js" id="f02c54a9a80a30ed724a772e1be05715-3296b45ef8bd194f1e06c9c0e37dcb49fd4ab44e" title="readmore.js">readmore.js<span id="_baidu_bookmark_end_7" style="display: none; line-height: 0px;">‍</span></a>。<span id="_baidu_bookmark_end_9" style="display: none; line-height: 0px;">‍</span>
    </li>
    <li>
        树形展现插件使用的是国产的Ztree。
    </li>
</ul>
