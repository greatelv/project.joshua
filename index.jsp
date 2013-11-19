<%@ page language="java" contentType="text/html; charSet=UTF-8" pageEncoding="UTF-8" %>
<%
	response.setHeader("Access-Control-Allow-Origin", "*");
	response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
	response.setHeader("Access-Control-Allow-Headers", "X-PINGARUNER");
%>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta http-equiv="Access-Control-Allow-Origin" content="*"> 
  
  <title>조슈아 구독신청 페이지</title>
  <meta name="author" content="Jake Rocheleau">
  <link rel="shortcut icon" href="http://static02.hongkiat.com/logo/hkdc/favicon.ico">
  <link rel="icon" href="http://static02.hongkiat.com/logo/hkdc/favicon.ico">
  <link rel="stylesheet" type="text/css" media="all" href="./css/style.css">
  <link rel="stylesheet" type="text/css" media="all" href="http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css">
  <link rel="stylesheet" type="text/css" media="all" href="http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css">
  <link rel="stylesheet" type="text/css" media="all" href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css">

  <link rel="stylesheet" type="text/css" media="all" href="./css/responsive.css">
  <link rel="stylesheet" type="text/css" media="all" href="./css/reveal.css">
  <script type="text/javascript" src="./js/json2.js"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.js"></script>
  
  <script type="text/javascript" src="./js/jquery.reveal.js"></script>
  <script type="text/javascript" src="./js/post.js"></script>
  <script type="text/javascript">
  $(document).ready(function() {
	if($.browser.msie){	//IE SET
  		$('#name').val('당신의 이름!').bind('focus',function(){
  			$(this).val('');
  		});
  		$('#home').val('배송 받으실 주소').bind('focus',function(){
  			$(this).val('');
  		});
  		$('#telephone').val('휴대폰 번호. 꼭!').bind('focus',function(){
  			$(this).val('');
  		});
  		$('#email').val('이메일 주소!').bind('focus',function(){
  			$(this).val('');
  		});
  		$('#website').val('페이스북 주소나 개인 블로그가 있다면!').bind('focus',function(){
  			$(this).val('');
  		});
  		$('#message').val('하고 싶은 말, 전하고싶은 말을 남겨주세요!').bind('focus',function(){
  			$(this).val('');
  		});
  		
  		$('#hongkiat-form').removeAttr('action');
  		$('#hongkiat-form').attr('onSubmit','return false');
  		$('#submitbtn').bind('click', function(){	//IE Submit
			if($('#name').val()==''||$('#name').val() =='당신의 이름!'){
				alert('이름은 꼭 입력해 주세요!');
				$('#name').focus();
				return false;
			}
			if($('#home').val()==''||$('#home').val() =='배송 받으실 주소'){
				alert('주소도 꼭 입력해 주세요!');
				$('#home').focus();
				return false;
			}
			if($('#telephone').val()==''||$('#telephone').val() =='휴대폰 번호. 꼭 !'){
				alert('휴대폰 번호도 꼭 입력해 주세요!');
				$('#telephone').focus();
				return false;
			}
			
			$('#hongkiat-form').removeAttr('onSubmit');
			$('#hongkiat-form').attr('action', '/controller/insert.jsp');
			$('#hongkiat-form').submit();
		});
  	}

	
	
  });
  </script>

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
</head>
<body>
	<section id="container">
		<span class="chyron"><em><a href="http://magazinejoshua.tistory.com/">&laquo; Joshua 블로그</a></em></span>
		<h2>Joshua 구독 신청 페이지</h2>
		<form name="hongkiat" id="hongkiat-form" method="post" action="/controller/insert.jsp">
		<!-- <input type="hidden" name="price" value="4000"/>	입금해야할 가격 -->
		<input type="hidden" name="status" value="N"/>	<!-- 입금 상태 -->
		
		<div id="wrapping" class="clearfix">
			<section id="aligned">
			<div style="font-size: 15px; margin-bottom: 10px;"><b style="color: darkcyan;">[도서출판 JOSHUA]</b> 국민은행 092137-04-002209<br><b style="color: darkcyan;">문의</b> : 편집장 필상원 - <a href="mailto:pso3578@nate.com">pso3578@nate.com</a></div>
			<input type="text" name="name" id="name" placeholder="당신의 이름!" autocomplete="off" tabindex="1" class="txtinput" maxlength="6" required="required">
		
			<input type="tel" name="home" id="home" placeholder="배송 받으실 주소" tabindex="2" class="txtinput"  required="required"/>
		
			<input type="tel" name="telephone" id="telephone" placeholder="휴대폰 번호. 꼭 !" tabindex="3" class="txtinput" maxlength="14" required="required">
		
			<input type="email" name="email" id="email" placeholder="이메일 주소!" autocomplete="off" tabindex="4" class="txtinput">
		
			<input type="url" name="website" id="website" placeholder="페이스북 주소나 개인 블로그가! ('http://' 포함)" autocomplete="off" tabindex="5" class="txtinput">
		
			<textarea name="message" id="message" placeholder="하고 싶은 말, 전하고싶은 말을 남겨주세요!" tabindex="6" class="txtblock"></textarea>
			</section>
			
			<section id="aside" class="clearfix">
				<section id="recipientcase">
				<h3>수량</h3>
					<select id="recipient" name="recipient" tabindex="7" class="selmenu">
  						<option value="1"  selected="selected">1권</option>
  						<option value="2" >2권</option>
  						<option value="3" >3권</option>
  						<option value="4" >4권</option>
  						<option value="5" >5권</option>
  						<option value="6" >6권</option>
  						<option value="7" >7권</option>
  						<option value="8" >8권</option>
  						<option value="9" >9권</option>
  						<option value="10" >10권</option>
  						<option value="11" >11권</option>
  						<option value="12" >12권</option>
  						<option value="13" >13권</option>
  						<option value="14" >14권</option>
  						<option value="15" >15권</option>
  						<option value="16" >16권</option>
  						<option value="17" >17권</option>
  						<option value="18" >18권</option>
  						<option value="19" >19권</option>
  						<option value="20" >20권</option>
  					</select>
				</section>
				
				<section id="prioritycase">
					<h3>정기구독</h3>
					<span class="radiobadge">
						<input type="radio" id="standing_order_none" name="type" value="0" checked="checked">
						<label for="high">정기구독 안함</label>
					</span>
					<span class="radiobadge">
						<input type="radio" id="standing_order_year" name="type" value="1">
						<label for="low">12개월</label>
					</span>
					<span class="radiobadge">
						<input type="radio" id="standing_order_half" name="type" value="2" >
						<label for="med">6개월</label>
					</span>
				
					
				</section>
			</section>
			<section id="guide">
				입금해야할 금액 <input type="text" id="price" name="price" value="4000" readonly="readonly"> 원
			</section>
		</div>
		
		


		<section id="buttons">
			<input type="reset" name="reset" id="resetbtn" class="resetbtn" value="초기화">
			<input type="submit" name="submit" id="submitbtn" class="submitbtn" tabindex="8" value="구독신청">
			<br style="clear:both;">
		</section>
		</form>
	</section>

	<div id="myModal" class="reveal-modal">
		<h1>우편번호 검색</h1>
		<p>동/읍/면 이름을 입력하세요.</p>
		<input type="text" id="input_address"> <a id="search_address">찾기</a>

		<div id="address_Container"></div>
		<div id="real_address_Container">
			<span></span>
			<input type = "text" id="selected_detail_address" class="txtinput" placeholder="나머지 주소!" style="width: 300px;"/>
			<div id="post_submit">제출</div>
		</div>
		<div id="postLoading">
			<img src="/img/ajax-loader.gif">
		</div>
		
		<a class="close-reveal-modal">&#215;</a>
	</div>


</body>
</html>
