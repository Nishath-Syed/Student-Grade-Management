<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page session="true" %>

<%
String name = (String)session.getAttribute("user");
if(name!=null)
       {

//String un=request.getParameter("uname");
//out.print("<h3 align='center'>"+"Welcome! "+un+"</h1>");
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","kento");
    String qry="select * from std where suname=?";
    PreparedStatement pst=con.prepareStatement(qry);
    pst.setString(1,name);
    ResultSet rs=pst.executeQuery();
    if(rs.next()) 
    {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            background-image: url('https://img.freepik.com/premium-photo/blue-background-yellow-frame-back-school-idea-layer_548821-70899.jpg');
			background-size: cover;
            background-repeat: no-repeat;
        }

        header {
            background-color: #007bff;
            color: white;
            padding: 10px 0;
            text-align: center;
        }
        nav {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
        }

        nav a:hover {
            color: orangered; 
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        img {
            display: block;
            margin: 0 auto 20px;
            border-radius: 50%;
            max-width: 150px;
            height: auto;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            bottom:0;
            clear:both;
        }
    </style>
</head>
<body>
    <header>
        <h1>Student Profile</h1>
    </header>
    <nav>
        <a href="studhome.html">Home</a>
		<!--<a href="login.html">Login</a>-->
        <a href="studprofile.jsp">Profile</a>
        <a href="grades.jsp">Grades</a>
        <a href="tealist.jsp">Teachers List</a>
        <a href="logout.jsp">Logout</a>

    </nav>
    <div class="container">
        <!--<img src="student.jpg" alt="Student Picture">-->
        <table>
            <tr>
                <th colspan="2" style="text-align: center">Student Details</th>
            </tr>
            <tr>
                
                <td>ID</td>
                <td><%= rs.getInt("sid") %></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><%= rs.getString("sname") %></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td><%= rs.getString("sgender") %></td>
            </tr>
            <tr>
                <td>Date of Birth</td>
                <td><%= rs.getString("sdob") %></td>
            </tr>
            <tr>
                <td>Programme</td>
                <td><%= rs.getString("sprog") %></td>
            </tr>
            <tr>
                <td>Branch</td>
                <td><%= rs.getString("sbranch") %></td>
            </tr>
            <tr>
                <td>Section</td>
                <td><%= rs.getString("ssec") %></td>
            </tr>
            <tr>
                <td>Mother Name</td>
                <td><%= rs.getString("smother") %></td>
            </tr>
            <tr>
                <td>Father Name</td>
                <td><%= rs.getString("sfather") %></td>
            </tr>
            <tr>
                <td>Mobile No.</td>
                <td><%= rs.getLong("sphno") %></td>
            </tr>
            <tr>
                <td>Parent Mobile No.</td>
                <td><%= rs.getLong("pphno") %></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><%= rs.getString("semail") %></td>
            </tr>
        </table>
    </div>
    
    <footer>
        &copy; 2024 Student Profile. All Rights Reserved.
    </footer>
</body>
</html>

<%
        }
        con.close();
    } catch (Exception e) {
        out.print(e);
    }
}
else
{
    out.print(name);
//response.sendRedirect("login.html");
}
%>
