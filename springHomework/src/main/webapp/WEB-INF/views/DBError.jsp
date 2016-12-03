<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<jsp:include page="/WEB-INF/views/includes/header.jsp" />

<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1>DBERROR</h1>
				<p>DB_ERROR : 정확한 코드명을 입력해주세요.</p>

				<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Side
					Menu</a> <a href="${pageContext.request.contextPath}/addcourse"
					class="btn btn-default">뒤로가기</a>
			</div>
		</div>
	</div>
</div>
<!-- /#page-content-wrapper -->

</div>
<jsp:include page="/WEB-INF/views/includes/footer.jsp" />
