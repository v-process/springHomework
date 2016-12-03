<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<jsp:include page="/WEB-INF/views/includes/header.jsp" />

<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1>이수 구분별 학점내역</h1>
				<table border="1" width=500 height=100>
					<tr align="center">
						<c:forEach var="course" items="${course }">
							<td>${course.separation}</td>
						</c:forEach>
						<td>총점</td>
					</tr>
					<tr align="center">
						<c:forEach var="course" items="${course}">
							<td>${course.credit}</td>
							<c:set var="sum" value="${sum + course.credit}" />
						</c:forEach>
						<td><c:out value="${sum}" /></td>
					</tr>

				</table>

				<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Side
					Menu</a>
			</div>
		</div>
	</div>
</div>
<!-- /#page-content-wrapper -->

</div>
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />