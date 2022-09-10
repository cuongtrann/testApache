<%-- 
    Document   : EditAccount
    Created on : Jul 5, 2022, 8:25:14 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="./css/styleHome.css" rel='stylesheet' type='text/css' />
        <link href="./css/styleLogin.css" rel='stylesheet' type='text/css' />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script
        type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    </script>
    <!----webfonts---->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!----//webfonts---->
    <!----start-alert-scroller---->
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easy-ticker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#demo').hide();
            $('.vticker').easyTicker();
        });
    </script>
    <!----start-alert-scroller---->
    <!-- start menu -->
    <link href="./css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="js/megamenu.js"></script>
    <script>$(document).ready(function () {
            $(".megamenu").megamenu();
        });</script>
    <script src="js/menu_jquery.js"></script>
    <!-- //End menu -->
    <!---slider---->
    <link rel="stylesheet" href="css/slippry.css">
    <script src="js/jquery-ui.js" type="text/javascript"></script>
    <script src="js/scripts-f0e4e0c2.js" type="text/javascript"></script>
    <script>
        jQuery('#jquery-demo').slippry({
            // general elements & wrapper
            slippryWrapper: '<div class="sy-box jquery-demo" />', // wrapper to wrap everything, including pager
            // options
            adaptiveHeight: false, // height of the sliders adapts to current slide
            useCSS: false, // true, false -> fallback to js if no browser support
            autoHover: false,
            transition: 'fade'
        });
    </script>
    <!----start-pricerage-seletion---->
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
    <script type='text/javascript'>//<![CDATA[ 
        $(window).load(function () {
            $("#slider-range").slider({
                range: true,
                min: 0,
                max: 500,
                values: [100, 400],
                slide: function (event, ui) {
                    $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
                }
            });
            $("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));

        });//]]>  
    </script>
    <!----//End-pricerage-seletion---->
    <!---move-top-top---->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
            });
        });
    </script>
    <style>
        tr,td,th{
            border: #fff !important;
            padding-right: 200px !important;
        }
        .option{
            color: blue;
        }
    </style>
</head>
<body>
    <header>
        <%@include file="Header.jsp"%>
    </header>
    <div class="wrap">
        <br>
        <h1>ACCOUNT SETTING</h1><br>
        <div>
            <table>
                <tr>
                    <th>Name:</th> 
                    <td>${sessionScope.user.getName()}</td>
                </tr>
                <tr>
                    <th>Email:</th> 
                    <td>${sessionScope.user.getEmail()}</td>
                </tr>
                
                <tr>
                    <th>Phone:</th> 
                    <td>${sessionScope.user.getPhone()}</td>
                </tr>
                <tr>
                    <th>Address:</th> 
                    <td>${sessionScope.user.getAddress()}</td>
                </tr>
                <tr>
                    <th>Password</th> 
                    <td><a href="editAccount?view=changePass" class="option">Change Password</a></td>
                </tr>
                <tr>
                    <td><a href="editAccount?view=edit" class="option">Edit Information</a></td>
                </tr>
            </table><br>
                    <c:if test="${requestScope.view.equals('edit')}">
                        <form action="editAccount" method="post">
                            Name: <input type="text" name="name" value="${sessionScope.user.getName()}" required><br>
                            Email: <input type="text" name="email" value="${sessionScope.user.getEmail()}" required><br>
                            Phone: <input type="text" name="phone" value="${sessionScope.user.getPhone()}" required><br>
                            Address: <input type="text" name="address" value="${sessionScope.user.getAddress()}" required><br>
                            <br><input type="submit" value="SAVE">
                        </form>
                    </c:if> 
                    
                    <c:if test="${requestScope.view.equals('changePass')}">
                        <form action="editAccount" method="post">
                            Current Password: <input type="password" name="crPass" required><br>
                            New Password: <input type="password" name="newPass" required><br>
                            Confirm Password: <input type="password" name="cfPass" required><br> 
                            <br><input type="submit" value="Confirm">
                            <a style="margin-left: 24px" class="linkCancel" href="./editAccount">Cancel</a>
                        </form>
                    </c:if> 
                    <c:if test="${requestScope.status!=null && (requestScope.status.equals('Change password success') || requestScope.status.equals('Edit information success'))}">
                        <h2 style="color: green">${requestScope.status}</h2>
                    </c:if>
                    <c:if test="${requestScope.status!=null && requestScope.status.equals('Change password failed')}">
                        <h2 style="color: red">${requestScope.status}</h2>
                    </c:if>
        </div>
</body>
</html>
