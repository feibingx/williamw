<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0054)http://dt.hpe.cn/opencms/opencms/oldWeb/daode/zjzs.htm -->
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
  <META content="text/html; charset=utf-8" http-equiv="Content-Type">
  <LINK rel="stylesheet" 
type="text/css" href="assets/img/zjzs_files/zygydddr0623.css">
  <LINK rel="icon" 
type="image/x-icon" 
href="http://www.wenming.cn/jingtai/images/favicon.ico">
  <LINK rel="shortcut icon" 
type="image/x-icon" href="http://www.wenming.cn/jingtai/images/favicon.ico">
  <TITLE>上海市大同中学自荐招生平台</TITLE>
  <META name="GENERATOR" content="MSHTML 9.00.8112.16476">
  <STYLE type="text/css">
<!--
.STYLE1 {font-family: "宋体"}
.STYLE2 {font-size: 18px}
.STYLE3 {color: #993300}
.STYLE6 {font-size: 14px; font-family: "宋体"; }
.STYLE7 {
  font-size: 16px;
  width: 700px;
}
.STYLE8 {font-size: 14px}
.STYLE9 {font-size: xx-large}
.STYLE10 {font-family: "宋体"; font-size: 12px; }
.STYLE11 {font-size: 12px}
.STYLE12 {font-size: 12}
.STYLE14 {color: #993300; font-weight: bold; }
.STYLE18 {font-family: "宋体"; font-size: 16px; color: #000000; }
.STYLE19 {font-family: "宋体"; font-size: 18px; color: #000000; }
.STYLE24 {
	font-size: 14px;
	color: #000000;
	font-family: "宋体";
}
#Layer1 {
  position:absolute;
  width:200px;
  height:115px;
  z-index:1;
}
-->
</STYLE>
</HEAD>
<BODY>
  <DIV class="top">
    <DIV id="top"></DIV>
  </DIV>
  <DIV id="header">
    <DIV class="header">
      <IMG border="0" src="assets/img/zjzs_files/zijianpingtai.jpg" 
width="980" height="185"></DIV>
  </DIV>
  <DIV id="content">
    <DIV id="Main">
      <DIV id="MainLeft">
        <DIV id="Nav">
          <DIV class="navRight"></DIV>
        </DIV>
        <DIV class="MainTwo">
          <DIV class="TwoLeft">
            <DIV class="OneLBox OneLBox1 TwoLBox">
              <DIV class="TwoLBoxTop">
                <DIV class="TwoLBoxTLeft STYLE2">用户登录</DIV>
              </DIV>
              <DIV class="TwoLBoxTxt TwoLBoxTxt_difang">
                <FORM method="post" name="form1" action="login">
                  <LABEL></LABEL>
                  <div id="Layer1">
                    <div align="left">
                      <c:if test="${errmessage!=null && fn:length(errmessage)> 0}">
                        <div class="help-inline error">
                          <fmt:message key="${errmessage}" />
                        </div>
                      </c:if>
                      <div>
                        <label for="name">用户名</label>
                        <div>
                          <input type="text" id="name" name="name" placeholder="请输入姓名" class="input"></div>
                      </div>
                      <div>
                        <label for="inputPassword">密码</label>
                        <div>
                          <input type="password" id="password" name="password" placeholder="请输入密码" class="input"></div>
                      </div>
                      <div>
                        <div>
                          <button type="submit" >登录</button>
                          &nbsp;
                          <a href="register" >注册</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <P>&nbsp;</P>
                  <P>&nbsp;</P>
                  <P>&nbsp;</P>
                  <P>&nbsp;</P>
                  <P>&nbsp;</P>
                  <P>&nbsp;</P>
                  <P>&nbsp;</P>
                  <DIV class="TwoLBoxTLeft STYLE2 STYLE3">友情链接</DIV>
                  <P>&nbsp;</P>
                  <P>&nbsp;</P>
                  <H1 class="STYLE6">
                    <SPAN class="STYLE9">
                      <A href="http://www.shmeea.edu.cn/" target="_blank">上海招考热线</A>
                    </SPAN>
                  </H1>
                  <H1 class="STYLE6" align="left">
                    <SPAN class="STYLE9">
                      <A href="http://dt.hpe.sh.cn/" target="_blank">上海市大同中学</A>
                    </SPAN>
                  </H1>
                  <P class="STYLE2" align="left">&nbsp;</P>
                  <P>
                    <A 
href="http://dt.hpe.sh.cn/opencms/opencms/index.html"></A>
                  </P>
                </FORM>
              </DIV>
            </DIV>
          </DIV>
          <DIV class="TwoRight">
            <DIV class="TwoRBoxTop">
              <DIV class="TwoRBoxTLeft STYLE7">
                <P class="STYLE1" align="left">
                  <SPAN class="STYLE14">招生动态</SPAN>
                </P>
                <P class="STYLE19" align="left">
                    <span class="STYLE24">&#8250; 请各位考生于注册填报成功即日起至5月14日16:00之前将相关材料递交我校。<br>
  &#8250; 请各位家长和考生务必登录上海招考热线，完成报考我校的相关流程。<br>
&#8250; 考生所填写递交的材料必须真实有效，否则一切后果由考生本人负责。<br>
&#8250; 请各位考生妥善保管注册名和密码，并及时登录网站查询最新动态。</span>
                </P>
                <P class="STYLE18" align="left">&nbsp;</P>
              </DIV>
              <DIV class="moreOne">更多&gt;</DIV>
            </DIV>
            <DIV align="center">
              <P class="STYLE1">&nbsp;</P>
              <P class="STYLE1" align="left">&nbsp;</P>
              <P class="STYLE1" align="left">&nbsp;</P>
              <P class="STYLE1" align="left">&nbsp;</P>
              <DIV class="TwoRBoxTLeft STYLE7">
                <SPAN class="STYLE1">
                  <SPAN 
class="STYLE14">招生政策</SPAN>
                </SPAN>
              </DIV>
              <P class="STYLE1" align="left">&nbsp;</P>
              <P class="STYLE1" align="left">
                <SPAN class="STYLE8">
                  <SPAN class="STYLE11">
                    <SPAN 
class="STYLE12">
                      <SPAN class="STYLE11">
                        <A href="http://dt.hpe.sh.cn/opencms/opencms/news/AdmissionsInformation/1440fde1-a6f8-11e2-9ee9-6944ccbba2e6.html" 
target="_blank">• 2013年上海市大同中学“提前招生录取”方案...</A>
                      </SPAN>
                    </SPAN>
                  </SPAN>
                </SPAN>
              </P>
              <P class="STYLE10" align="left">
                <A href="http://dt.hpe.sh.cn/opencms/opencms/news/AdmissionsInformation/4415d61a-a6fb-11e2-9ee9-6944ccbba2e6.html" 
target="_blank">• 2013年上海市大同中学推荐生招生计划表...</A>
              </P>
              <P class="STYLE10" align="left">
                <A href="http://dt.hpe.cn/opencms/opencms/news/AdmissionsInformation/ef3627e3-6360-11e2-9748-6944ccbba2e6.html" 
target="_blank">• 2013年上海市大同中学高中艺术特长生招生简章...</A>
              </P>
              <P class="STYLE1" align="left">
                <SPAN class="STYLE11">
                  <A href="http://dt.hpe.sh.cn/opencms/opencms/news/AdmissionsInformation/9ba2acab-a567-11e2-b383-6944ccbba2e6.html" 
target="_blank">• 2013年上海市大同中学体育特长生招生办法...</A>
                </SPAN>
              </P>
              <P class="STYLE1">&nbsp;</P>
            </DIV>
            <DIV class="mingdan_dongtai">
              <a href="assets/img/zjzs_files/2013zsjc1.jpg" target="_blank">
                <img border="0" src="assets/img/zjzs_files/Table_2013zsjc1.jpg" 
width="339" height="185"></a>
              <a href="assets/img/zjzs_files/2013zsjc2.jpg" target="_blank">
                <IMG border="0" src="assets/img/zjzs_files/Table_2013zsjc2.jpg" 
width="339" height="185"></a>
            </DIV>
            <!--
      <div class="mingdan_dongtai">
            <ul>
              <li>
                <a href="#" target="_blank">
                  <img src="images/pic/20115.jpg" width="131" height="87" border="0" />
                </a>
              </li>
              <li>
                <a href="#" target="_blank">
                  <img src="images/pic/20116.jpg" width="131" height="87" border="0" />
                </a>
              </li>
              <li>
                <a href="#" target="_blank">
                  <img src="images/pic/20117.jpg" width="131" height="87" border="0" />
                </a>
              </li>
              <li>
                <a href="#" target="_blank">
                  <img src="images/pic/20118.jpg" width="131" height="87" border="0" />
                </a>
              </li>
            </ul>
          </div>
          -->
        </DIV>
      </DIV>
      <DIV class="MainFou"></DIV>
    </DIV>
    <DIV id="MianRight"></DIV>
  </DIV>
</DIV>
</BODY>
</HTML>