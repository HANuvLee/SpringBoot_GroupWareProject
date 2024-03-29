<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link href="css/css_main.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/chat.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src="https://kit.fontawesome.com/29ccb048c9.js" crossorigin="anonymous"></script>
    


    
    

</head>

<!-- <body onload="printClock()"> -->
<body>
<div class="body">
<c:if test="${sessionScope.mem_no ne null }">
<%@ include file="/WEB-INF/viewpart/header.jsp"%>
<%@ include file="/WEB-INF/viewpart/aside.jsp"%>   

	<div id="sc_cont_up">
	    <div id="sc_cont_ul">
	        <div id="sc_cal_todo">
	        	<div class="sc_cal_todo1">
						<h3>${caltoday.month_+1 }월 일정</h3><p>
					<table class="main_cal" border="1px">
						<thead>
							<tr>
								<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<c:forEach var="cal" items="${callistall }">
								
									<c:choose>
										<c:when test="${cal.day_no ==1 }">
											<td>
											<a href="todolist?year_=${cal.year_ }&month_=${cal.month_ +1}&day_=${cal.day_}&mem_no=${mo.mem_no}">${cal.day_ }</a>
											<c:if test="${cal.todocnt != 0  }">★</c:if>
											</td>
										</c:when>
										<c:when test="${cal.day_no == 7 }">
											<td>
											<a href="todolist?year_=${cal.year_ }&month_=${cal.month_ +1}&day_=${cal.day_}&mem_no=${mo.mem_no}">${cal.day_ }</a>
											<c:if test="${cal.todocnt != 0  }">★</c:if>
											</td>
											</tr><tr>
										</c:when>
											<c:otherwise>
											<td>
											<a href="todolist?year_=${cal.year_ }&month_=${cal.month_ +1}&day_=${cal.day_}&mem_no=${mo.mem_no}">${cal.day_ }</a>
											<c:if test="${cal.todocnt != 0  }">★</c:if>
											</td>
											</c:otherwise>
									</c:choose>
								
								</c:forEach>
							</tr>
						</tbody>
					</table>
           		</div>       
                	<div class="sc_cal_todo2">
                    	<h3>일정 리스트</h3>
                    		<c:forEach var="test1" items="${callistall}">
								<c:if test="${test1.todocnt != 0 }">
									${test1.day_ }일 : ${test1.todocnt }개 일정 있음. <br>
								</c:if>

							</c:forEach><p>
					</div>
				</div>
                <div class="sc_bor_todo">
                	<div id="sc_board"><h3><a href="list1">게시판</a></h3><p>
                    	<ul>
                 			<c:forEach var="board" items="${recentlistBoard1 }">
								<li><a href="content1?board_no=1&post_no=${board.post_no }">${board.post_title } /written by. ${board.mem_name  } ${board.mem_rank }</a></li>
							</c:forEach>
                    	
                    	</ul>
                    
                    </div>
                    <div id="sc_cont_down">
                			<div id="sc_booking"><h3><span id="title_scbooking">자원예약</span></h3>
                			<hr>
                			<div id="rsci1"><table id="rscit1"><tr id="rscitr1"><th id="rscith1">[이용 가능 차량]</th></tr><tr id="rscitr1"><td id="rscitd1">${carcntnow}</td></tr></table></div>
                			<div id="rsci2"><table id="rscit2"><tr id="rscitr2"><th id="rscith2">[결재 상신 건수]</th></tr><tr id="rscitr2"><td id="rscitd2">${apuptotal1 }</td></tr></table></div>
                			<div id="rsci3"><table id="rscit3"><tr id="rscitr3"><th id="rscith3">[내 결재 건수]</th></tr>	<tr id="rscitr3"><td id="rscitd3">
                			<c:if test="${auth_no ==1 }">${apuptotalT}</c:if> 
                			<c:if test="${auth_no !=1 }">${apuptotal2}</c:if>
                			</td></tr></table></div>
                			
                			</div>
                			
            		</div>
            	</div>
                	<div id="sc_order"><h3>전자메일</h3>
                	<hr>
                	<table>
                	<c:forEach var="mail" items="${listMail}">
					<tr>                	
                	<td>[${mail.mail_no}]. ${mail.mail_title} </td> 
                	<td> 보낸사람 : ${mail.mem_name }  </td>
                	<td> 보낸 시간 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${mail.mail_send_time }"/> </td>
                	</tr>
                	</c:forEach>
                	</table>
                	
                	</div>
		
		</div> 
	</div>
	<%@ include file="/WEB-INF/viewpart/chating.jsp"%>
    <%@ include file="/WEB-INF/viewpart/footer.jsp"%>
</c:if>
<c:if test="${sessionScope.mem_no eq null }">
<%
	response.sendRedirect("loginForm");
%>
</c:if>
</div>
</body>

</html>