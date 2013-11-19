<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.zipcode.*, com.util.*"%>
<%
	String query = request.getParameter("query");
	System.out.println("query : "+query);
	
	ZIPCODE_DAO dao = new ZIPCODE_DAO();
	ZIPCODE_VO vo = new ZIPCODE_VO();
	List<ZIPCODE_VO> list = dao.get_zipCodeList(query);
	
	JSONArray zipcodeList = JSONArray.fromObject(list);
	System.out.println(zipcodeList);
	out.println(zipcodeList);
%>	