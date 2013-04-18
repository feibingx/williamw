<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>

<html lang="en">
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

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
  </head>

<style>

</style>

  <body>

<div class="page">
  <div class="logo">
    <img src="assets/img/logo.png">
  </div>  
  <div class="wrapper container-fluid"> 
      <div class="result">
        <div class = "status-list" data-spy="scroll">
          <ul class="loan-list">
          <c:forEach var="transaction" items="${transactionList}">
            <li class="loan-list-item fluid-row">
              <div class="list-avatar">
                <img src="assets/img/user-icon.png">
              </div>
              <div class="pull-left list-applicant">
                <label>实业家</label>
                <h3>${transaction.fromName}</h3>
              </div>
              <div class="pull-left list-money">
                <label>借款金额</label>
                <h3>${transaction.displayedAmount}</h3>
              </div>
              <div class="pull-left list-rate">
                <label>借贷利率</label>
                <h3>${transaction.displayedRate}</h3>
              </div>
              <div class="pull-left list-day-left">
                <label>剩余时间</label>
                <h3>${transaction.displayedRemainderTime}</h3>
              </div>
              <div class="pull-left list-progress"> 
                <div class="progress">
                    <div class="bar" style="width: ${transaction.progress};"></div>
                </div>
              </div>
            </li>
            </c:forEach>
          </ul>
        </div>

      </div>
      <jsp:include page="/banker/${sessionScope.banker.id}" />
         
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


  </body>
</html>

