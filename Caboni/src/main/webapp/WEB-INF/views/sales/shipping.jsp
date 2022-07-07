<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<head>
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
</head>
<style>
.btn-secondary {
	margin-left: 20px;
}

span {
	color: #494949;
	font-weight: bold;
}

#pageing {
	border: 1px solid #e6e6e6;
	line-height: 30px;
	background-color: #fff;
	color: #999999;
}

input {
	height: 23px;
	margin-left: 15px;
	display: inline-block;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	width: 20%;
	color: rgb(94, 94, 94);
	border-radius: 5px;
	text-align: center;
}

#leftinput {
	width: 42%;
}

#startCNDATE {
	margin-right: 10px;
}

#endCNDATE {
	margin-left: 5px;
}

.dataTable-input {
	height: 40px;
}
.nameing{ 
	margin-right:900px; 
   }
</style>
<body class="sb-nav-fixed">
	<div class="container-fluid px-4">
		<h2 class="mt-4">출하관리</h2>
		<div class="card-header" id="btn">
			<div style="display: flex; justify-content: flex-end;">
			<p class="nameing">홈>영업관리>출하관리</p>
				<button class="btn btn-secondary">진행상태변경</button>
				<button class="btn btn-secondary">미출고건조회</button>
				<button class="btn btn-secondary">조회</button>
				<button class="btn btn-secondary">등록</button>
				<button class="btn btn-secondary">삭제</button>
			</div>
		</div>
		<div class="card mb-4" id="pageing">
			<div class="card-body">
				 <span> 납기일자<input type="date" name="startCNDATE" id="startCNDATE" />~
		                     <input type="date" name="endCNDATE" id="endCNDATE" /><br>
		                출고일자<input type="date" name="startCNDATE" id="startCNDATE" />~
		                     <input type="date" name="endCNDATE" id="endCNDATE" /><br>
                        제품코드<input type="text" id="leftinput"><br>
                     </span> 
			</div>
		</div>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 출하목록
			</div>
			<div class="card-body">
				<table id="datatablesSimple">
					<thead>
						<tr>
							<td><input type="checkbox"></td>
							<th>수주번호</th>
							<th>제품코드</th>
							<th>수주수량</th>
							<th>총출하수량</th>
							<th>금번출하수량</th>
							<th>출고일자</th>
							<th>납기일자</th>
							<th>진행상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox"></td>
							<th>a01</th>
							<th>001</th>
							<th>10개</th>
							<th>8개</th>
							<th>1개</th>
							<th>20-01-01</th>
							<th>20-01-01</th>
							<th>진행중</th>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>

	
<div class="container-fluid px-4">
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table me-1"></i> 미정
		</div>
		<div id="grid"></div>
	</div>
</div>

<script type="text/javascript">
	jQuery(function($) {
		$("datatablesSimple").DataTable();
	});
</script>
</body>
<script>
	const gridData = [];

	(function() {
		for (let i = 0; i < 10; i += 1) {
			gridData.push({
				c1 : (i + 1),
				c2 : ((i + 5) % 8) * 100 + i,
				c3 : ((i + 3) % 7) * 60,
				c4 : ((i + 3) % 7) * 60,
				c5 : ((i + 3) % 7) * 60,
				c6 : ((i + 3) % 7) * 60,
				c7 : ((i + 3) % 7) * 60,
				c8 : ((i + 3) % 7) * 60,
				c9 : ((i + 3) % 7) * 60,

			});
		}
	})();

	const grid = new tui.Grid({
		el : document.getElementById('grid'),
		data : gridData,
		scrollX : false,
		rowHeaders : [ 'rowNum' ],
		columns : [ {
			header : '제품코드',
			name : 'c2',
			align : 'center'
		}, {
			header : '제품명',
			name : 'c3',
			align : 'center'
		}, {
			header : '자재코드',
			name : 'c4',
			align : 'center'
		}, {
			header : '자재명',
			name : 'c5',
			align : 'center'
		}, {
			header : '소요량(개당)',
			name : 'c6',
			align : 'center'
		}, {
			header : '필요량',
			name : 'c7',
			align : 'center'
		}, {
			header : '재고량',
			name : 'c8',
			align : 'center'
		}, {
			header : '부족량',
			name : 'c9',
			align : 'center'
		} ]
	});
</script>

<!-- 모달 -->
<script>
var modal = document.getElementById('myModal');
var btn = document.getElementById('write');
var span = document.getElementByClassName("close")[0];
$(document).ready(function(){
	btn.onclick = function(event) {
		modal.style.display = "block";
	}
	noticeList();
});

span.onclick = function(event) {
	modal.style.display = "none";
}

window.onclick = function(event) {
	if(event.target == modal) {
		modal.style.display = "none";
	}
}

</script>
</html>