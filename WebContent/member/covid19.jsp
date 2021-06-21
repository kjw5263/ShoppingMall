<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자가진단</title>
<style type="text/css">
.css_test img {
	border-radius: 5px;
	border: 1px solid gray;
	text-align: center;
	cursor: pointer;
	position: relative;
}
</style>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script> 
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="../resources/js/covid_speaker.js" type="text/JavaScript"></script>


</head>
<body>
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-dark navbar-brand" data-toggle="modal"
		data-target="#exampleModal">자가진단하기</button>
	<form action="../covid19/CovidAction.do" method="post">
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: auto; display: table">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">자가진단</h5>
					</div>
					<div class="container">
						<table class="table table-bordered">
							<tr>

								<th align="center">체온</th>
								<td><input type="text" placeholder="체온은 선택사항입니다" style="width: 100%;"></td>
								<th align="center">진단</th>
							</tr>

							<tr>
								<th align="center">1</th>
								<td>
									<div class="css_test">
										<label id="test">신종 코로나바이러스 환자 또는 밀접접촉자와 만난 적이 있다.</label> 
										<img src="../covid19/img/speaker.jpg" width="30px" height="30px">
									</div>
								</td>
								<td>
									<input type="Radio" id="strAns1" name="strAns1" value="있다">있다
									<input type="Radio" id="strAns1" name="strAns1" value="없다" checked>없다
								</td>
							</tr>
							<tr>
								<th align="center">2</th>
								<td>
									<div class="css_test">
										<label id="test">확진환자가 발생 혹은 경유한 다중이용시설을 다녀온 적이 있다.</label> 
										<img src="../covid19/img/speaker.jpg" width="30px" height="30px">
									</div>
								</td>
								<td>
									<input type="Radio" id="strAns2" name="strAns2" value="있다">있다
									<input type="Radio" id="strAns2" name="strAns2" value="없다" checked>없다
								</td>
							</tr>
							<tr>
								<th align="center">3</th>
								<td>
									<div class="css_test">
										<label id="test">보건당국으로부터 격리하도록 안내 받은 적이 있다.</label> 
										<img src="../covid19/img/speaker.jpg" width="30px" height="30px">
									</div>
								</td>
								<td>
									<input type="Radio" id="strAns3" name="strAns3" value="있다">있다
									<input type="Radio" id="strAns3" name="strAns3" value="없다" checked>없다</td>
							</tr>

							<tr>
								<th align="center">4</th>
								<td>
									<div class="css_test">
										<label id="test">발열 증상이 있다.(37.5°C 이상)</label> 
										<img src="../covid19/img/speaker.jpg" width="30px" height="30px">
									</div>
								</td>
								<td>
									<input type="Radio" id="strAns4" name="strAns4" value="있다">있다
									<input type="Radio" id="strAns4" name="strAns4" value="없다" checked>없다</td>
							</tr>
							<tr>
								<th align="center">5</th>
								<td>
									<div class="css_test">
										<label id="test">호흡기 증상(기침, 인후통, 호흡곤란 등)이 있다.</label> 
										<img src="../covid19/img/speaker.jpg" width="30px" height="30px">
									</div>
								</td>
								<td>
									<input type="Radio" id="strAns5" name="strAns5" value="있다">있다
									<input type="Radio" id="strAns5" name="strAns5" value="없다" checked>없다</td>
							</tr>
							<tr>
								<th align="center">6</th>
								<td>
									<div class="css_test">
										<label id="test">해열제를 복용하였다.</label> 
										<img src="../covid19/img/speaker.jpg" width="30px" height="30px">
									</div>
								</td>
								<td>
									<input type="Radio" id="strAns6" name="strAns6" value="있다">있다
									<input type="Radio" id="strAns6" name="strAns6" value="없다" checked>없다</td>
							</tr>
							<tr>
								<th align="center">7</th>
								<td>
									<div class="css_test">
										<label id="test">동거가족 중 자가격리 중인 가족이 있다.</label> 
										<img src="../covid19/img/speaker.jpg" width="30px" height="30px">
									</div>
								</td>
								<td>
									<input type="Radio" id="strAns7" name="strAns7" value="있다">있다
									<input type="Radio" id="strAns7" name="strAns7" value="없다" checked>없다</td>
							</tr>
							<tr>
								<th align="center">8</th>
								<td>
									<div class="css_test">
										<label id="test">동거가족 중 자가격리 중인 사람과 14일 이내 접촉한 사실있다.</label> 
										<img src="../covid19/img/speaker.jpg" width="30px" height="30px">
									</div>
								</td>
								<td>
									<input type="Radio" id="strAns8" name="strAns8" value="있다">있다
									<input type="Radio" id="strAns8" name="strAns8" value="없다" checked>없다</td>
							</tr>
							<tr>
								<th align="center">9</th>
								<td>
									<div class="css_test">
										<label id="test">최근 14일내 해외를 다녀온 적이 있다.</label> 
										<img src="../covid19/img/speaker.jpg" width="30px" height="30px">
									</div>
								</td>
								<td>
									<input type="Radio" id="strAns9" name="strAns9" value="있다">있다
									<input type="Radio" id="strAns9" name="strAns9" value="없다" checked>없다</td>
							</tr>
							<tr>
								<th align="center">10</th>
								<td>
									<div class="css_test">
										<label id="test">최근 14일내 타 지역에 방문 한 적이있다.</label> 
										<img src="../covid19/img/speaker.jpg" width="30px" height="30px">
									</div>
								</td>
								<td>
									<input type="Radio" id="strAns10" name="strAns10" value="있다">있다
									<input type="Radio" id="strAns10" name="strAns10" value="없다" checked>없다</td>
							</tr>

							</tbody>
						</table>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
						<input id="su"type="button" class="btn btn-primary" value="전송"/>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>