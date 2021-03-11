<%@page import="com.item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%
	if (request.getParameter("itemCode") != null)
	{
		item itemObj = new item();
		String stsMsg = itemObj.insertItem(request.getParameter("ItemCode"),
		request.getParameter("ItemName"),
		request.getParameter("ItemPrice"),
		request.getParameter("ItemDesc"));
		session.setAttribute("statusMsg", stsMsg);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Items Management</title>
</head>
<body>
<h1>Items Management</h1>
		<form method="post" action="items.jsp">
				Item code: <input name="ItemCode" type="text"><br>
				Item name: <input name="ItemName" type="text"><br>
				Item price: <input name="ItemPrice" type="text"><br>
				Item description: <input name="ItemDesc" type="text"><br>
				<input name="btnSubmit" type="submit" value="Save">
		</form>
		<%
				out.print(session.getAttribute("statusMsg"));
		%>
		<br>
		<%
			item itemObj = new item();
			out.print(itemObj.readItems());
		%>
</body>
</html>