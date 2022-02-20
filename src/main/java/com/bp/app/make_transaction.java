package com.bp.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

public class make_transaction extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String sender_name = req.getParameter("sender_name");
		System.out.println(sender_name + "sender name");
		String receiver_name = req.getParameter("receiver_name");
		System.out.println(receiver_name + "receiver nmae");
		String amount_transfer = req.getParameter("amount");
		System.out.println(amount_transfer + "amount");
		int amount_transferred = Integer.parseInt(amount_transfer);
		int index_no_sen = sender_name.indexOf('(');
		System.out.println(index_no_sen);
		System.out.println(sender_name.substring(0, index_no_sen));
		sender_name = sender_name.substring(0, index_no_sen);

		int index_no_rec = receiver_name.indexOf('(');
		System.out.println(index_no_rec);
		System.out.println(receiver_name.substring(0, index_no_rec));
		receiver_name = receiver_name.substring(0, index_no_rec);

		Connection con = null;
//<=============================================code for executing either all or none operation in transaction=======================>> 
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DbConnection.getConnect();
			// for retrieveing sender amount:

			con.setAutoCommit(false);
			PreparedStatement ps1 = con.prepareStatement("select amount,id,account_no from customer where name=?");
			ps1.setString(1, sender_name);
			int amount_available_sender = 0;
			int sender_customerid = 0;
			int sender_acc = 0;
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
                 System.out.println("under the loop:");
				amount_available_sender = rs1.getInt("amount");
				sender_customerid = rs1.getInt("id");
				sender_acc = rs1.getInt("account_no");

			}

			// for retrieving receiver'available amount:

			ps1.setString(1, receiver_name);
			int amount_available_receiver = 0;
			int receiver_customerid = 0;
			int receiver_acc = 0;
			ResultSet rs2 = ps1.executeQuery();
			while (rs2.next()) {
				amount_available_receiver = rs2.getInt("amount");
				receiver_customerid = rs2.getInt("id");
				receiver_acc = rs2.getInt("account_no");
			}
			int total_amount = 0;

			//======================condition for transferring amount=====================================
			if (amount_transferred <= amount_available_sender) {
				System.out.println("if condition true");
				PreparedStatement ps2 = con.prepareStatement("update customer set amount=? where name=?");
				total_amount = amount_available_sender - amount_transferred;
				ps2.setInt(1, total_amount);
				ps2.setString(2, sender_name);
				int i1 = ps2.executeUpdate();
				
				total_amount = amount_available_receiver + amount_transferred;
				ps2.setInt(1, total_amount);
				ps2.setString(2, receiver_name);
				int i2 = ps2.executeUpdate();
				System.out.println("i2 is executed");
				// for transaction_history:
				Date d = new Date();
				SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
				String date1 = sdf1.format(d);
				SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
				String time1 = sdf2.format(d);

				PreparedStatement ps3 = con.prepareStatement("insert into transaction_history  values(?,?,?,?,?,?,?)");

				ps3.setInt(1, sender_customerid);
				ps3.setInt(2, sender_acc);
				ps3.setString(3, "Debited");
				ps3.setString(4, date1);
				ps3.setString(5, time1);
				ps3.setInt(6, amount_transferred);
				ps3.setString(7, sender_name);
				
				int i3 = ps3.executeUpdate();

				
				// for receiver amount_transaction details:

				ps3.setInt(1, receiver_customerid);
				ps3.setInt(2, receiver_acc);
				ps3.setString(3, "Credited");
				ps3.setString(4, date1);
				ps3.setString(5, time1);
				ps3.setInt(6, amount_transferred);
				ps3.setString(7, receiver_name);
				// System.out.println("i4 have problem");
				int i4 = ps3.executeUpdate();
				System.out.println(i4);

				if (i1 > 0 && i2 > 0 && i3 > 0 && i4 > 0) {
					System.out.println("sucessful conditions");
//                   < ===============================created session and set status  value true:===============================>
					HttpSession session = req.getSession();
					session.setAttribute("status", "true");
            //             <==================================================================================================>
					con.commit();
					System.out.println("commited");
					resp.sendRedirect("make_transaction.jsp");

				} else {
					
					con.rollback();
				}

			}

			else {
				System.out.println("not commiteed");
				resp.sendRedirect("make_transaction.jsp");
			}

			// transaction operation  throw exception reflect here:
		} catch (Exception e) {
			
			try {

				con.rollback();
				System.out.println(e);
			} catch (Exception e2) {
				
				System.out.println(e2);
			}

		}
	//	<=====================================================================================================================>

	}
}
