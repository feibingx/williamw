<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh">
  <head>
    <meta charset="utf-8">
    <title>Great Banker1</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
    <!-- <link href="assets/css/docs.css" rel="stylesheet"> -->
    <link href="assets/css/style.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

  </head>

<style>

</style>

  <body>

<div class="page">
  <div class="logo">
    <img src="assets/img/logo.png">
  </div>
		<div class="wrapper container-fluid">
			<div>
				<c:if test="${errmessage!=null && fn:length(errmessage)>0}">
					<div class="help-inline error">
						<fmt:message key="${errmessage}" />
					</div>
				</c:if>
			</div>

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
			<script src="assets/js/application.js"></script></body>
</html>

