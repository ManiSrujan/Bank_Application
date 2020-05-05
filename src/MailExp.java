
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Try2
 */
@WebServlet("/MailServlet")
public class MailExp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailExp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String un=(String)session.getAttribute("username");
		if(un==null||un.equals(""))
		{
			
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.forward(request,response);
			
		}
		String pwd=(String)session.getAttribute("password");
		PreparedStatement ps=null;
		Connection con=null;
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String tot="",accnum="",addr="";
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
			ps=con.prepareStatement("select email,accnum,address from bank_op where username=? and password=?");
			ps.setString(1,un);
			ps.setString(2,pwd);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
		       tot=rs.getString("email");
		       accnum=rs.getString("accnum");
		       addr=rs.getString("address");
			}
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
		}

		//OTP generator
		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		                                    + "0123456789"
		                                    + "abcdefghijklmnopqrstuvxyz"; 
		        StringBuilder sb = new StringBuilder(6);   
		        for (int i = 0; i < 6; i++) {   
		            int index = (int)(AlphaNumericString.length()* Math.random()); 
		            sb.append(AlphaNumericString.charAt(index)); 
		        } 
		   

		Cookie ck[]=request.getCookies();
		String z="",amt="",rec="",otp="none",status="";
		String msg ="Error";
		for(int i=0;i<ck.length;i++)
		{
			if(ck[i].getName().equals("mail"))
				z=ck[i].getValue();
			if(ck[i].getName().equals("temp"))
				rec=ck[i].getValue();
			if(ck[i].getName().equals("amt"))
				amt=ck[i].getValue();
			if(ck[i].getName().equals("auth"))
				otp=ck[i].getValue();
			if(ck[i].getName().equals("valid"))
				status=ck[i].getValue();
		}

		if(z.equals("transfer"))
		    msg="A transfer request of Rs."+amt+" has been initiated to account xxxxxx"+rec.substring(6)+" from your account.\n"+"Request Status: "+status+" \nHave a nice day "+un;
		if(z.equals("withdraw"))
			msg="A withdraw request of Rs. "+amt+" has been made by you. Use the Code: "+sb.toString()+" at your nearest ATM to withdraw your amount.\nHave a nice day "+un;
		if(z.equals("deposit"))
			msg="A deposit request of Rs. "+amt+" has been made by you. Use the Code: "+sb.toString()+" at your nearest ATM to deposit the amount into your account. \nHave a nice day "+un;
		if(z.equals("Checkbook"))
			msg="Dear "+un+", you have made a request for checkbook for your account "+accnum+". It will be delivered to the address "+addr+" shortly. \nHave a nice day!";
		if(z.equals("Card"))
			msg="Dear "+un+", you have made a request for an ATM Card for your account "+accnum+". It will be delivered to the address "+addr+" shortly. \nHave a nice day!";
		if(z.equals("Loan"))
		{
			Cookie ckm[]=request.getCookies();
			String p="",t="",r="",m="",total="",toti="";
			for(int i=0;i<ckm.length;i++)
			{
				if(ckm[i].getName().equals("principal"))
					p=ckm[i].getValue();
				if(ckm[i].getName().equals("time"))
					t=ckm[i].getValue();
				if(ckm[i].getName().equals("rate"))
					r=ckm[i].getValue();
				if(ckm[i].getName().equals("monthly"))
					m=ckm[i].getValue();
				if(ckm[i].getName().equals("total"))
					total=ckm[i].getValue();
				if(ckm[i].getName().equals("totalint"))
					toti=ckm[i].getValue();
				
			}
			msg="Dear "+un+", you have applied for a loan with the plan:\n"+"Loan Amount:"+p+"\nTime:"+t+"\nRate Of Interest:"+r+"\nfor this, you'll have to pay\na Monthly of:"+m+"\nTotal Payment:"+total+"\nTotal Interest:"+toti+"\n Your loan terms are finalized and an agreement will be sent to you shortly. Please attach the necessary documents to the agreement and submit it at your nearest branch of KL Bank. \nHope you have a nice day!";
		}
		if(z.equals("otp"))
		{
			msg="The OTP for you transaction of amount transfer to account xxxxxx"+rec.substring(6)+" is "+otp+" . If you haven't requested this OTP, please contact you nearest branch of KL Bank.";
		}
		
		final String from = "testingepq8@gmail.com";
		String sub = "EP Bank Transaction Alert!";
		final String password = "epprojectq8";
		final String to=tot;
		
		// Properties need for the session object to send through gmail server
		Properties props = new Properties();
		props.put("mail.smtp.host","smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		
		// Creating a session object that holds all the information like host name, credentials, etc.
		 Session sessionx = Session.getDefaultInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from,password);
			}
		});
		
		try {
			MimeMessage message= new MimeMessage(sessionx);
			message.addRecipient(RecipientType.TO,new InternetAddress(to));
			message.setSubject(sub);
			message.setText(msg);
			
			Transport.send(message);
			System.out.println("Mail sent successfully");
			
			if(z.equals("otp"))
			{
				response.sendRedirect("confirm.jsp");
			}
			else if(z.equals("transfer"))
			{
				out.println("<script language='javascript'>alert('Transaction "+status+"!');</script>");
			RequestDispatcher rd=request.getRequestDispatcher("TransferFunds.jsp");
			rd.include(request,response);
			}
			else if(z.equals("withdraw"))
			{
				out.println("<script language='javascript'>alert('Transaction Successful!');</script>");
			RequestDispatcher rd=request.getRequestDispatcher("Withdraw.jsp");
			rd.include(request,response);
			}
			else if(z.equals("deposit"))
			{
				out.println("<script language='javascript'>alert('Transaction Successful!');</script>");
			RequestDispatcher rd=request.getRequestDispatcher("Deposit.jsp");
			rd.include(request,response);
				
			}
			else if(z.equals("Loan"))
			{
				out.println("<script language='javascript'>alert('Your Loan Application has been received!');</script>");
			RequestDispatcher rd=request.getRequestDispatcher("LoanApplication.jsp");
			rd.include(request,response);
				
			}
			else if(z.equals("Checkbook"))
			{
				out.println("<script language='javascript'>alert('Cheque Book request received!');</script>");
			RequestDispatcher rd=request.getRequestDispatcher("CheckBook.jsp");
			rd.include(request,response);
			}
			else if(z.equals("Card"))
			{out.println("<script language='javascript'>alert('Credit Card request received!');</script>");
			RequestDispatcher rd=request.getRequestDispatcher("Credit.jsp");
			rd.include(request,response);
				
			}
			else {
			out.println("<script language='javascript'>alert('Transaction Successful!');</script>");
			RequestDispatcher rd=request.getRequestDispatcher("HomePage.jsp");
			rd.include(request,response);
			}
		}
		catch(MessagingException e) {
			System.out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
