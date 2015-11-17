<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<t:genericpage>
	<jsp:attribute name="title">Sign Up</jsp:attribute>
	<jsp:body>
    <div class="jumbotron">
	<h3>My Cart Items</h3><hr>
	
	
	<table class="table table-striped table-hover table-bordered">
        <tbody>
            <tr>
                <th>Item</th>
                <th>Price</th>
                <th>QTY</th>
                <th>Total Price</th>
            </tr>
            <c:forEach var="cart" items="${carts}">
            
			<tr>
                <td>${cart.product.name}</td>
                <td>${cart.product.price}</td>
                <td>${cart.quantity} <a href="#">X</a></td>
                <td>${cart.getTotal()}</td>
                <td class="col-sm-1 col-md-1"> 
	                <button type="button" class="btn btn-danger"> <span class="glyphicon glyphicon-remove">
	                </span> Remove </button>
				</td>
            </tr>
			</c:forEach>
            
            <tr>
                <th colspan="3"><span class="pull-right">Sub Total</span></th>
                <th>£250.00</th>
            </tr>
            <tr>
                <th colspan="3"><span class="pull-right">Total</span></th>
                <th>£300.00</th>
            </tr>
            <tr>
                <td><a href="#" class="btn btn-primary">Continue Shopping</a></td>
                <td colspan="3"><a href="#" class="pull-right btn btn-success">Checkout</a></td>
            </tr>
        </tbody>
    </table>          
      </div>
    </jsp:body>
</t:genericpage> 