<%-- 
    Document   : editProductDetail
    Created on : Jul 4, 2022, 8:01:09 PM
    Author     : ASUS
--%>
<%@page import="Models.*" %>
<%@page import="DAL.*" %>
<%@page import="java.util.*" %>
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
</head>
</head>
<body>
    <header>
        <%@include file="../Header.jsp"%>
    </header>
    <div class="wrap">
        <h4>Edit Product Detail</h4><br>
        <h4>${dao.searchProductById(requestScope.proDtId).getName()}</h4>
        <div style="float: left; width: 50%">
             <table>
            <tr>
                <th>Id</th>
                <th>Size</th>
                <th>Quantity</th>
                <th>Options</th>
            </tr>
            <c:forEach items="${requestScope.dao.searchProductDetails(requestScope.proDtId)}" var="x">
                <tr>
                    <td>${x.getId()}</td>
                    <td>${x.getSize()}</td>
                    <td>${x.getQuantity()}</td>
                    <td><a href="updateDelete?type=4&id=${x.getId()}&proDtId=${requestScope.proDtId}">update</a></td>
                    <c:set value="${x.getDescription()}" var="descrition"></c:set>
                </tr>
            </c:forEach>
                <th>Description</th>
                <td colspan="3">${descrition}</td>
        </table>
        </div>
        <%
            DAO dao = (DAO)request.getAttribute("dao");
            Object obj = request.getAttribute("proDtUpdateId");
            String size = "";
            String quantity = "";
            String id = "";
            String description = "";
            if(obj != null)
            {            
                    id = (obj +"").trim();
                    for (ProductDetails productDetail : dao.getProductDetails())
                    {
                        if(id.equalsIgnoreCase((productDetail.getId()+"").trim())){
                            quantity = (productDetail.getQuantity()+"");
                            size = (productDetail.getSize()+"");
                            description = productDetail.getDescription();
                            break;
                        }
                    }
            
            }
        %>
        <div style="float: right; width: 40%">
            <form action="editProductDetail" method="post">
                <br>Id<br><input type="text" value="<%=id%>" readonly required>
                <br>Size <input type="text" name="size" value="<%=size%>" readonly required>
                <br>Quantity <input type="text" name="quantity" value="<%=quantity%>" required>
                Description <input type="text" name="description" value="<%=description%>" required>
                <input type="submit" value="UPDATE">
            </form>
        </div>
        
        <div class="clear"></div>
    </div>
</body>
</html>
