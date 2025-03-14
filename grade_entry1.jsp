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

        h2 {
            text-align: center;
            margin-top: 70px;
            color: white;
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
        <h1>Grade Entry</h1>
    </header>
    <nav>
        <a href="teahome.html">Home</a>
        <!--<a href="login.html">Login</a>-->
        <a href="teaprofile.jsp">Profile</a>
        <a href="grade_entry.jsp">Grades</a>
        <a href="studlist.jsp">Students List</a>
        <a href="logout.jsp">Logout</a>
    </nav>
    <div class="container">
        <%@ page import="java.sql.*"%>

        <%
            String sname = request.getParameter("student");
            int smarks1 = Integer.parseInt(request.getParameter("subject1"));
            int smarks2 = Integer.parseInt(request.getParameter("subject2"));
            int smarks3 = Integer.parseInt(request.getParameter("subject3"));
            int smarks4 = Integer.parseInt(request.getParameter("subject4"));
            int smarks5 = Integer.parseInt(request.getParameter("subject5"));
            int id = 0; // Initialize id variable
            boolean marksStored = false; 

            try {
                // Establish database connection
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "kento");

                // Retrieve student ID
                PreparedStatement pstmt = con.prepareStatement("SELECT sid FROM std WHERE sname=?");
                pstmt.setString(1, sname);
                ResultSet rs = pstmt.executeQuery();

                // Check if student exists
                if (rs.next()) {
                    id = rs.getInt("sid"); // Retrieve student ID
                } else {
                    throw new SQLException("Student not found!"); // Handle case when student is not found
                }

                // Insert marks into the database
                String qry = "INSERT INTO marks VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = con.prepareStatement(qry);
                stmt.setInt(1, id);
                stmt.setInt(2, smarks1);
                stmt.setInt(3, smarks2);
                stmt.setInt(4, smarks3);
                stmt.setInt(5, smarks4);
                stmt.setInt(6, smarks5);

                stmt.executeUpdate();
                marksStored = true; 

                // Close resources
                con.close();
            } catch (Exception e) {
                // Log error
                e.printStackTrace();
                // Display user-friendly error message
                out.print("<h2>Failed to store Marks.</h2>");
            }
            if (marksStored) {
                %>
                    <h2>Marks Entered Successfully !</h2>
                <%
                    }
                %>
    </div>
    
    <footer>
        &copy; 2024 Grade Entry. All Rights Reserved.
    </footer>
</body>
</html>
