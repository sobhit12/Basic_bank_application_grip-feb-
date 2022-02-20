<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link href="./css/style.css" type="text/css">
<title>VIEW CUSTOMERS</title>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>

	<img class="customer-imgg" src="img/img-22.jpg">
	<h1 class="head">View Customers</h1>
	<br>
	<br>
	<jsp:scriptlet>
	try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/basic_bank_application", "root","Sobhit");
	PreparedStatement ps = con.prepareStatement("select * from customer ");
	ResultSet rs = ps.executeQuery();
	int id, amount;
	long phno, account_no;
	String name, aadhar_no, emailid;
	</jsp:scriptlet>
	<div class="container">
		<table
			class="table border table-striped  table-hover  table-bordered   ">
			<tr>
				
				<th>Customer Id</th>
				<th>Name</th>
				<th>Account No.</th>
				<th>Aadhar No.</th>
				<th>Phone No.</th>
				<th>Email Id.</th>
				<th>Amount</th>
			</tr>

			<jsp:scriptlet>
			
while (rs.next()) {

	id = rs.getInt("id");
	name = rs.getString("name");
	aadhar_no = rs.getString("aadhar_no");
	emailid = rs.getString("emailid");
	phno = rs.getLong(4);
	amount = rs.getInt("amount");
	account_no = rs.getLong(7);
	System.out.println(amount);</jsp:scriptlet>
			<tr>
				<td ><jsp:expression>id</jsp:expression></td>
				<td ><jsp:expression>name</jsp:expression></td>
				<td ><jsp:expression>account_no</jsp:expression></td>
				<td ><jsp:expression>aadhar_no</jsp:expression></td>
				<td ><jsp:expression>phno</jsp:expression></td>
				<td ><jsp:expression>emailid</jsp:expression></td>
				<td ><jsp:expression>amount</jsp:expression>Rs</td>
			</tr>


			<jsp:scriptlet>}</jsp:scriptlet>

		</table>
	</div>
	<jsp:scriptlet>
	
	} 
	catch (Exception e) {
e.printStackTrace();
}</jsp:scriptlet>

	<jsp:include page="footer1.jsp"></jsp:include>
</body>
</html>