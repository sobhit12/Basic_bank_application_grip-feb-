<%@page import="com.bp.app.DbConnection"%>
<%@page import="org.apache.coyote.Request"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link href="./css/style.css" rel="stylesheet">

<title>MAKE TRANSACTION</title>
<script>
	function val(v) {
		document.getElementById(v).innerHTML = "";
	}
	function validation() {
		var flag = true;
		var sender = document.transform.sender_name.value;
		var receiver = document.transform.receiver_name.value;
		var amount = document.transform.amount.value;

		if (sender == null || sender === "") {
			document.getElementById('sender_error').innerHTML = "*Select Required Sender Name.";
			flag = false;

		}
		if (receiver == null || receiver === "") {
			document.getElementById('receiver_error').innerHTML = " *Select Required Receiver Name.";
			flag = false;

		}

		if (amount == null || amount === "" || amount <= 0) {
			flag = false;
			document.getElementById('amount_error').innerHTML = "*Enter Amount greater than Zero.";

		}
		return flag;

	}
</script>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<img class="customer-imgg" src="img/make_transaction3.jpg" />
	<jsp:scriptlet>String status = (String) session.getAttribute("status");

System.out.println(status);
if (status != "failure") {</jsp:scriptlet>
	<jsp:include page="success.jsp"></jsp:include>
	<jsp:scriptlet>session.setAttribute("status", "failure");
}</jsp:scriptlet>

	<br>
	<br>
	<h1 class="head">Transfer Money</h1>

	<div class="container">
		<form method="POST" name="transform" action="transaction"onsubmit="return validation()">
			<div class="mb-3">
<jsp:scriptlet>Class.forName("com.mysql.cj.jdbc.Driver");
     Connection con=DbConnection.getConnect();
     PreparedStatement ps = con.prepareStatement("select * from customer ");
     ResultSet rs = ps.executeQuery();
     String sender_name, receiver_name, options;
      int amount_available = 0;
</jsp:scriptlet>
				<label for="exampleInputEmail1" class="form-label">Sender.</label> 
				<select onclick="val('sender_error')" name="sender_name" id="select"class="custom-select custom-select-lg mb-3">
				<option selected disabled></option>
				<jsp:scriptlet>
			while (rs.next()) {
	sender_name = rs.getString("name");
	amount_available = rs.getInt("amount");
	options = sender_name  +'(' + " Balance Rs. " + amount_available + ')';</jsp:scriptlet>
					<option><jsp:expression>options</jsp:expression></option>
					<jsp:scriptlet>}

rs.first();
</jsp:scriptlet>

			</select> <span style="font-size: 23px; font-weight: bold; color: red;" id="sender_error"> </span> <br> <br>
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Receiver.</label>
				<select name="receiver_name" name="sender_acc"
			onclick="val('receiver_error')" class="custom-select custom-select-lg mb-3"><option selected disabled></option>
					<jsp:scriptlet>while (rs.next()) {
	         receiver_name = rs.getString("name");
	         amount_available = rs.getInt("amount");
	         options = receiver_name +  '(' + " Balance Rs. " + amount_available + ')';</jsp:scriptlet>
					<option><jsp:expression>options</jsp:expression></option>
					<jsp:scriptlet>}</jsp:scriptlet>

				</select>
				 <span style="font-size: 23px; font-weight: bold; color: red;"
					id="receiver_error"> </span> <br> <br>
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Amount</label>
				<input name="amount" type="number" class="form-control" placeholder="Enter Amount(Rs.) to be transferred"
					id="exampleInputPassword1" onclick="val('amount_error')"><br>

				<span class="validation"
					style="font-size: 23px; font-weight: bold; color: red;"
					id="amount_error"> </span> <br> <br>
			</div>

			<button type="submit" class="btn btn-success btn-lg">Transfer</button>
		</form>

	</div>
	<jsp:include page="footer1.jsp"></jsp:include>

</body>
</html>