<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page session="true" %>
<%
        String name = (String)session.getAttribute("user");
        if(name!=null)
        {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grade Entry</title>
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

        

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            text-align: left;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        select {
            padding: 5px;
            width: 100%;
            margin-bottom: 20px;
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
        <h1>Grade Entry</h1>
    </header>
    <nav>
        <a href="teahome.html">Home</a>
        <a href="teaprofile.jsp">Profile</a>
        <a href="grade_entry.jsp">Grades</a>
        <a href="studlist.jsp">Students List</a>
        <a href="logout.jsp">Logout</a>
    </nav>
    <div class="container">
        <form action="grade_entry1.jsp" method="post">
            <label for="student">Select Student:</label>
            <select name="student" id="student">
                <%
                
                    try {
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "kento");
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("select sname from std");
                        while (rs.next()) {
                            String n = rs.getString("sname");
                %>
                            <option value="<%= n %>"><%= n %></option>
                <%
                        }
                %>
            </select>
            <label for="Mathematics">Mathematics:</label>
            <input type="number" name="subject1" id="subject1" required>
            <label for="Physics">Physics:</label>
            <input type="number" name="subject2" id="subject2" required>
            <label for="Chemistry">Chemistry:</label>
            <input type="number" name="subject3" id="subject3" required>
            <label for="English">English:</label>
            <input type="number" name="subject4" id="subject4" required>
            <label for="C Programming">C Programming:</label>
            <input type="number" name="subject5" id="subject5" required>
            <input type="submit" value="Submit">
        </form>
    </div>
    
    <footer>
        &copy; 2024 Grade Entry. All Rights Reserved.
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
                %>
