<%-- 
    Document   : Report
    Created on : Jul 10, 2022, 8:06:15 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--        <link rel="stylesheet" href="../"/>-->
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../Header.jsp" %>
        <div class="wrap">
            <table>
                <tr>
                    <th>Date</th>
                    <th>User</th>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
                <h3>Orders</h3>
                <c:forEach items="${requestScope.orders}" var="x">
                    <tr>
                        <td>${x.getDate()}</td>
                        <td>${dao.seachUserById(x.getCusid()).getName()}</td>
                        <c:set value="${dao.searchOrderDetailByOrderId(x.getId())}" var="OrderDetail"></c:set>

                            <td>
                            <c:forEach items="${OrderDetail}" var="a">
                                ${dao.searchProductById(dao.searchProductDetailById(a.getPid()).getProductId()).getName()}
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach items="${OrderDetail}" var="a">
                                <fm:formatNumber pattern="###,###,### VND" value="${dao.searchProductById(dao.searchProductDetailById(a.getPid()).getProductId()).getPrice()}"></fm:formatNumber>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach items="${OrderDetail}" var="b">
                                ${b.getQuantity()}<br>
                            </c:forEach>
                        </td>
                        <td>
                            <fm:formatNumber pattern="###,###,### VND" value="${x.getTotalMoney()}"></fm:formatNumber>
                            </td>
                        </tr>   
                </c:forEach>
            </table>
            <br><h3>Financial Statements</h3>
            <c:set var="revenue" value="0"></c:set>
            <c:set var="cost" value="0"></c:set>
            <c:set var="profit" value="0"></c:set>
            <c:forEach items="${requestScope.orders}" var="x">
                <c:set var="revenue" value="${revenue+x.getTotalMoney()}"></c:set>
                <c:set value="${dao.searchOrderDetailByOrderId(x.getId())}" var="OrderDetail"></c:set>
                <c:forEach items="${OrderDetail}" var="a">
                <c:set var="cost" value="${cost+dao.searchProductById(dao.searchProductDetailById(a.getPid()).getProductId()).getCost()*a.getQuantity()}"></c:set>
            </c:forEach>
            </c:forEach>
            <c:set var="profit" value="${revenue-cost}"></c:set>     
                <table>
                    <tr>
                        <th>Revenue</th>
                        <th>Cost</th>
                        <th>Profit</th>
                    </tr>
                    <tr>
                    <td><fm:formatNumber pattern="###,###,### VND" value="${revenue}"></fm:formatNumber></td>
                    <td><fm:formatNumber pattern="###,###,### VND" value="${cost}"></fm:formatNumber></td>
                    <td><fm:formatNumber pattern="###,###,### VND" value="${profit}"></fm:formatNumber></td>
                </tr>

            </table> 
        </div>

    </body>
</html>
