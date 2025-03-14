<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>College Website</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            text-align: center; 
			background-image: url('https://png.pngtree.com/background/20211215/original/pngtree-science-and-technology-light-effect-technology-blue-technology-background-picture-image_1472618.jpg');
			background-size: cover;
            background-repeat: no-repeat;
        }

        h1, h2 {
            margin-top: 50px; 
        }
    </style>
</head>
<body>
<%@ page import="java.sql.*"%>
<%

       int sid = Integer.parseInt(request.getParameter("sid"));
       String sname = request.getParameter("sname");
	   String sgender = request.getParameter("sgender");
	   String sdob = request.getParameter("sdob");
	   String sprog = request.getParameter("sprog");
	   String sbranch = request.getParameter("sbranch");
	   String ssec = request.getParameter("ssec");
	   String smother = request.getParameter("smother");
	   String sfather = request.getParameter("sfather");
	   long sphno = Long.parseLong(request.getParameter("sphno"));
	   long pphno = Long.parseLong(request.getParameter("pphno"));
	   String semail = request.getParameter("semail");
	   String suname = request.getParameter("suname");
       String spwd = request.getParameter("spwd");


	   try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","kento");

			String qry = "insert into std values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement  stmt=con.prepareStatement(qry);

			stmt.setInt(1,sid);
			stmt.setString(2,sname);
			stmt.setString(3,sgender);
			stmt.setString(4,sdob);
			stmt.setString(5,sprog);
			stmt.setString(6,sbranch);
			stmt.setString(7,ssec);
			stmt.setString(8,smother);
			stmt.setString(9,sfather);
			stmt.setLong(10,sphno);
			stmt.setLong(11,pphno);
			stmt.setString(12,semail);
			stmt.setString(13,suname);
			stmt.setString(14,spwd);

			stmt.executeUpdate();

			out.print("<h1>Registration successful ! "+sname+"</h1>");
			out.print("<h2><a href='login.html'>Click Here to Login</a></h2>");
			con.close();
		}
		catch (Exception e)
		{
			out.print(e);
		}	



%>
</body>
</html>