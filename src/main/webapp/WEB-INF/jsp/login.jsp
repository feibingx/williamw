<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <title>大同中学自荐招生系统</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Le styles -->
  <link href="assets/css/bootstrap.css" rel="stylesheet">
  <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->

  <!-- Le fav and touch icons -->
  <link rel="shortcut icon" href="assets/ico/favicon.ico">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
  <style type="text/css">
    .wrapper {margin:auto; height: 160px; background: #FFF; width: 400px; }
    .page{margin: 0 auto; max-width: 800px; height: 100%; min-height:100%; _height:100%; margin-bottom:-55px;}
    .error {color: #B94A48;}
    .errmsg{ margin-left: 100px;}
    .hidden-link { color: white; }
    .hidden-link:hover { color: #EDEDED; }
    .centerw { padding-top: 155px;}

    html{height:100%;}
      body {
        height:100%;
      }

      h3{
       border-bottom: 1px solid #FF9900;
       border-top: 1px solid #FF9900;
       padding: 0 0 0 15px;
       color: #993300;
      }
      .container-narrow {
        margin: 0 auto;
        max-width: 1000px;
      }
      .container-narrow > hr {
        margin: 30px 0;
      }

      .jumbotron {
        margin: 60px 0;
        text-align: center;
      }
      .jumbotron h1 {
        font-size: 72px;
        line-height: 1;
      }
      .jumbotron .btn {
        font-size: 21px;
        padding: 14px 24px;
      }

      .marketing {
        margin: 0;
      }
      .marketing p + h4 {
        margin-top: 25px;
        margin-left: 25px;
      }
      .span5{
        margin-bottom:10px;
        padding: 16px;
      }
      #picslice {
      background: #FFF;
      overflow:hidden;
      border: 1px dashed #CCC;
      width: 100%;
      max-width: 1000px;
      height: 700px;
      }
      #picslice img {
      border: 3px solid #F2F2F2;
      }
      #inpicslice {
      float: left;
      width: 800%;
      }
      #picslice1 {
      float: left;
      }
      #picslice2 {
      float: left;
      }

      .TwoLBoxTop {
    border-top: 10px solid #FFBC10;
    border-left: 10px solid #FFBC10;
    border-right: 10px solid #FFBC10;
    border-bottom: 30px solid #FFBC10;
    margin: 15px 0 15px 0;
    padding: 0 0 25px 0;
     float: left;
     width: 260px;
}
form{
  padding: 0 0px 0px 20px;
}
.loginTitle{
  background-color: #FFBC10;
  padding: 0px 0px 0 20px ;
  color: #993300;
    font-size: 17px;
    height: 29px;
    line-height: 29px;
    font-weight: bold;
}
    </style>

  <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
  <script src="../assets/js/html5shiv.js"></script>
  <![endif]-->
</head>

