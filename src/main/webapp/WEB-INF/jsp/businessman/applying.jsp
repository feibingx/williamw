<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="customer-list pull-left">
	<ul>		
 		<c:forEach var="businessman" items="${businessmanList}">
			<li class="customer-item">
				<div class="list-avatar">
					<a href="${pageContext.request.contextPath}/businessman/${businessman.id}/message/first">
					<img src="${pageContext.request.contextPath}/assets/img/user-icon.png">
					<span> <b>${businessman.name}</b></span>
					</a>
				</div>
			</li>
		</c:forEach>
	</ul>
</div>
