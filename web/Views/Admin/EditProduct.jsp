<%-- 
    Document   : EditProduct
    Created on : Jun 21, 2022, 6:44:33 PM
    Author     : ASUS
--%>
<%@page import="Models.Products" %>
<%@page import="DAL.*" %>
<%@page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/styleHome.css"/>
        <link href="./css/styleLogin.css" rel='stylesheet' type='text/css' />
        <style>
            .option{
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
            <h4>Edit Products</h4>
            <table>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Brand</th>
                    <th>Type</th>
                    <th>Cost</th>
                    <th>Image</th>
                    <th colspan="3" >Options</th>
                </tr>
                <c:set var="page" value="${requestScope.page}"></c:set>
                <c:forEach items="${requestScope.data}" var="x">
                    <tr>
                        <td>${x.getId()}</td>
                        <td>${x.getName()} </td>
                        <td>${x.getPrice()} </td>
                        <td>${x.getBrand()} </td>
                        <td>${x.getType()} </td>
                        <td>${x.getCost()} </td>
                        <td><img src="proImages/${x.getImage()}" width="30%" height="" alt="alt"/> </td>
                        <td><a class="option" href="updateDelete?type=1&id=${x.getId()}&page=${page}">update</a></td>
                        <td><a class="option" href="updateDelete?type=0&id=${x.getId()}&page=${page}">delete</a></td>
                        <td><a class="option" href="editProductDetail?proDtId=${x.getId()}">detail</a></td>
                    </tr>
                </c:forEach>
                <div class="clear"> </div>
            </table>


            <div class="pagination">
                <c:if test="${page!=1}">
                    <a href="editProduct?page=1"><<</a>  
                </c:if>      
                <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                    <a class="${i==page?"active":""}" href="editProduct?page=${i}">${i}</a>
                </c:forEach>
                <c:if test="${page!=requestScope.num}">
                    <a href="editProduct?page=${requestScope.num}">>></a>  
                </c:if>  
            </div>

            <%
                DAO dao = (DAO)request.getAttribute("dao");
                Object obj = request.getAttribute("proUpdateId");
                String id = "";
                String name = "";
                String price = "";
                String brand = "";
                String type = "";
                String cost = "";
                String image = "";
                if(obj != null)
            {            
                    id = (obj +"").trim();
                    for(Products pro:dao.getProduct())
                    {
                        if(id.equalsIgnoreCase((pro.getId()+"").trim())){
                            name = pro.getName();
                            price = (pro.getPrice()+"").trim();
                            brand = pro.getBrand();
                            type = pro.getType();
                            cost = (pro.getCost()+"").trim();
                            image = pro.getImage();
                            break;
                        }
                    }
            
            }
            %>
            <form action="editProduct" method="post">
                Id: <br><input type="text" name="id" required value="<%=id%>" readonly><br>
                Name: <input type="text" name="proName" required value="<%=name%>"><br>
                Price: <input type="text" name="price" required value="<%=price%>"><br>
                Brand <select name="brand">
                    <option value="Nike" <%=brand.toLowerCase().equalsIgnoreCase("Nike")?"selected":""%>>Nike</option>
                    <option value="Adidas" <%=brand.toLowerCase().equalsIgnoreCase("Adidas")?"selected":""%>>Adidas</option>
                    <option value="Mizuno" <%=brand.toLowerCase().equalsIgnoreCase("Mizuno")?"selected":""%>>Mizuno</option>
                    <option value="Puma" <%=brand.toLowerCase().equalsIgnoreCase("Puma")?"selected":""%>>Puma</option>

                </select><br><br>
                Type: <select name="type">
                    <option value="ag" <%=type.toLowerCase().equalsIgnoreCase("ag")?"selected":""%>>AG</option>
                    <option value="ic" <%=type.toLowerCase().equalsIgnoreCase("ic")?"selected":""%>>IC</option>
                    <option value="tf" <%=type.toLowerCase().equalsIgnoreCase("tf")?"selected":""%>>TF</option>
                    <option value="mg" <%=type.toLowerCase().equalsIgnoreCase("mg")?"selected":""%>>MG</option>
                    <option value="fg" <%=type.toLowerCase().equalsIgnoreCase("fg")?"selected":""%>>FG</option>
                </select><br><br>
                Cost: <input type="text" name="cost" required value="<%=cost%>"><br>
                Image: <input type="file" name="image" value="proImages/<%=image%>"><br>
                <input type="submit" value="<%=obj!=null?"UPDATE":"INSERT"%>">
            </form>

        </div>






    </body>
</html>
