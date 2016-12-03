<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<jsp:include page="/WEB-INF/views/includes/header.jsp" />
<!-- Page Content -->
<div id="page-content-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1>수강신청</h1>

				<table border="1" width=500 height=300>
					<tr align="center" style="font-weight: bold;">
						<td><form:form method="post"
								action="${pageContext.request.contextPath}/validcourse"
								modelAttribute="course">
								<h3>2017년 1학기 수강신청</h3>
								<br />
								<p>
									과목코드:
									<form:input path="subjectCode" />
									<input type="submit" value="신청"></br> <font color="red"
										size="2em"><form:errors path="subjectCode"></form:errors></font>
								</p>
							</form:form></td>

					</tr>
					<tr>
						<td><h4>2016 1학기 과목 리스트</h4> <br />
							<p>2017 1학기 캡스톤디자인 전지 3학점 CSE0025</p>
							<p>2017 1학기 안드로이드프로그래밍 전선 3학점 CSE0031</p>
							<p>2017 1학기 웹프레임워크 전선 3학점 CSE0032</p>
							<p>2017 1학기 정보보안 전선 3학점 CSE0038</p>
							<p>2017 1학기 빅데이터프로그래밍 전선 3학점 CSE0043</p>
							<p>2017 1학기 디지털콘텐츠기획및제작 전선 3학점 CSE0044</p>
							<p>2017 1학기 오픈소스소프트웨어 전선 3학점 CSE0037</p>
							<p>2017 1학기 사용자어플리케이션구현 전선 3학점 CSE0053</p>
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