<body>

  <div class="container-narrow">

    <div class="masthead" style="margin:auto;">
      <IMG border="0" src="assets/img/zjzs_files/zijianpingtai.jpg" width="1000"></div>

    <div class="row-fluid marketing">
      <div class=" TwoLBoxTop">
        <p class="loginTitle">用户登录</p>
        <div>
          <c:if test="${errmessage!=null && fn:length(errmessage)>0}">
            <div class="help-inline error">
              <fmt:message key="${errmessage}" />
            </div>
          </c:if>

          <form class="form-vertical" action="login" method="post" >
            <div class="control-group">
              <label class="control-label" for="name">用户名</label>
              <div class="controls">
                <input type="text" id="name" name="name" placeholder="请输入姓名" class="input">
                <span id="input01alert"  class="help-inline hidden">不能为空</span>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="inputPassword">密码</label>
              <div class="controls">
                <input type="password" id="password" name="password" placeholder="请输入密码" class="input">
                <span id="input02alert"  class="help-inline hidden">不能为空</span>
              </div>
            </div>
            <div class="control-group">
              <div class="controls">
                <button type="submit" class="btn">登录</button>
                <span class="help-inline hidden">nbsp;</span>
                <a href="register" class="btn">注册</a>
                <span class="help-inline hidden">nbsp;</span>
              </div>
            </div>
          </form>
        </div>
        <div style="margin-top:60px; padding: 20px;">
          <ul class="nav nav-tabs nav-stacked" style="width:220px;">
            <li class="nav-header" style="backgournd: #FFF; color: #000000" >
              <h4 style=" color: #993300;">友情链接</h4>
            </li>
            <li>
              <a href="http://www.shmeea.edu.cn/node2/index.html">上海招考热线</a>
            </li>
            <li>
              <a href="http://dt.hpe.sh.cn/opencms/opencms/index.html">大同中学</a>
            </li>
          </ul>
        </div>
      </div>

      <div class="span8">
      <div>
          ${logintext}
          </div>      </div>
    </div>
    <!-- <hr>-->
    <div id="picslice">
      <div id="inpicslice">
        <div id="picslice1">
          <a href="assets/img/zjzs_files/2013zsjc1.jpg" target="_blank">
            <img src="assets/img/zjzs_files/Table_2013zsjc1.jpg" border="0" />
          </a>
          <a href="assets/img/zjzs_files/2013zsjc2.jpg" target="_blank">
            <img src="assets/img/zjzs_files/Table_2013zsjc2.jpg" border="0" />
          </a>
        </div>
        <div id="picslice2"></div>
      </div>
    </div>
  </div>
</div>
<!-- /container -->
<!-- Footer ================================================== -->
<footer class="footer"  valign="bottom">
  <div class="container">
    <p class="pull-right">本站推荐使用Firefox、Chrome浏览</p>
    <p>Copyrigth ©2013 大同高级中学</p>
  </div>
</footer>

<!-- Le javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="assets/js/jquery.js"></script>
<script src="assets/js/bootstrap-transition.js"></script>
<script src="assets/js/bootstrap-alert.js"></script>
<script src="assets/js/bootstrap-modal.js"></script>
<script src="assets/js/bootstrap-dropdown.js"></script>
<script src="assets/js/bootstrap-scrollspy.js"></script>
<script src="assets/js/bootstrap-tab.js"></script>
<script src="assets/js/bootstrap-tooltip.js"></script>
<script src="assets/js/bootstrap-popover.js"></script>
<script src="assets/js/bootstrap-button.js"></script>
<script src="assets/js/bootstrap-collapse.js"></script>
<script src="assets/js/bootstrap-carousel.js"></script>
<script src="assets/js/bootstrap-typeahead.js"></script>
<script src="assets/js/application.js"></script>
<script>
  var speed = 27;
  var tab = document.getElementById("picslice");
  var tab1 = document.getElementById("picslice1");
  var tab2 = document.getElementById("picslice2");
  tab2.innerHTML = tab1.innerHTML;

  function Marquee() {
    if (tab2.offsetWidth - tab.scrollLeft <= 0) tab.scrollLeft -= tab1.offsetWidth
    else {
      tab.scrollLeft++;
    }
  }
  var MyMar = setInterval(Marquee, speed);
  tab.onmouseover = function() {
    clearInterval(MyMar)
  };
  tab.onmouseout = function() {
    MyMar = setInterval(Marquee, speed)
  };
        $(function(){
        $("form").submit(function(){
            if( $("#name").attr("value") == ""){
                $("#input01alert").removeClass("hidden");
                $("#input01alert").addClass("error");
                $("#input01alert").html("用户名不能为空");
                return false;
            }
            if( $("#password").attr("value") == ""){
                $("#input02alert").removeClass("hidden");
                $("#input02alert").addClass("error");
                $("#input02alert").html("密码不能为空");
                return false;
            }
            return true;
        });

        
    });
    </script></body>
</html>