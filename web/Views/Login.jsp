<%-- 
    Document   : Login
    Created on : Jun 20, 2022, 7:11:32 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="css/styleLogin.css"/>
</head>

<body>
    <div id="main">
        <!-- header -->
        <div id="header">
            <div class="logo">
                <a href="./home" style="color:white ;">CNG</a>
            </div>
        </div>
        <!-- content -->
        <h1 class="row">LOGIN OR CREATE AN ACCOUNT</h1>
        <div id="content" class="row">
            <div class="left login">
                <div class="text-content">
                    <h3 class="text-heading">REGISTERED CUSTOMERS</h3>
                    <div class="text-discription">If you have an account with us, please log in.</div>
                </div>
                <form action="login" method="post">
                    <h4>LOGIN NAME <label>*</label></h4>
                    <input type="text" name="name" required>
                    <h4>PASSWORD <label>*</label></h4>
                    <input type="password" name="pass" required><br>
                    <a class="forgotLink" href="">Forgot your password?</a><br>
                    <h5 style="color: red; margin-bottom: 16px">${requestScope.error}</h5>
                    <input type="submit" value="Login">
                </form>
            </div>

            <div class="right register">
                <div class="text-content">
                    <h3 class="text-heading">NEW CUSTOMERS</h3>
                    <div class="text-discription">By creating an account with our store, you will be able to move
                        through the checkout process faster, store multiple shipping addresses, view and track your
                        orders in your account and more.</div>
                </div>
                <div class="linkRegister">
                    <a href="./register" style="color: #fff;">CREAT AN ACCOUNT</a>
                </div>
            </div>
        </div>
        <!-- footer -->
        <div id="footer" style="background-color: #ECECEC">
            <div class="socials-list">
                <a href=""><i class="ti-facebook"></i></a>
                <a href=""><i class="ti-instagram"></i></a>
                <a href=""><i class="ti-youtube"></i></a>
                <a href=""><i class="ti-pinterest"></i></a>
                <a href=""><i class="ti-twitter"></i></a>
                <a href=""><i class="ti-linkedin "></i></a>
            </div>
            <p class="copyright">Powered by <a href="http://bit.do/cuongtranfb">Cuong Tran</a></p>
        </div>
    </div>
    </div>
</body>

</html>