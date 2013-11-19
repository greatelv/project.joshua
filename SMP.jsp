<%@ page language="java" contentType="text/html; charSet=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.subscriber.*, com.util.*, java.util.*"%>
<%
	SUBSCRIBER_DAO dao = new SUBSCRIBER_DAO();
	List<SUBSCRIBER_VO> subscriber_list = dao.getAllData();
	
%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		
		<title>Joshua 구독자관리시스템</title>
		
		<link rel="shortcut icon" type="image/ico" href="http://www.datatables.net/favicon.ico" />
		<link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="/css/DT_bootstrap.css">

		<script type="text/javascript" charset="utf-8" language="javascript" src="/js/jquery.js"></script>
		<script type="text/javascript" charset="utf-8" language="javascript" src="/js/jquery.dataTables.js"></script>
		<script type="text/javascript" charset="utf-8" language="javascript" src="/js/DT_bootstrap.js"></script>
	</head>
	<script type="text/javascript">

	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-38999262-1']);
	  _gaq.push(['_trackPageview']);
	
	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	
	</script>
<body>
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container">
				<!-- .btn-navbar is used as the toggle for collapsed navbar content -->
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a>

				<!-- Be sure to leave the brand out there if you want it shown -->
				<a class="brand" href="#">Joshua SMP</a>

				<!-- Everything you want hidden at 940px or less, place within here -->
				<div class="nav-collapse collapse">
					<ul class="nav">
						<li class="active"><a href="#">구독 신청자</a></li>
						<li><a href="#">환경설정</a></li>
						<li><a href="#">테스트</a></li>
					</ul>
				</div>

			</div>
		</div>
	</div>
	<div class="container" style="margin-top: 10px">
		<table cellpadding="0" cellspacing="0" border="0"
			class="table table-striped table-bordered" id="example">
			<thead>
				<tr><!-- Email, Message는 보류 -->
					<th>번호</th>
					<th>신청자 이름</th>
					<th>주소</th>
					<th>휴대폰</th>
					<th>이메일</th>
					<th>수량</th>
					<th>징기구독</th>
					<th>신청날짜</th>
				</tr>
			</thead>
			<tbody>
			<%for(int i = 0; i <subscriber_list.size(); i++){%>
				<tr>
					<td><%=subscriber_list.size()-i%></td>
					<td><%=subscriber_list.get(i).getNAME()%></td>
					<td><%=subscriber_list.get(i).getADDRESS()%></td>
					<td><%=subscriber_list.get(i).getPHONE()%></td>
					<td><%=subscriber_list.get(i).getEMAIL()%></td>
					<td><%=subscriber_list.get(i).getCOUNT()%></td>
					<td>
					<%if(subscriber_list.get(i).getTYPE().equals("1")){%>
						1년
					<%}else if(subscriber_list.get(i).getTYPE().equals("2")){%>
						6개월
					<%}else{%>
						X
					<%} %>
					
					</td>
					<td><%=subscriber_list.get(i).getINSERT_DATE()%></td>
				</tr>
			<%}%>	
			</tbody>
		</table>

	</div>
</body>
</html>
