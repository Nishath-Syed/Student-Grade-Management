<%@ page import="java.sql.*"%>
<%

       String lt = request.getParameter("loginType");
	   String un = request.getParameter("uname");
	   String pwd = request.getParameter("pwd");
	   

	   try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","kento");
            if("Student".equals(lt))
			{
				String qry = "select * from std where suname=? and spwd=?";
				PreparedStatement  stmt=con.prepareStatement(qry);
	
				stmt.setString(1,un);
				stmt.setString(2,pwd);
				
	
				ResultSet rs = stmt.executeQuery();
	
				if(rs.next())
				{
					session.setAttribute("user",un);
	
					%>
					<jsp:forward page="studprofile.jsp">
					  <jsp:param name="name" value="<%=un%>"/>
					</jsp:forward>
				
				
				<%
				}
				else
				{
					out.print("<font color='red'>" +"Invalid credentials! Please enter correct credentials"+"</font>");
					%>
					<jsp:include page="login.html"/>
				<%
				}
			}
			else if ("Teacher".equals(lt))
			{
				String qry = "select * from Teacher where tuname=? and tpwd=?";
				PreparedStatement  stmt=con.prepareStatement(qry);
	
				stmt.setString(1,un);
				stmt.setString(2,pwd);
				
	
				ResultSet rs = stmt.executeQuery();
	
				if(rs.next())
				{
					session.setAttribute("user",un);
	
					%>
					<jsp:forward page="teaprofile.jsp">
					  <jsp:param name="name" value="<%=un%>"/>
					</jsp:forward>
					
				<%
				}
				else
				{
					out.print("<font color='red'>" +"Invalid credentials! Please enter correct credentials"+"</font>");
					%>
					<jsp:include page="login.html"/>
				<%
				}
			}


		con.close();
		}
		catch (Exception e)
		{
			out.print(e);
		}	



%>