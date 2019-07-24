<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript" 
src="https://www.google.com/jsapi"></script>
<link href="${path}/adbootstrap/min/css" rel="stylesheet" 
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="${path}/dashboard/css" rel="stylesheet">
<script>
	//구글 차트 라이브러리 로딩
	google.load("visualization","1", {
		"packages":["corechart"]
	});
	//라이브러리 로딩이 완료되면 drawChart 함수 호출
	google.setOnLoadCallback(drawChart);
	function drawChart(){
		//차트 그리기에 필요한 json 데이터 로딩
		var jsonData=$.ajax({
			url: "${path}/chart/cart_money_list.do",
			dataType: "json",
			async: false
		}).responseText;
		console.log(jsonData);
		//json => 데이터테이블
		var data=new google.visualization.DataTable(jsonData);
		console.log("데이터 테이블:"+data);
 		var chart=new google.visualization.PieChart(
				document.getElementById("chart_div")); 
/* 	var chart=new google.visualization.LineChart(
				document.getElementById("chart_div"));  */
/* 			var chart=new google.visualization.ColumnChart(
					document.getElementById("chart_div"));	 */
		chart.draw(data, {
			title: "과목별 총금액",
			//curveType: "function", //곡선처리
			width: 800,
			height: 640
		});
	}
</script>
<style type="text/css">
.row{padding-top: 25px;}
.chart{text-align: center;}
</style>
</head>

<%@ include file="../include/menu.jsp" %>
<div class="container-fluid">
  <div class="row">
    <nav class="col-md-2 d-none d-md-block bg-light sidebar">
      <div class="sidebar-sticky">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" href="${path}/">
              <span data-feather="home"></span>
              SKY&nbsp;홈  <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${path}/subject/list.do">
              <span data-feather="file"></span>
                          수강Edit
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${path }/user/admin/alluserslist.go">
              <span data-feather="users"></span>
                        회원관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="bar-chart-2"></span>
                       수강차트
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${path }/user/admin/allteacherslist.go">
              <span data-feather="layers"></span>
                        강사관리
            </a>
          </li>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>Saved reports</span>
          <a class="d-flex align-items-center text-muted" href="#">
            <span data-feather="plus-circle"></span>
          </a>
        </h6>
        <ul class="nav flex-column mb-2">
          <li class="nav-item">
            <a class="nav-link" href="${path }/board/boardlist.do?curPage=1&keyword=''">
              <span data-feather="file-text"></span>
                             게시판보러가기
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${path }/instructor.do">
              <span data-feather="file-text"></span>
                            강사리스트
            </a>
          </li>
        </ul>
      </div>
    </nav>

    <role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Dashboard</h1>       
      </div>

<div class="chart">
<div id="chart_div"></div>
<button id="btn" type="button" 
	onclick="drawChart">refresh</button>
</div>
<br>

      <h2>#해시태그</h2>
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th>#</th>
              <th>정보처리기사필기</th>
              <th>정보처리기사실기</th>
              <th>웹프로그래밍초급</th>
              <th>웹프로그래밍고급</th>
            </tr>
          </thead>
          <tbody>
            <tr style="color:blue; font-weight: bold;">
              <td></td>
              <td>이동휘 강사</td>
              <td>김연아 강사</td>
              <td>서인국 강사</td>
              <td>서인국 강사</td>
            </tr>
            <tr>
              <td>1月</td>
              <td>알고리즘</td>
              <td>html</td>
              <td>jsp</td>
              <td>javascript</td>
            </tr>
            <tr>
              <td>2月</td>
              <td>신기술동향</td>
              <td>데이터베이스</td>
              <td>알고리즘</td>
              <td>jsp</td>
            </tr>
            <tr>
              <td>3月</td>
              <td>javascript</td>
              <td>전자계산기</td>
              <td>신기술동향</td>
              <td>데이터베이스</td>
            </tr>
            <tr>
              <td>4月</td>
              <td>알고리즘</td>
              <td>jsp</td>
              <td>데이터베이스</td>
              <td>전자계산기</td>
            </tr>
            <tr>
              <td>5月</td>
              <td>신기술동향</td>
              <td>html</td>
              <td>알고리즘</td>
              <td>jsp</td>
            </tr>
            <tr>
              <td>6月</td>
              <td>javascript</td>
              <td>전자계산기</td>
              <td>알고리즘</td>
              <td>html</td>
            </tr>
            <tr>
              <td>7月</td>
              <td>javascript</td>
              <td>알고리즘</td>
              <td>html</td>
              <td>jsp</td>
            </tr>
            <tr>
              <td>8月</td>
              <td>데이터베이스</td>
              <td>신기술동향</td>
              <td>전자계산기</td>
              <td>javascript</td>
            </tr>
            <tr>
              <td>9月</td>
              <td>javascript</td>
              <td>알고리즘</td>
              <td>html</td>
              <td>jsp</td>
            </tr>
            <tr>
              <td>10月</td>
              <td>신기술동향</td>
              <td>javascript</td>
              <td>알고리즘</td>
              <td>jsp</td>
            </tr>
            <tr>
              <td>11月</td>
              <td>html</td>
              <td>javascript</td>
              <td>전자계산기</td>
              <td>jsp</td>
            </tr>
            <tr>
              <td>12月</td>
              <td>데이터베이스</td>
              <td>전자계산기</td>
              <td>알고리즘</td>
              <td>html</td>
            </tr>            
          </tbody>
        </table>
      </div>
</role>
  </div>
</div>

<%@ include file="../include/admin_footer.jsp" %>
<div style="margin-top: 160px;"></div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
