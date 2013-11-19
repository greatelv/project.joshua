<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.subscriber.*, com.util.*"%>
<%
	String name = request.getParameter("name");
	String home = request.getParameter("home");		//주소
	String telephone = request.getParameter("telephone");
	String email = request.getParameter("email");
	String website = request.getParameter("website");
	String message = request.getParameter("message");
	String count = request.getParameter("recipient");		//권수
	if(count==null)count="1";
	
	String type = request.getParameter("type");	//구독 타입	- 0 : 정기구독 x, 1 : 12개월, 2: 6개월	
	String price = request.getParameter("price");
	String status = request.getParameter("status");	//	N/Y 입금상태
	
	System.out.println("name : "+name);
	System.out.println("home : "+home);
	System.out.println("telephone : "+telephone);
	System.out.println("email : "+email);
	System.out.println("website : "+website);
	System.out.println("message : "+message);
	System.out.println("count : "+count);
	System.out.println("price : "+price);
	
	SUBSCRIBER_DAO dao = new SUBSCRIBER_DAO();
	SUBSCRIBER_VO vo = new SUBSCRIBER_VO();
	String transactionResult = "";

	try{
		vo.setNAME(name);
		vo.setADDRESS(home);
		vo.setPHONE(telephone);
		vo.setEMAIL(email);
		vo.setWEBSITE(website);
		vo.setMESSAGE(message);
		vo.setCOUNT(count);
		vo.setTYPE(type);
		vo.setPRICE(price);
		vo.setSTATUS(status);
		vo.setINSERT_DATE(Tools.getDate());
	
		transactionResult =dao.addData(vo);	//call dao for excute
		
	}catch(Exception e){
		e.printStackTrace();
		transactionResult = "2";
	}finally{
		System.out.print("transactionResult = "+transactionResult);
		if(transactionResult.equals("1")){
%>
	<script type="text/javascript">
		alert('구독 신청이 완료되었습니다. 감사합니다.! 오 주여');
		location.href="/index.jsp";
	</script>
<%
		}else{
%>
	<script type="text/javascript">
		alert('구독 신청이 정상적으로 처리되지 못했습니다. ㅠ Joshua에 연락부탁드려요!');
		history.back();
	</script>
<%			
		}
	}
%>

	