<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <style type="text/css">
    .wrapper {margin:auto; height: auto 220px; background: #FFF; width: 800px; }
    .error {color: #B94A48;}
    .control-label{ width: 90px !important;}
    .controls {margin-left: 100px !important;;}
    </style>
</head>
<body>
    <div class="page">
        <div class="logo">
            <a href="login" class=titlea" ><img class="pull-left title" src="assets/img/logo.png"></a>
            <div class="pull-left title">自荐招生系统 管理后台</div>
            <a href="login" class="pull-right">普通登录</a>
        </div>
        <div class="wrapper">
            <!-- form begin -->
            <form action="supereditor" id="theform" method="post">
                <button id="submitbtn" type="submit" class="btn btn-primary pull-right">提交</button>
                <div class="control-group">本后台用于编辑现实首页</div>                
                <div style="padding-top: 10px;">
                    <textarea name="logintext" id="logintext" >${logintext}</textarea>                    
                </div>
            </div>
        </form>
        <!-- form end--> </div>
</div>

<!-- Le javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="assets/js/jquery.js"></script>
<script src="assets/js/jquery.validate.js"></script>
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
<script src="assets/js/editor_config_admin.js"></script>
<script src="assets/js/editor_all.js"></script>
<script type="text/javascript">new UE.ui.Editor().render("logintext");</script>
</body>
</html>