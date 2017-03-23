<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
    <title>Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <meta name="keywords"
          content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates"/>
    <link href="css/style.css" rel='stylesheet' type='text/css'/>
    <!--webfonts-->
    <link href='http://fonts.useso.com/css?family=PT+Sans:400,700,400italic,700italic|Oswald:400,300,700'
          rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
    <!--//webfonts-->
    <script src="http://ajax.useso.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

</head>
<body>
<script>
    function Close() {
        var user = document.getElementById("register_username");
        user.value = "Username";
        var phonen = document.getElementById("register_phonenumber");
        phonen.value = "PhoneNumber";
        var em = document.getElementById("register_email");
        em.value = "E_mail";
        var pass = document.getElementById("register_password");
        pass.value = "Password";
        var bc = document.getElementById("mainform");
        bc.style.background = "#2b2b36";
    }
    ;
    function lblblue() {
        var bc = document.getElementById("mainform");
        bc.style.background = "#6756ea";
    }
    function lblpink() {
        var bc = document.getElementById("mainform");
        bc.style.background = "#ea569a";
    }
    function lblyellow() {
        var bc = document.getElementById("mainform");
        bc.style.background = "#f1c85f";
    }
</script>

<!--SIGN UP-->
<h1>基于JFinal+Hadoop+bootstrap+AngularJs的云端文件管理系统</h1>
<div class="login-form" id="mainform">
    <div class="close" onclick="Close()"></div>
    <div class="head-info">
        <label class="lbl-1" onclick="lblblue()"> </label>
        <label class="lbl-2" onclick="lblpink()"> </label>
        <label class="lbl-3" onclick="lblyellow()"> </label>
    </div>
    <form action="register" method="post">
        <s:if test="#session.username!=null">
            <input type="text" id="register_username" name="username" value="<s:property value="#session.username"/>" onfocus="this.value = '';"
                   onblur="if (this.value == '') {this.value = 'Username';}" style="margin-top: 10px;">
            <input type="text_phonenumber" id="register_phonenumber" name="phonenum" value="<s:property value="#session.phonenum"/>" onfocus="this.value = '';"
                   onblur="if (this.value == '') {this.value = 'PhoneNumber';}">
            <input type="text_email" id="register_email" name="email" value="<s:property value="#session.email"/>" onfocus="this.value = '';"
                   onblur="if (this.value == '') {this.value = 'E_mail';}">
        </s:if>
        <s:else>
            <input type="text" id="register_username" name="username" value="Username" onfocus="this.value = '';"
                   onblur="if (this.value == '') {this.value = 'Username';}" style="margin-top: 10px;">
            <input type="text_phonenumber" id="register_phonenumber" name="phonenum" value="PhoneNumber"
                   onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'PhoneNumber';}">
            <input type="text_email" id="register_email" name="email" value="E_mail" onfocus="this.value = '';"
                   onblur="if (this.value == '') {this.value = 'E_mail';}">
        </s:else>


            <input type="password_text" id="code" name="code" value="Code" onfocus="this.value = '';"
                   onblur="if (this.value == '') {this.value = 'Identifying Code';}"
                   style="margin-bottom: 0px;width: 140px;padding-left: 54px;padding-right: 54px;border-left-width: 10px;margin-left: 0px;margin-right: 20px;">
            <input type="submit" value="Get Code" style="border-radius: 10px;width: 100px;margin-top: 5px;height: 59px;">
        <div class="signin">
            <input type="password_text" id="register_password" name="password" value="Password"
                   onfocus="this.value = '';"
                   onblur="if (this.value == '') {this.value = 'Password';}" style="margin-bottom: 15px;">
            <input type="submit" value="comfirm" readonly="true" style="  font-size: 20px;
  color: #fff;
  outline: none;
  border: none;
  background: #3ea751;
  width: 100%;
  padding: 18px 0;
  text-align: center;
  border-bottom-left-radius: 15px;
	-webkit-border-bottom-left-radius: 15px;
	-moz-border-bottom-left-radius: 15px;
	-o-border-bottom-left-radius: 15px;
	border-bottom-right-radius: 15px;
	-webkit-border-bottom-right-radius: 15px;
	-moz-border-bottom-right-radius: 15px;
	-o-border-bottom-right-radius: 15px;
	border-top-right-radius: 15px;
	-webkit-border-top-right-radius: 15px;
	-moz-border-top-right-radius: 15px;
	-o-bordertop-right-radius: 15px;
	cursor: pointer;">
        </div>
    </form>
</div>
</div>

</body>
</html>