<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, shrink-to-fit=no, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>1091051 김승철 웹프레임워크 과제</title>

    <!-- Bootstrap Core CSS -->
    <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/bootstrap/css/simple-sidebar.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="${pageContext.request.contextPath}/">
                       수강안내 
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/semestercredit">학기별 이수학점</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/searchcredit">이수 구분별 학점 조회</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/addcourse">수강 신청하기</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/searchcourse">수강신청 조회</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->