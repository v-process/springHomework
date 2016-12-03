<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<jsp:include page="/WEB-INF/views/includes/header.jsp" />

<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1>이수 학기별 과목 열람</h1>

				<table border="1" width=500 height=300>
					<tr align="center" style="font-weight: bold;">
						<td>년도</td>
						<td>학기</td>
						<td>과목</td>
						<td>학점</td>
					</tr>
					<c:forEach var="course" items="${course }">
						<tr align="center">
							<td>${course.year}</td>
							<td>${course.term}</td>
							<td>${course.subject}</td>
							<td>${course.credit}</td>
						</tr>
					</c:forEach>
				</table>

				<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Side
					Menu</a> <a href="${pageContext.request.contextPath}/semestercredit"
					class="btn btn-default">뒤로가기</a>
			</div>
		</div>
	</div>
</div>
<!-- /#page-content-wrapper -->

</div>
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />