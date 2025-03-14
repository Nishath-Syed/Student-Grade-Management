<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
String name = (String)session.getAttribute("user");
if(name!=null)
{
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","kento");
    String qry="select sid,sname,sbranch,ssec,sprog from std";
    PreparedStatement pst=con.prepareStatement(qry);
    ResultSet rs=pst.executeQuery();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students List</title>
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
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        th:first-child, td:first-child {
            font-weight: bold;
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
        }
    </style>
</head>
<body>
    <header>
        <h1>Students List</h1>
    </header>
    <nav>
        <a href="teahome.html">Home</a>
        <a href="teaprofile.jsp">Profile</a>
        <a href="grade_entry.jsp">Grades</a>
        <a href="studlist.jsp">Students List</a>
        <a href="logout.jsp">Logout</a>
    </nav>
    <div class="container">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Branch</th>
                    <th>Section</th>
                    <th>Programme</th>
                </tr>
            </thead>
            <tbody>
                <% while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getString("sid") %></td>
                        <td><%= rs.getString("sname") %></td>
                        <td><%= rs.getString("sbranch") %></td>
                        <td><%= rs.getString("ssec") %></td>
                        <td><%= rs.getString("sprog") %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <footer>
        &copy; 2024 Students List. All Rights Reserved.
    </footer>
</body>
</html>
<%
    con.close();
} catch (Exception e) {
    out.print(e);
}
}
else
{
    response.sendRedirect("login.html");
}
%>
