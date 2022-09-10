<%-- 
    Document   : ProductDetail
    Created on : Jun 30, 2022, 1:57:47 PM
    Author     : ASUS
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
    <head>
        <title>Home</title>
        <link href="./css/styleHome.css" rel='stylesheet' type='text/css' />
        <meta name="viewport" content="width=device-width, initial-scale=1">

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
        <!--    <script type="text/javascript">
                jQuery(document).ready(function ($) {
                    $(".scroll").click(function (event) {
                        event.preventDefault();
                        $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
                    });
                });
            </script>-->
        <style>
            input:checked + label{
                background-color: #E45D5D;
                color: #FFF;
            }
            .size{
                padding: 5px;
                margin: 2px;
                border: 1px solid black;
                border-radius: 10%;
            }
        </style> 
        <script>
            var product = value;
        </script>
        <!---//move-top-top---->
    </head>
    <body>
        <!---start-wrap---->
        <!---start-header---->
        <div class="header">
            <%@include file="Header.jsp" %>
        </div>
        <!----//End-bottom-header---->
        <!---//End-header---->
        <!--- start-content---->
        <div class="content details-page">
            <!---start-product-details--->
            <div class="product-details">
                <div class="wrap">
                    <ul class="product-head">
                        <li><a href="#">Home</a> <span>::</span></li>
                        <li class="active-page"><a href="#">Product Page</a></li>
                        <div class="clear"> </div>
                    </ul>
                    <!----details-product-slider--->
                    <!-- Include the Etalage files -->
                    <link rel="stylesheet" href="css/etalage.css">
                    <script src="js/jquery.etalage.min.js"></script>
                    <!-- Include the Etalage files -->
                    <script>
            jQuery(document).ready(function ($) {

                $('#etalage').etalage({
                    thumb_image_width: 300,
                    thumb_image_height: 400,
                    source_image_width: 900,
                    source_image_height: 1000,
                    show_hint: true,
                    click_callback: function (image_anchor, instance_id) {
                        alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                    }
                });
                // This is for the dropdown list example:
                $('.dropdownlist').change(function () {
                    etalage_show($(this).find('option:selected').attr('class'));
                });

            });
                    </script>
                    <!----//details-product-slider--->
                    <div class="details-left">
                        <div class="details-left-slider">
                            <ul id="etalage">
                                <li>
                                    <a href="optionallink.html">
                                        <img class="etalage_thumb_image" src="proImages/${requestScope.dao.searchProductById(requestScope.id).getImage()}" />
                                        <img class="etalage_source_image" src="proImages/${requestScope.dao.searchProductById(requestScope.id).getImage()}" />
                                    </a>
                                </li>

                            </ul>
                        </div>
                        <div class="details-left-info">
                            <div class="details-right-head">
                                <h1>${requestScope.dao.searchProductById(requestScope.id).getName()}</h1>
                                <c:set value="0" var="count"></c:set>
                                <c:forEach items="${requestScope.detail}" var="x">
                                    <c:set value="${x.getDescription()}" var="descrition"></c:set>
                                    <c:if test="${x.getQuantity()>0}"><c:set value="${count+1}" var="count"></c:set></c:if>
                                </c:forEach>
                                <c:if test="${count>0}">
                                    <c:set value="In stock" var="status"></c:set>

                                </c:if> 
                                <c:if test="${count==0}"><c:set value="Out stock" var="status"></c:set></c:if>
                                <p class="product-detail-info">${descrition}</p>
                                <div class="product-more-details">
                                    <ul class="price-avl">
                                        <li class="price"><label><fm:formatNumber pattern="#,###,###,### VND" value="${requestScope.dao.searchProductById(requestScope.id).getPrice()}"></fm:formatNumber> </label></li>
                                            <c:if test="${count==0}">
                                            <li class="stock"><i style="color: red">${status}</i></li>
                                            </c:if>
                                            <c:if test="${count>0}">
                                            <li class="stock"><i>${status}</i></li>
                                                </c:if>
                                        <div class="clear"> </div>
                                    </ul>

                                    <!-- để chọn thông tin mua hàng -->           
                                    <form action="cart">

                                        <c:if test="${count>0}">
                                            <ul class="product-colors">
                                                <h3>Available size :</h3><br>
                                                <c:forEach items="${requestScope.detail}" var="x">
                                                    <c:if test="${x.getQuantity()>0}">
                                                        <li>
                                                            <input type="hidden" value="${requestScope.id}" name="id">
                                                            <input style="display: none" type="radio" id="${x.getSize()}" value="${x.getId()}" name="productId">                        
                                                            <label class="size" for="${x.getSize()}">${x.getSize()}</label>
                                                        </li>

                                                    </c:if>

                                                </c:forEach>
                                                <br><br>Quantity: <input style="width: 30px" type="text" name="quantity" required>
                                                <div class="clear"> </div>
                                            </ul><br>
                                            <input style="padding: 16px 100px" type="submit" value="ADD TO CART" />
                                        </form>

                                    </c:if> 


                                </div>
                            </div>
                        </div>
                        <div class="clear"> </div>
                    </div>

                    <div class="clear"> </div>
                </div>
                <!----product-rewies---->
                <div class="product-reviwes">
                    <div class="wrap">
                        <!--vertical Tabs-script-->
                        <!---responsive-tabs---->
                        <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
                        <script type="text/javascript">
            $(document).ready(function () {
                $('#horizontalTab').easyResponsiveTabs({
                    type: 'default', //Types: default, vertical, accordion           
                    width: 'auto', //auto or any width like 600px
                    fit: true, // 100% fit in a container
                    closed: 'accordion', // Start closed if in accordion view
                    activate: function (event) { // Callback function if tab is switched
                        var $tab = $(this);
                        var $info = $('#tabInfo');
                        var $name = $('span', $info);
                        $name.text($tab.text());
                        $info.show();
                    }
                });

                $('#verticalTab').easyResponsiveTabs({
                    type: 'vertical',
                    width: 'auto',
                    fit: true
                });
            });
                        </script>
                        <!---//responsive-tabs---->
                        <!--//vertical Tabs-script-->
                        <!--vertical Tabs-->
                        <div id="verticalTab">
                            <ul class="resp-tabs-list">
                                <li>Description</li>
                                <li>Product tags</li>
                                <li>Product reviews</li>
                            </ul>
                            <div class="resp-tabs-container vertical-tabs">
                                <div>
                                    <h3> Details</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nibh urna, euismod ut ornare non, volutpat vel tortor. Integer laoreet placerat suscipit. Sed sodales scelerisque commodo. Nam porta cursus lectus. Proin nunc erat, gravida a facilisis quis, ornare id lectus. Proin consectetur nibh quis urna gravida mollis.</p>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nibh urna, euismod ut ornare non, volutpat vel tortor</p>
                                </div>
                                <div>
                                    <h3>Product Tags</h3>
                                    <h4>Add Your Tags:</h4>
                                    <form>
                                        <input type="text"> <input type="submit" value="ADD TAGS"/>
                                        <span>Use spaces to separate tags. Use single quotes (') for phrases.</span>
                                    </form>
                                </div>
                                <div>
                                    <h3>Customer Reviews</h3>
                                    <p>There are no customer reviews yet.</p>
                                </div>
                            </div>
                        </div>
                        <div class="clear"> </div>
                        <!--- start-similar-products--->

                        <!--- //End-similar-products--->

                    </div>
                    <div class="clear"> </div>
                    <!--//vertical Tabs-->
                    <!----//product-rewies---->
                    <!---//End-product-details--->
                </div>
            </div>
            <!---- start-bottom-grids---->
            <div class="bottom-grids">
                <div class="bottom-top-grids">
                    <div class="wrap">
                        <div class="bottom-top-grid">
                            <h4>GET HELP</h4>
                            <ul>
                                <li><a href="contact.html">Contact us</a></li>
                                <li><a href="#">Shopping</a></li>
                                <li><a href="#">NIKEiD</a></li>
                                <li><a href="#">Nike+</a></li>
                            </ul>
                        </div>
                        <div class="bottom-top-grid">
                            <h4>ORDERS</h4>
                            <ul>
                                <li><a href="#">Payment options</a></li>
                                <li><a href="#">Shipping and delivery</a></li>
                                <li><a href="#">Returns</a></li>
                            </ul>
                        </div>
                        <div class="bottom-top-grid last-bottom-top-grid">
                            <h4>REGISTER</h4>
                            <p>Create one account to manage everything you do with Nike, from your shopping preferences to your Nike+ activity.</p>
                            <a class="learn-more" href="#">Learn more</a>
                        </div>
                        <div class="clear"> </div>
                    </div>
                </div>
                <div class="bottom-bottom-grids">
                    <div class="wrap">
                        <div class="bottom-bottom-grid">
                            <h6>EMAIL SIGN UP</h6>
                            <p>Be the first to know about new products and special offers.</p>
                            <a class="learn-more" href="#">Sign up now</a>
                        </div>
                        <div class="bottom-bottom-grid">
                            <h6>GIFT CARDS</h6>
                            <p>Give the gift that always fits.</p>
                            <a class="learn-more" href="#">View cards</a>
                        </div>
                        <div class="bottom-bottom-grid last-bottom-bottom-grid">
                            <h6>STORES NEAR YOU</h6>
                            <p>Locate a Nike retail store or authorized retailer.</p>
                            <a class="learn-more" href="#">Search</a>
                        </div>
                        <div class="clear"> </div>
                    </div>
                </div>
            </div>
            <!---- //End-bottom-grids---->
            <!--- //End-content---->
            <!---start-footer---->
            <div class="footer">
                <div class="wrap">
                    <div class="footer-left">
                        <ul>
                            <li><a href="#">United Kingdom</a> <span> </span></li>
                            <li><a href="#">Terms of Use</a> <span> </span></li>
                            <li><a href="#">Nike Inc.</a> <span> </span></li>
                            <li><a href="#">Launch Calendar</a> <span> </span></li>
                            <li><a href="#">Privacy & Cookie Policy</a> <span> </span></li>
                            <li><a href="#">Cookie Settings</a></li>
                            <div class="clear"> </div>
                        </ul>
                    </div>
                    <div class="footer-right">
                        <p>Template by <a href="http://w3layouts.com/">W3layouts</a></p>
                        <script type="text/javascript">
                            $(document).ready(function () {
                                /*
                                 var defaults = {
                                 containerID: 'toTop', // fading element id
                                 containerHoverID: 'toTopHover', // fading element hover id
                                 scrollSpeed: 1200,
                                 easingType: 'linear' 
                                 };
                                 */

                                $().UItoTop({easingType: 'easeOutQuart'});

                            });
                        </script>
                        <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"> </span></a>
                    </div>
                    <div class="clear"> </div>  
                </div>
            </div>
            <!---//End-footer---->
            <!---//End-wrap---->
    </body>
</html>


