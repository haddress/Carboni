<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
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
	float:right; 
	font-size: medium;
	font-weight: normal;
   }
</style>
<body class="sb-nav-fixed">
	<div class="container-fluid px-4">
		 <h2 class="mt-4">배송 관리 <p class="nameing">홈>영업관리>배송관리</p></h2>
		<div class="card-header" id="btn">
			<div style="display: flex; justify-content: flex-end;">
				<button class="btn btn-secondary">조회</button>
				<button class="btn btn-secondary">등록</button>
				<button class="btn btn-secondary">삭제</button>
			</div>
		</div>
		<div class="card mb-4" id="pageing">
			<div class="card-body">
				 <span> 출하일자<input type="date" name="startCNDATE" id="startCNDATE" />~
		                     <input type="date" name="endCNDATE" id="endCNDATE" /><br>
                        배송번호<input type="text" id="leftinput" placeholder="배송번호"><br>
                     </span> 
			</div>
		</div>
	</div>
	<div id="search" title="배송정보" style="text-align: center;">       </div>
</body>
	
<div class="container-fluid px-4">
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table me-1"></i> 배송정보
		</div>
		<div id="grid"></div>
	</div>
</div>

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
			});
		}
	})();

	const grid = new tui.Grid({
		el : document.getElementById('grid'),
		data : gridData,
		scrollX : false,
		rowHeaders : [ 'rowNum', 'checkbox' ],
		columns : [ {
			header : '배송번호',
			name : 'c2',
			align : 'center',
			sortingType : 'desc',
			sortable : true
		}, {
			header : '제품코드',
			name : 'c3',
			align : 'center',
			sortingType : 'desc',
			sortable : true
		}, {
			header : '제품명',
			name : 'c4',
			align : 'center',
			sortingType : 'desc',
			sortable : true
		}, {
			header : '출하수량',
			name : 'c5',
			align : 'center',
			sortingType : 'desc',
			sortable : true
		}, {
			header : '거래처코드',
			name : 'c6',
			align : 'center',
			sortingType : 'desc',
			sortable : true
		}, {
			header : '출고일자',
			name : 'c7',
			align : 'center',
			sortingType : 'desc',
			sortable : true
		} ]
	});
	
	
</script>
</html>