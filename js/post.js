$(document).ready(function() {

	$("#home").bind('click', function(){
		$('#myModal').reveal({
			closeonbackgroundclick: false,              //if you click background will modal close?
			close : postPopupClear(),
			animation: 'fade',                   //fade, fadeAndPop, none
		    animationspeed: 300,                       //how fast animtions are
		    dismissmodalclass: 'close-reveal-modal'    //the class of a button or element that will close an open modal
		});
		$('#input_address').focus();
	});
	$("#home").focus(function(){
		$("#home").trigger('click');
	});
	
	$('#standing_order_year').click(function(){
		$('#recipient').attr('disabled', true);
		$('#price').val('40000');
	});
	
	$('#standing_order_half').click(function(){
		$('#recipient').attr('disabled', true);
		$('#price').val('20000');
	});
	
	$('#standing_order_none').click(function(){
		$('#recipient').attr('disabled', false);
		var total_price = 4000 * $('#recipient').val();
		$('#price').val(total_price);
	});
	
	$('#recipient').change(function(){
		var total_price = 4000 * $('#recipient').val();
		$('#price').val(total_price);
	});
	
	$(".post").live('click', function(){
		var postNum = $(this).attr('post');	//우편번호
		var address = $(this).text();	//주소

		$('#real_address_Container').show();
		$('#real_address_Container').find('span').text('['+postNum+'] '+address);
	});

	$("#post_submit").click(function(){
		var detailAddress = $('#selected_detail_address');
		if(detailAddress.val() == ''){
			alert('상세주소를 입력해주세요.');
			detailAddress.focus();
			return false;
		}
		$('#home').val($('#real_address_Container').find('span').text()+' '+detailAddress.val());
		$('#myModal').trigger('reveal:close');

		postPopupClear();
	});

	$('#input_address').live('keypress', function(e) {
		if ($(this).val()!='' && e.which == 13) {/* 13 == enter key@ascii */
			$("#search_address").trigger('click');
		}
	});

	$("#search_address").bind('click', function(e){
		var address = $('#input_address').val();
		$('#postLoading').css('visibility', 'visible');
			
		if(address != ''){
			//우편번호 API 사용에 필요한 매개변수

			$.ajax({
				url : '/controller/get_zipcode.jsp?query='+encodeURIComponent(address),
				type : 'post',
				dataType : "json",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success: function(oRes, sStatus, oXHR){
					
					var itemList = $(oRes);

					if(itemList.length == 0){	//1차 주소 검색에 따른 예외처리
						$('#address_Container').empty().text('해당 키워드로 검색된 주소가 없습니다. 키워드를 올바르게 입력해주세요!');
						return false;
					}

					var postListElem = ['<ul>'];

					for(var i=0, length = itemList.length; i < length; i++ ){
						postListElem.push('<li post="'+itemList[i].ZIPCODE+'" class="post">'+itemList[i].ADDRESS+'</li>');
					}
					postListElem.push('</ul>');
					$('#address_Container').empty().append(postListElem.join(''));
				},
				error : function(xhr, status, error){
					console.log('error! : [Featured] ajax request address: ' + address);
				},
				complete : function(){
					$('#postLoading').css('visibility', 'hidden');
					console.log('complete! : [Featured] ajax request address: ' + address);
				}
			});
		}
	});

	var postPopupClear = function(){
		//주소 찾기 완료에 따른 요소 초기화
		$('#selected_detail_address').val('');
		$('#input_address').val('');
		$('#address_Container').empty();
		$('#real_address_Container').hide();
	};
});