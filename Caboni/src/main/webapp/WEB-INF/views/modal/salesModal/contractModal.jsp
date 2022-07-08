<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>거래처검색</title>
<style>
#input {
	width: 100px;
}

.title {
	margin: 15px 20px;
}
</style>
</head>
<body>
	<div id="dialog">
		<div class="container">
			<div class="title">
				●거래처명<input type="text" id="input" placeholder="거래처명"> ●거래처코드<input type="text" id="input" placeholder="거래처코드">
				<button class="btn btn-secondary">조회</button>
				<br>

			</div>
			<table border="1">
				<tr>

				</tr>
				<tr>
					<!-- function 기능 들어갈 곳  -->

				</tr>
			</table>
		</div>
		<div class="container-fluid px-4">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 거래처정보
				</div>
				<div id="gridcomp"></div>
			</div>
		</div>
		<button type="button" id="btnModal" class="btn btn-secondary" style="margin-right: 5px;">확인</button>
		<button type="button" id="btnModal" class="btn btn-secondary" style="margin-right: 5px;">취소</button>
		
		<script>
			$(function() {

				let grid = new tui.Grid({
					el : document.getElementById('gridcomp'),

					scrollX : false,
					rowHeaders : [ 'rowNum', 'checkbox' ],
					bodyHeight : 420,
					columns : [ {
						header : '거래처코드',
						name : 'c2',
						align : 'center',
						sortingType : 'desc',
						sortable : true
					}, {
						header : '거래처명',
						name : 'c3',
						align : 'center',
						sortingType : 'desc',
						sortable : true
					}, {
						header : '사업자번호',
						name : 'c4',
						align : 'center',
						sortingType : 'desc',
						sortable : true
					}, {
						header : '전화번호',
						name : 'c5',
						align : 'center',
						sortingType : 'desc',
						sortable : true
					} ]
				});
			})
		</script>
		<table>
		</table>
	</div>
</body>
</html>