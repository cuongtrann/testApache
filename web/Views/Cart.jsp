<%-- 
    Document   : Cart
    Created on : Jul 7, 2022, 10:14:43 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>Home</title>
<link href="./css/styleHome.css" rel='stylesheet' type='text/css' />
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
    .linkHome{
        background: #E45D5D;
        color: #FFF;
        font-size: 0.8em;
        padding: 0.7em 1.2em;
        border-radius: 5px;
        border-bottom: 4px solid #B93838;
        transition: 0.5s all;
        /*display: inline-block;*/
        cursor: pointer;
        outline: none;
        width: fit-content;
        float: right;
    }
    .linkHome:hover {
        background: #1C1C20;
        border-bottom: 4px solid #333;
    }
</style> 
<!---//move-top-top---->
</head>
<body>
    <!---start-wrap---->
    <!---start-header---->
    <div class="header">
        <%@include file="Header.jsp" %>
    </div>
    <div class="wrap">

        <jsp:useBean id="dao" class="DAL.DAO"></jsp:useBean>
        <table style="width: 100%;">
                <th>No</th>
                <th>Name</th>
                <th>Size</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total Money</th>
                <th>Action</th>
                <c:set var="tt" value="0"></c:set>
                <c:set var="o" value="${requestScope.cart}"></c:set>
                <c:forEach items="${o.getItems()}" var="x">
                    <c:set var="tt" value="${tt+1}"></c:set>    
                    <tr>
                        <td>${tt}</td>
                    <td>${dao.searchProductById(x.getProductDt().getProductId()).getName()}</td>
                    <td>${x.getProductDt().getSize()}</td>
                    <td style="padding-left:0;padding-right: 0; text-align: center;">
                        <button><a href="process?num=-1&id=${x.getProductDt().getId()}">-</a></button>
                        ${x.getQuantity()}
                        <button><a href="process?num=1&id=${x.getProductDt().getId()}">+</a></button>
                    </td>
                    <td>
                        <fm:formatNumber pattern="#,###,###,### VND" value="${x.getPrice()}"></fm:formatNumber> 
                        </td>
                        <td><fm:formatNumber pattern="#,###,###,### VND" value="${x.getPrice()*x.getQuantity()}"></fm:formatNumber> </td>
                    <td style="text-align: center;">
                            <form action="process" method="post">
                                <input type="hidden" name="id" value="${x.getProductDt().getId()}"> 
                            <input type="submit" value="Return Item">
                        </form>
                    </td>
                    </tr>
                    
            </c:forEach>   

        </table>   
                        <br><h3 style="color: red; font-size: x-large; float: right;">Total Money: <fm:formatNumber pattern="#,###,###,### VND" value="${o.getTotalMoney()}"></fm:formatNumber></h3>
                <br><br><br><form style="float: right;" action="checkout" method="post">
            <input type="submit" value="Buy Now">
        </form>
              <br><br><br><a class="linkHome" href="./home">Continue Shopping</a>
    </div>
</body>