<%-- 
    Document   : Home
    Created on : Jun 20, 2022, 7:21:45 PM
    Author     : ASUS
--%>
<%@page import="Models.*" %>
<%@page import="DAL.*" %>
<%@page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

    <head>
        <title>Home</title>
        <link href="./css/styleHome.css" rel='stylesheet' type='text/css' />
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>

        <link href="./css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <style>
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
                margin-left: 400px;
            }
            .title{
                font-weight: 500;
                font-size: 30px;
                display: flex;
                justify-content: flex-start;
            }

            input[type="radio"]{
                            /*display: none;*/
            }

            .inline-flex{
                display: inline-flex;
            }
            .fakebox:hover,input:checked+label{
                background: #E45D5D;
                color: #FFF;
                font-size: 0.8em;
                padding: 0.7em 1.2em;
                border-radius: 5px;
                /*border-bottom: 4px solid #B93838;*/
                transition: 0.5s all;
                display: inline-block;
                cursor: pointer;
                outline: none;
                width: fit-content;
            }
            h4{
                font-size: 500px;
            }
        </style>
    </head>

    <body>
        <!---start-wrap---->
        <!---start-header---->
        <div class="header">
            <%@include file="Header.jsp"%>
        </div>

        <!----//End-bottom-header---->
        <!---//End-header---->
        <!----start-image-slider---->
        <div class="img-slider">
            <div class="wrap">
                <ul id="jquery-demo">
                    <li>
                        <a href="#slide1">
                            <img src="images/slide-1.jpg" alt="" />
                        </a>
                        <div class="slider-detils">
                            <h3>MENS FOOT BALL <label>BOOTS</label></h3>
                            <span>Stay true to your team all day, every day, game day.</span>
                            <a class="slide-btn" href="details.html"> Shop Now</a>
                        </div>
                    </li>
                    <li>
                        <a href="#slide2">
                            <img src="images/slide-4.jpg" alt="" />
                        </a>
                        <div class="slider-detils">
                            <h3>MENS FOOT BALL <label>BOOTS</label></h3>
                            <span>Stay true to your team all day, every day, game day.</span>
                            <a class="slide-btn" href="details.html"> Shop Now</a>
                        </div>
                    </li>
                    <li>
                        <a href="#slide3">
                            <img src="images/slide-1.jpg" alt="" />
                        </a>
                        <div class="slider-detils">
                            <h3>MENS FOOT BALL <label>BOOTS</label></h3>
                            <span>Stay true to your team all day, every day, game day.</span>
                            <a class="slide-btn" href="details.html"> Shop Now</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="clear"> </div>
        <!----//End-image-slider---->
        <!----start-price-rage--->
        <div class="wrap">
            <div class="title" >
                <c:if test="${requestScope.search!=null}">
                    <h3>${requestScope.search.toUpperCase()}</h3>
                </c:if>
                <c:if test="${requestScope.search==null||requestScope.search==''}">
                    <h3>ALL PRODUCT</h3> 
                </c:if>
            </div>
        </div>
    </div>
    <!----//End-price-rage--->
    <!--- start-content---->
    <div class="content">
        <div class="wrap">
            <div class="content-left" style="width: 20%">
                <div class="content-left-top-grid">
                    <div class="">

                        <div class="">
                            <h4 class="title">Brand</h4><br>
                            <form action="home">
                                <div class="inline-flex"><input ${requestScope.search.equals('')?'checked':''} id="allBrand" type="radio" name="search" value="" onclick="this.form.submit()" ><label class="fakebox" for="allBrand">All</label></div>
                                <br><div class="inline-flex"><input ${requestScope.search.equals('nike')?'checked':''} id="nike" type="radio" name="search" value="nike" onclick="this.form.submit()" ><label class="fakebox" for="nike">Nike</label></div>                     
                                <br><div class="inline-flex"><input ${requestScope.search.equals('adidas')?'checked':''} id="adidas" type="radio" name="search" value="adidas" onclick="this.form.submit()"><label class="fakebox" for="adidas">Adidas</label></div>
                                <br><div class="inline-flex"><input id="mizuno" ${requestScope.search.equals('mizuno')?'checked':''} type="radio" name="search" value="mizuno" onclick="this.form.submit()"><label class="fakebox" for="mizuno">Mizuno</label></div>
                                <br><div class="inline-flex"><input id="puma" ${requestScope.search.equals('puma')?'checked':''} type="radio" name="search" value="puma" onclick="this.form.submit()"><label class="fakebox" for="puma">Puma</label></div>
                                <br><br><h4 class="title">Color</h4>
                                <br><div class="inline-flex"><input ${requestScope.color.equals('')?'checked':''} id="allColor" type="radio" name="color" value="" onclick="this.form.submit()" ><label class="fakebox" for="allColor">All</label></div>
                                <br><div class="inline-flex"><input ${requestScope.color.equals('black')?'checked':''} id="black" type="radio" name="color" value="black" onclick="this.form.submit()" ><label class="fakebox" style="background-color: black;width: 30px;" for="black"></label></div>
                                <br><div class="inline-flex"><input ${requestScope.color.equals('blue')?'checked':''} id="blue" type="radio" name="color" value="blue" onclick="this.form.submit()" ><label class="fakebox" style="background-color: blue;width: 30px;" for="blue"></label></div>
                                <br><div class="inline-flex"><input ${requestScope.color.equals('white')?'checked':''} id="white" type="radio" name="color" value="white" onclick="this.form.submit()" > <label class="fakebox" style="background-color: white;width: 30px;" for="white"></label></div>
                                <br><div class="inline-flex"><input ${requestScope.color.equals('yellow')?'checked':''} id="yellow" type="radio" name="color" value="yellow" onclick="this.form.submit()" > <label class="fakebox" style="background-color: yellow;width: 30px;" for="yellow"></label></div>
                                <br><br><h4 class="title">Price</h4>
                                <div class="inline-flex"><input ${requestScope.price.equals('')||requestScope.price==null?'checked':''}  id="allPrice" type="radio" name="price" value="" onclick="this.form.submit()" ><label class="fakebox" for="allPrice">All</label></div>
                                <br><div class="inline-flex"><input ${requestScope.price.equals('0-1000000')?'checked':''} id="0-1000000" type="radio" name="price" value="0-1000000" onclick="this.form.submit()" ><label class="fakebox" for="0-1000000">0~1.000.000</label></div>                     
                                <br><div class="inline-flex"><input ${requestScope.price.equals('1000000-2000000')?'checked':''} id="1000000-2000000" type="radio" name="price" value="1000000-2000000" onclick="this.form.submit()"><label class="fakebox" for="1000000-2000000">1.000.000~2.000.000</label></div>
                                <br><div class="inline-flex"><input ${requestScope.price.equals('2000000-3000000')?'checked':''} id="2000000-3000000" type="radio" name="price" value="2000000-3000000" onclick="this.form.submit()"><label class="fakebox" for="2000000-3000000">2.000.000~3.000.000</label></div>
                                <br><div class="inline-flex"><input ${requestScope.price.equals('3000000-4000000')?'checked':''} id="3000000-4000000" type="radio" name="price" value="3000000-4000000" onclick="this.form.submit()"><label class="fakebox" for="3000000-4000000">3.000.000~4.000.000</label></div>
                                <br><br><h4 class="title">Type</h4>
                                <div class="inline-flex"><input ${requestScope.type.equals('')?'checked':''}  id="allType" type="radio" name="type" value="" onclick="this.form.submit()" ><label class="fakebox" for="allType">All</label></div>
                                <br><div class="inline-flex"><input ${requestScope.type.equals('ag')?'checked':''} id="ag" type="radio" name="type" value="ag" onclick="this.form.submit()" ><label class="fakebox" for="ag">AG</label></div>                     
                                <br><div class="inline-flex"><input ${requestScope.type.equals('ic')?'checked':''} id="ic" type="radio" name="type" value="ic" onclick="this.form.submit()"><label class="fakebox" for="ic">IC</label></div>
                                <br><div class="inline-flex"><input ${requestScope.type.equals('tf')?'checked':''} id="tf" type="radio" name="type" value="tf" onclick="this.form.submit()"><label class="fakebox" for="tf">TF</label></div>
                                <br><div class="inline-flex"><input ${requestScope.type.equals('mg')?'checked':''} id="mg" type="radio" name="type" value="mg" onclick="this.form.submit()"><label class="fakebox" for="mg">MG</label></div>
                                <br><div class="inline-flex"><input ${requestScope.type.equals('fg')?'checked':''} id="fg" type="radio" name="type" value="fg" onclick="this.form.submit()"><label class="fakebox" for="fg">FG</label></div>
                            </form>

                        </div>
                        <div class="price-selection-tree">

                        </div>
                    </div>
                </div>
                <div class="content-left-bottom-grid">

                    <div class="content-left-bottom-grids">
                        <div class="content-left-bottom-grid1">

                        </div>
                        <div class="content-left-bottom-grid1">

                        </div>
                    </div>
                </div>
            </div>
            <div class="content-right" style="width: 80%">
                <div class="product-grids">
                    <!--- start-rate---->




                    <c:forEach items="${requestScope.data}" var="x">
                        <div onclick="location.href = 'productDetail?id=${x.getId()}';" class="product-grid fade">
                            <div class="product-grid-head">

                            </div>
                            <div class="product-pic">
                                <a href="#"><img src="proImages/${x.getImage()}" title="product-name" /></a>
                                <p>
                                    <a href="#">${x.getName()}</a>
                                    <span></span>
                                </p>
                            </div>
                            <div class="product-info">
                                <div class="product-info-cust">
                                    <a href="details.html">Details</a>
                                </div>
                                <div class="product-info-price">
                                    <a href="details.html"> <fm:formatNumber pattern="#,###,###,### VND" value="${x.getPrice()}"></fm:formatNumber></a>
                                </div>
                                <div class="clear"> </div>
                            </div>
                            <div class="more-product-info">
                                <span> </span>
                            </div>
                        </div>
                    </c:forEach>




                    <div class="clear"> </div>
                </div>
                <c:if test="${requestScope.num!=0}">
                    <c:set var="page" value="${requestScope.page}"></c:set>
                        <div class="pagination">
                        <c:if test="${page!=1}">
                            <a href="home?search=${requestScope.search}&page=1&color=${requestScope.color}&price=${requestScope.price}&type=${requestScope.type}"><<</a>  
                        </c:if>      
                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                            <a class="${i==page?"active":""}" href="home?search=${requestScope.search}&page=${i}&color=${requestScope.color}&price=${requestScope.price}&type=${requestScope.type}">${i}</a>
                        </c:forEach>
                        <c:if test="${page!=requestScope.num}">
                            <a href="home?search=${requestScope.search}&page=${requestScope.num}&color=${requestScope.color}&price=${requestScope.price}&type=${requestScope.type}">>></a>  
                        </c:if>  
                    </div>
                </c:if>
                <c:if test="${requestScope.num==0}">
                    <div style="display: flex;"><h3>No matching products</h3></div>

                </c:if>
            </div>
            <div class="clear"> </div>
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
                    <p>Create one account to manage everything you do with Nike, from your shopping preferences to your
                        Nike+ activity.</p>
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
                <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
            </div>
            <div class="clear"> </div>
        </div>
    </div>
    <!---//End-footer---->
    <!---//End-wrap---->
</body>

</html>
