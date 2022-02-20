<%@page import="com.bp.app.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TRANSACTION HISTORY</title>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<img  class="customer-img" src="img/transaction_history.png">
<jsp:scriptlet>
Connection con = DbConnection.getConnect();
    PreparedStatement ps=con.prepareStatement("select * from transaction_history");
    ResultSet rs=ps.executeQuery();
    </jsp:scriptlet>>
  <div class="container" >
  <h1>Details of transactions</h1>
<table class="table table-bordered table-striped  table-hover">
    <tr>
      <th>Name.</th>
      <th>Customer Id.</th>
      <th>Account No.</th>
      <th>transaction Type</th>
       <th>Amount</th>
      <th>Date</th>
      <th>Time</th>
    </tr>
    
    <jsp:scriptlet>
    int  Customer_id,amount;
        while(rs.next()){
        	String name=rs.getString("name");
           	  Customer_id=rs.getInt("customer_id");
           	String account_no=rs.getString("account_no");
           	String transaction_type=rs.getString("transaction_type");
           	String  date1=rs.getString("date1");
           	String time1=rs.getString("time1");
           	 amount=rs.getInt(6);
           	</jsp:scriptlet>
           	<tr>
           	   <td><jsp:expression>name</jsp:expression>
           	   <td><jsp:expression>Customer_id</jsp:expression></td>
           	   <td><jsp:expression>account_no</jsp:expression></td>
           	   <td><jsp:expression>transaction_type</jsp:expression></td>
           	   <td><jsp:expression>amount</jsp:expression></td>
           	   <td><jsp:expression>date1</jsp:expression></td>
           	   
           	   <td><jsp:expression>time1</jsp:expression></td>
           	</tr>
           	<jsp:scriptlet>
        }
    </jsp:scriptlet>
    
    
    

</table>
</div>
 <jsp:include page="footer1.jsp"></jsp:include>
</body>
</html>