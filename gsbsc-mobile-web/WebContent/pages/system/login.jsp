<%@page import="com.netsteadfast.greenstep.util.LocaleLanguageUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="gs" uri="http://www.gsweb.org/controller/tag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE html>
<html>
<head>
<title>bambooBSC mobile login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="./bootstrap-4.0.0-alpha.4/css/bootstrap.css" crossorigin="anonymous">
<script src="./bootstrap-4.0.0-alpha.4/js/bootstrap.js" crossorigin="anonymous"></script>

<style type="text/css">

body {
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #ffffff;
}

.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}

</style>

<script type="text/javascript">

function redirectLogin(sel) {
	window.location = '<%=basePath%>login.action?lang=' + sel.value;
}

</script>

</head>

<body>

<div class="container">	
<form class="form-signin" name="loginForm" id="loginForm" action="./login.action" method="post">

	<div><img src="./images/original.jpg" width="220" height="30" /></div>
	
	<br/>
	
	<div class="form-group">
    	<label for="lang">${action.getText('LOGIN_language')}</label>    
          	<select name="lang" id="lang" class="form-control" onchange="redirectLogin(this);">
          	<%
          	String defaultLang = (String)request.getAttribute("lang");
          	Map<String, Object> langs = LocaleLanguageUtils.getMap();
          	for (Map.Entry<String, Object> entry : langs.entrySet()) {
          	%>
          	<option value="<%=entry.getKey()%>" <% if ( entry.getKey().equals(defaultLang) ) { %> selected <% } %> ><%=String.valueOf( entry.getValue() )%></option>
          	<% 	
          	}
          	%>
          	</select>    
	</div>  	   
        
	<!-- 2015-12-18 add https://github.com/billchen198318/bamboobsc/issues/5 -->
	<s:if test=" \"Y\" == loginCaptchaCodeEnable ">         
	<div class="form-group">
  		<label for="captcha">Captcha code <img src="./kaptcha.jpg?n=<%=System.currentTimeMillis()%>"/></label>
  		<input class="form-control" type="text" id="captcha" name="captcha">
	</div>		
	</s:if>
	<!-- ##### -->
	
	<div class="form-group">
  		<label for="username">${action.getText('LOGIN_username')}</label>
  		<input class="form-control" type="text" id="username" name="username" maxlength="12">
	</div>	
	<div class="form-group">
  		<label for="password">${action.getText('LOGIN_password')}</label>
  		<input class="form-control" type="password" id="password" name="password" maxlength="25">
	</div>	
	
	<s:if test=" \"\" != pageMessage && null != pageMessage ">
	<p class="bg-warning"><s:property value="pageMessage" escapeJavaScript="true"/></p>
	</s:if>	
	
	<button type="submit" class="btn btn-lg btn-primary btn-block" name="submit" type="submit">${action.getText('LOGIN_btnLogin')}</button>
	
    <br/>
    <label>Only support <b>Chrome</b> (recommend) or support <b>HTML5 date field</b> browser.</label>
    <br/>
	<label>bambooBSC 0.7.0 mobile version</label>

</form>
</div>

</body>
</html>