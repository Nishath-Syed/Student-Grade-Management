<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Grades</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            text-align: center;
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

        h2 {
            text-align: center;
            margin-top: 70px;
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
        <h1>Student Grades</h1>
    </header>
    <nav>
        <a href="studhome.html">Home</a>
        <!--<a href="login.html">Login</a>-->
        <a href="studprofile.jsp">Profile</a>
        <a href="grades.jsp">Grades</a>
        <a href="tealist.jsp">Teachers List</a>
        <a href="logout.jsp">Logout</a>
    </nav>

    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%
    
        String name = (String)session.getAttribute("user");
        int id = 0;
        if(name!=null)
        {
            try
            {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","kento");

                // Retrieve student ID
                PreparedStatement pstmt = con.prepareStatement("SELECT sid FROM std WHERE suname=?");
                pstmt.setString(1, name);
                ResultSet rs1 = pstmt.executeQuery();

                // Check if student exists
                if (rs1.next()) {
                    id = rs1.getInt("sid"); // Retrieve student ID
                } else {
                    throw new SQLException("Student not found!"); // Handle case when student is not found
                }

                String qry="select * from marks where sid=?";
                PreparedStatement pst=con.prepareStatement(qry);
                pst.setInt(1,id);
                ResultSet rs=pst.executeQuery();
                if (rs.next()) 
                {
                    %>
<%! 
public String calculateGrade(int marks) {
    if (marks >= 90) {
        return "A+";
    } else if (marks >= 80) {
        return "A";
    } else if (marks >= 70) {
        return "B";
    } else if (marks >= 60) {
        return "C";
    } else if (marks >= 50) {
        return "D";
    } else {
        return "F";
    }
}


                    
                    
                    
    %>
                    <div class="container">
                        <table>
                            <thead>
                                <tr>
                                    <th>Subject</th>
                                    <th>Marks</th>
                                    <th>Grade</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Mathematics</td>
                                    <td><%= rs.getInt("smarks1") %></td>
                                    <td><%= calculateGrade(rs.getInt("smarks1")) %></td>
                                </tr>
                                <tr>
                                    <td>Physics</td>
                                    <td><%= rs.getInt("smarks2") %></td>
                                    <td><%= calculateGrade(rs.getInt("smarks2")) %></td>
                                </tr>
                                <tr>
                                    <td>Chemistry</td>
                                    <td><%= rs.getInt("smarks3") %></td>
                                    <td><%= calculateGrade(rs.getInt("smarks3")) %></td>
                                </tr>
                                <tr>
                                    <td>English</td>
                                    <td><%= rs.getInt("smarks4") %></td>
                                    <td><%= calculateGrade(rs.getInt("smarks4")) %></td>
                                </tr>
                                <tr>
                                    <td>C Programming</td>
                                    <td><%= rs.getInt("smarks5") %></td>
                                    <td><%= calculateGrade(rs.getInt("smarks5")) %></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
    <%
            }
                else
                {
    %>
                    <h2>No Records Found.</h2>
    <%
                }
                con.close();
            }
            catch (Exception e)
            {
                out.print(e);
            }
        }
        else
        {
            response.sendRedirect("login.html");
        }
    %>

    <footer>
        &copy; 2024 Student Grades. All Rights Reserved.
    </footer>
</body>
</html>
