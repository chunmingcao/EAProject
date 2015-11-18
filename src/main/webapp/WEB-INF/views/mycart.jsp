 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
            <c:forEach var="item" items="${cart.cartItems}">
            
			<tr>
                <td>${item.product.name}</td>
                <td>${item.product.price}</td>
                <td>${item.quantity} <a href="#">X</a></td>
                <td>${item.getTotal()}</td>
                <td class="col-sm-1 col-md-1"> 
                <form:form commandName="cartItem" method="POST" action="${contextPath}/cart/removeitem/${item.id}">
					<button type="submit" class="btn btn-danger"> <span
																	class="glyphicon glyphicon-remove">
					                Remove</span>
															</button>
				</form:form>
	           </td>
            </tr>
			</c:forEach>
            <tr>
                <th colspan="3"><span class="pull-right">Total</span></th>
                <th>${cart.getTotal()}</th>
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
