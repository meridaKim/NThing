<%--
  Created by IntelliJ IDEA.
  User: zaniz
  Date: 2022-11-27
  Time: 오후 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="main.java.dto.NThing"%>
<%@ page import="main.java.dao.NThingRepository"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@include file="dbconn.jsp"%>

<%
  request.setCharacterEncoding("utf-8");

  String filename = "";
  String realFolder = "C:\\Users\\zaniz\\IdeaProjects\\NThing\\web\\WebContent\\resources\\images";
  int maxSize = 5 * 1024 * 1024;
  String encType = "utf-8";

  MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

  String NThingId = multi.getParameter("NThingId");
  String NThingName = multi.getParameter("NThingName");
  String unitPrice = multi.getParameter("unitPrice");
  String writer = multi.getParameter("writer");
  String siteName = multi.getParameter("siteName");
  String writeDate = multi.getParameter("writeDate");
  String description = multi.getParameter("description");
  String category = multi.getParameter("category");
  String unitsInStock = multi.getParameter("unitsInStock");
  String totalSalePercent = multi.getParameter("totalSalePercent");
  String NThinger =multi.getParameter("NThinger");
  Integer price;
  Integer nthinger;
  Integer nthingid;
  if (NThingId.isEmpty())
    nthingid = 0;
  else
    nthingid = Integer.valueOf(NThingId);


  if (unitPrice.isEmpty())
    price = 0;
  else
    price = Integer.valueOf(unitPrice);

  if (NThinger.isEmpty())
    nthinger = 0;
  else
    nthinger = Integer.valueOf(NThinger);

  long stock;
  if (unitsInStock==null)
    stock = 0;
  else
    stock = Long.valueOf(unitsInStock);

  long salePercent;
  if (totalSalePercent==null)
    salePercent = 0;
  else
    salePercent = Long.valueOf(totalSalePercent);

  Enumeration files = multi.getFileNames();
  String fname = (String) files.nextElement();
  String fileName = multi.getFilesystemName(fname);

  PreparedStatement pstmt =null;
  String sql = "insert into nthings values(?,?,?,?,?,?,?,?,?,?,?,?)";
  pstmt = conn.prepareStatement(sql);
  pstmt.setInt(1, nthingid);
  pstmt.setString(2, NThingName);
  pstmt.setInt(3, price);
  pstmt.setInt(4,nthinger);
  pstmt.setLong(5,salePercent);
  pstmt.setString(6,description);
  pstmt.setString(7, category);
  pstmt.setString(8, writer);
  pstmt.setString(9,writeDate);
  pstmt.setLong(10,stock);
  pstmt.setString(11,siteName);
  pstmt.setString(12,fileName);
  pstmt.executeUpdate();

  if(pstmt !=null)
    pstmt.close();
  if (conn != null)
    conn.close();


//  NThingRepository dao = NThingRepository.getInstance();
//
//  NThing newNThing = new NThing();
//  newNThing.setNThingName(NThingName);
//  newNThing.setNThingId(NThingId);
//  newNThing.setUnitPrice(price);
//  newNThing.setWriter(writer);
//  newNThing.setWriteDate(writeDate);
//  newNThing.setDescription(description);
//  newNThing.setCategory(category);
//  newNThing.setTotalSalePercent(salePercent);
//  newNThing.setFilename(fileName);
//  newNThing.setSiteName(siteName);
//  newNThing.setUnitInStock(stock);
//  newNThing.setNthinger(nthinger);
//
//  dao.addNThing(newNThing);

  response.sendRedirect("editNThing.jsp?edit=update");
%>