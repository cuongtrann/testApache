<%-- 
    Document   : EditUser
    Created on : Jun 28, 2022, 2:22:47 PM
    Author     : ASUS
--%>
<%@page import="Models.*" %>
<%@page import="DAL.*" %>
<%@page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            .update,.delete{
                color: blue;
            }

            .pagination a{
                border: #000 solid 1px;
                padding: 10px;
                border-radius: 5px;
            }
            .pagination a:hover, .pagination a.active{
                background-color: #000;
                color: #fff;
            }
            .pagination{
                margin: 30px 0;
                margin-left: 800px;
            }

        </style>
</head>
<body>
    <header>
        <%@include file="../Header.jsp" %>
    </header>
    <div class="wrap">
        <h1></h1>
        <h4>Edit Users</h4>
        <table >
            <tr>
                <th><p>Id</p></th>
                <th><p>Name</p></th>
                <th><p>Login name</p></th>
                <th><p>Pass</p></th>
                <th><p>Role</p></th>
                <th><p>Address</p></th>
                <th><p>Phone</p></th>
                <th><p>Email</p></th>
                <th><p>Active</p></th>
                <th colspan="2">Options</th>
            </tr>
            <c:set var="page" value="${requestScope.page}"></c:set>
            <c:forEach items="${requestScope.data}" var="x">
                <tr>
                    <td>${x.getId()}</td>
                    <td>${x.getName()} </td>
                    <td>${x.getLoginName()} </td>
                    <td>${x.getPassword()} </td>
                    <td>${x.getRoleId()==0?"admin":"customer"} </td>
                    <td>${x.getAddress()} </td>
                    <td>${x.getPhone()} </td>
                    <td>${x.getEmail()} </td>
                    <td>${x.isActive()?"yes":"no"}</td>
                    <td><a><a class="update" href="updateDelete?type=3&id=${x.getId()}&page=${page}">update</a></td>
                    <td><a><a class="delete" href="updateDelete?type=2&id=${x.getId()}&page=${page}">delete</a></td>
                </tr>
            </c:forEach>
                </table>
        <div class="pagination">
                <c:if test="${page!=1}">
                    <a href="editUser?page=1"><<</a>  
                </c:if>      
                <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                    <a class="${i==page?"active":""}" href="editUser?page=${i}">${i}</a>
                </c:forEach>
                <c:if test="${page!=requestScope.num}">
                    <a href="editUser?page=${requestScope.num}">>></a>  
                </c:if>  
            </div>
            <%
        DAO dao = (DAO)request.getAttribute("dao");
        Object obj = request.getAttribute("usUpdateId");
         String id = "";
         String name = "";
        String loginName = "";
        String password = "";
        String roleId = "";
        String address = "";
        String phone = "";
        String email = "";
        String active = "";            
        if(obj != null)
    {            
            id = (obj+"").trim();
            for(Users us:dao.getUsers())
            {
                if(id.equalsIgnoreCase((us.getId()+"").trim())){
                    name = us.getName();
                    loginName = us.getLoginName();
                    password = us.getPassword();
                    roleId = (us.getRoleId()+"").trim();
                    address = us.getAddress();
                    phone = us.getPhone();
                    email = us.getEmail();
                    active = (us.isActive()+"").trim();
                    break;
                }
            }
            
    }
            %>
        

        <form action="editUser" method="post">
            Id: <br><input type="text" name="id" required value="<%=id%>" readonly><br>
            Name: <input type="text" name="usName" required value="<%=name%>"><br>
            Login Name: <input type="text" name="loginName" required value="<%=loginName%>"><br>
            Password <input type="text" name="pass" required value="<%=password%>"><br>
            Role:
            <select name="role">
                <option value="0" <%=roleId.equals("0")?"selected":""%>>Admin</option>
                <option value="1" <%=roleId.equals("1")?"selected":""%>>Customer</option>                
            </select>
            <br>
            Address: <input type="text" name="add" required value="<%=address%>"><br>
            Phone: <input type="text" name="phone" required value="<%=phone%>" ><br>
            Email: <input type="email" name="mail" required="" value="<%=email%>"><br>
            Active: 
            <select name="active">
                <option value="true" <%=active.equals("true")?"selected":""%>>Activated</option>
                <option value="false" <%=active.equals("true")?"":"selected"%>>Not Activated</option>                
            </select><br>
            <input type="submit" value=<%=obj!=null?"UPDATE":"INSERT"%>>
        </form>
    </div> 

</body>
</html>
