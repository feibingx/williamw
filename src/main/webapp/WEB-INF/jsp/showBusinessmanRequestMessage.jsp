<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Great Banker</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="assets/js/google-code-prettify/prettify.css" rel="stylesheet">
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
<body>
<div class="page">
  <div class="logo">
    <img src="assets/img/logo.png">
  </div>  
  <div class="wrapper container-fluid">
      <div class="row-fluid result">
        <div class="dialog panel pull-left">
          <div class="info">
            <div class="custom-title">
              <div class="dialog-avatar pull-left">
                <img src="assets/img/customer-1.png">
              </div>
              <div class="dialog-title pull-left">
              <h1>${transactionBean.fromName}</h1>
              <h3>${transactionBean.reason}</h3>
              </div>
            </div>
            <hr>
              <div class="dialog-content clear">
                <div class="dialog-item">
                  <span>我需要</span>
                  <h3>${transactionBean.displayedAmount}</h3>
                </div>
                <div class="dialog-item">
                  <span>我愿意支付</span>
                  <h3>${transactionBean.displayedRate}</h3>
                </div>

                <div class="dialog-item">
                  <span>我承诺的借贷期为</span>
                  <h3>${transactionBean.displayedDebitDuration}</h3>
                </div>
              </div>
          </div>
          
         <div class="actions">
              <a class="btn btn-success" data-toggle="modal" href="#accept-request"><i class="icon-ok"></i> 同意他的请求</a>
              <a class="btn btn-danger" href="loanRequest/id/${transactionBean.id}?action=refuse"><i class="icon-remove"></i> 拒绝他的请求</a>
         </div>
        </div>
		<jsp:include page="/businessmanList" />
      </div>
		<jsp:include page="/bankerStatus?bankerId=${sessionScope.banker.id}" />

<div class="modal hide" id="accept-request">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">×</button>
    <h3>请行长确认放款</h3>
  </div>
  <div class="modal-body">
    <p>行长啊，我觉得这位先生看起来不是很诚恳，你还是要小心风险哈。</p>
  </div>
  <div class="modal-footer actions">
    <a href="loanRequest/id/${transactionBean.id}?action=agree" class="btn btn-success">同意放款</a>
    <a href="businessmanMessage?businessmanId=${transactionBean.id}" class="btn" data-dismiss="modal">我再想想</a>
  </div>
</div>

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/google-code-prettify/prettify.js"></script>
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
