<%-- 
    Document   : Header
    Created on : Jun 30, 2022, 2:32:37 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="./css/styleHome.css" rel='stylesheet' type='text/css' />
        <meta name="viewport" content="width=device-width, initial-scale=1">
<!--        <script
        type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    </script>-->
    <!----webfonts---->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!----//webfonts---->
    <!----start-alert-scroller---->
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easy-ticker.js"></script>
<!--    <script type="text/javascript">
        $(document).ready(function () {
            $('#demo').hide();
            $('.vticker').easyTicker();
        });
    </script>-->
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
        <!--<script src="js/jquery-ui.js" type="text/javascript"></script>-->
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
    <!--<script type="text/javascript" src="js/jquery-ui.min.js"></script>-->
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
<!--    --//End-pricerage-seletion--
    -move-top-top--
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
            });
        });
    </script>-->
</head>
<body>
    <div class="top-header">
        <div class="wrap">
            <div class="top-header-left">
                <ul>
                    <!---cart-tonggle-script---->
                    
                    <!---//cart-tonggle-script---->
                    <li><a class="cart" href="./showCart"><span> </span></a></li>
                    <!---start-cart-bag---->
                    
                </ul>
            </div>
            <div class="top-header-center">
                <div class="top-header-center-alert-left">
                    <h3>FREE DELIVERY</h3>
                </div>
                <div class="top-header-center-alert-right">
                    <div class="vticker">
                        <ul>
                            <li>Applies to orders of $50 or more. <label>Returns are always free.</label></li>
                        </ul>
                    </div>
                </div>
                <div class="clear"> </div>
            </div>
            <div class="top-header-right">
                <ul>
                    <c:if test="${sessionScope.user!=null}">
                        <li><a href="./editAccount">${user.name}</a><span> </span></li>
                        <c:if test="${sessionScope.user.getRoleId()==0}">
                            <li><a href="./editProduct">Edit Product | </a><span> </span></li>
                            <li><a href="./editUser">Edit User | </a></li>
                            <li><a href="./report">Financial Statement | </a></li>
                        </c:if>
                        <li><a href="./logout">Logout</a><span> </span></li>
                    </c:if>
                    <c:if test="${sessionScope.user==null}">
                        <li><a href="./login">Login</a><span> </span></li>
                        <li><a href="./register">Join</a></li>  
                    </c:if>
                </ul>
            </div>
            <div class="clear"> </div>
        </div>
    </div>
    <!----start-mid-head---->
    <div class="mid-header">
        <div class="wrap">
            <div class="mid-grid-left">
                <form action="home">
                    <input type="text" placeholder="What Are You Looking for?" name="search"/>
                </form>
            </div>
            <div class="mid-grid-right">
                <div class="logo">
                    <a href="./home" style="color:white ;">CNG</a>
                </div>
            </div>
            <div class="clear"> </div>
        </div>
    </div>
    <!----//End-mid-head---->
    <!----start-bottom-header---->
    <div class="header-bottom">
        <div class="wrap">
            <!-- start header menu -->
            <ul class="megamenu skyblue">
                <li class="grid"><a class="color2" href="./home?search=nike">NIKE</a>
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>popular</h4>
                                    <ul>
                                        <li><a href="./home?search=nike mercurial">Nike Mercurial</a></li>
                                        <li><a href="./home?search=nike tiempo">Nike Tiempo</a></li>
                                        <li><a href="./home?search=nike phantom">Nike Phantom</a></li>
                                    </ul>
                                </div>


                            </div>
                        </div>
                </li>
                <li class="active grid"><a class="color4" href="./home?search=adidas">ADIDAS</a>
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>popular</h4>
                                    <ul>
                                        <li><a href="./home?search=adidas predator">Adidas Predator</a></li>
                                        <li><a href="./home?search=adidas x">Adidas X</a></li>
                                        <li><a href="./home?search=adidas copa">Adidas Copa</a></li>

                                    </ul>
                                </div>

                            </div>

                        </div>
                </li>
                <li><a class="color5" href="./home?search=mizuno">MIZUNO</a>
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>popular</h4>
                                    <ul>
                                        <li><a href="./home?search=mizuno morelia">Mizuno Morelia</a></li>
                                        <li><a href="./home?search=mizuno monarcida">Mizuno Monarcida</a></li>
                                        <li><a href="./home?search=mizuno rebula">Mizuno Rebula</a></li>
                                    </ul>
                                </div>

                                <li><a class="color7" href="./home?search=puma">PUMA</a>
                                    <div class="megapanel">
                                        <div class="row">
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>popular</h4>
                                                    <ul>
                                                        <li><a href="./home?search=puma future">Puma Future</a></li>
                                                        <li><a href="./home?search=puma one">Puma One</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li><a class="color7" href="./home?search=">Shoes</a>
                                    <div class="megapanel">
                                        <div class="row">
                                            <div class="col1">
                                                <div class="h_nav">
                                                    <h4>popular</h4>
                                                    <ul>
                                                        <li><a  href="./home?type=tf">Artificial turf shoes</a>
                                                        <li><a  href="./home?type=ic">Futsal shoes</a>
                                                        <li><a  href="./home?type=fg">natural turf shoes</a>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>


                                
                                </ul>

                            </div>
                        </div>

                        </body>
                        </html>
