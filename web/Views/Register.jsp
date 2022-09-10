<%-- 
    Document   : Register
    Created on : Jun 22, 2022, 8:36:28 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Page Title</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='css/styleRegister.css'>

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
            <h1 class="row">CREATE AN ACCOUNT</h1>
            <div id="content" class="row">
                <div class="register">
                    <form action="register" method="post">
                        <h4 class="text-heading">PERSONAL INFORMATION</h4>
                        <div class="row100">
                            <div class="col50"><h4>FIRST NAME <label>*</label></h4><input type="text" name="firstName" required></div>
                            <div class="col50"><h4>LAST NAME <label>*</label></h4><input type="text" name="lastName" required></div>                         
                        </div>

                        <div class="row100">
                            <div class="col50"><h4>PHONE <label>*</label></h4><input type="text" name="phone" required></div>
                            <div class="col50"><h4>ADDRESS <label>*</label></h4><input type="text" name="address" required></div>                         
                        </div>
                        <div class="row100">
                            <div class="col50">
                                <h4>EMAIL <label>*</label></h4> <input type="email" name="email" required>
                            </div>
                        </div>
                        <h4 class="text-heading">LOGIN INFORMATION</h4>
                        <div class="row100">
                            <div class="col50">
                                <h4>USER NAME <label>*</label></h4> <input type="text" name="loginName" required>
                            </div>
                        </div>
                        <div class="row100">
                            <div class="col50"><h4>PASSWORD  <label>*</label></h4><input type="password" name="pass" required></div>
                            <div class="col50"><h4>COMFIRM PASSWORD <label>*</label></h4><input type="password" name="cfpass" required></div>                         
                        </div>
                        <c:if test="${requestScope.status!=null}">
                            <h4 style="color: red">${requestScope.status}</h4>
                        </c:if>
                        <input type="submit" value="REGISTER">
                    </form>
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
