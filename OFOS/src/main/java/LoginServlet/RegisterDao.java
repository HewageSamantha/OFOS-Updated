package LoginServlet;

import java.sql.ResultSet; // Used to store and process results returned from database queries

import java.security.MessageDigest;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.HttpServletResponse;

public class RegisterDao {
    private String dburl = "jdbc:mysql://localhost:3306/ofos?useSSL=false&allowPublicKeyRetrieval=true";
    private String dbuname = "root";
    private String dbpassword = "admin123";
    private String dbdriver = "com.mysql.cj.jdbc.Driver";

    public void loadDriver(String dbDriver) {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        Connection con = null;
        try {
            con = DriverManager.getConnection(dburl, dbuname, dbpassword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

    public String insert(Member member, HttpServletResponse response) throws IOException {
        loadDriver(dbdriver);
        Connection con = getConnection();
        String result = "Data Entered Successfully";
        
        PreparedStatement userStmt = null;
        PreparedStatement uidStmt = null;
        PreparedStatement customerStmt = null;

        try {
            // Insert data into the Users table
            String userInsertSql = "INSERT INTO Users (email, password, type) VALUES (?, ?, 'customer')";
            userStmt = con.prepareStatement(userInsertSql);
            userStmt.setString(1, member.getEmail());
            String hashedPassword = hashPassword(member.getPassword());
            userStmt.setString(2, hashedPassword);
            userStmt.executeUpdate();

            // Retrieve the generated UID
            String selectUIDSql = "SELECT UID FROM Users WHERE email = ?";
            uidStmt = con.prepareStatement(selectUIDSql);
            uidStmt.setString(1, member.getEmail());
            int UID = -1;

            // Execute the query and get the UID
           // uidStmt.executeQuery();
            
            // Retrieve the result set after executing the query
          //  ResultSet resultSet = uidStmt.executeQuery();
            
            ResultSet resultSet = uidStmt.executeQuery();
            if (resultSet.next()) {
                UID = resultSet.getInt("UID");
            }
           
            if (UID != -1) {
                // Insert data into the Customer table using the retrieved UID
                String customerInsertSql = "INSERT INTO Customer (name, email, phone_number, UID) VALUES (?, ?, ?, ?)";
                customerStmt = con.prepareStatement(customerInsertSql);
                customerStmt.setString(1, member.getName());
                customerStmt.setString(2, member.getEmail());
                customerStmt.setString(3, member.getPhone());
                customerStmt.setInt(4, UID);
                customerStmt.executeUpdate();

                // Redirect to Login.jsp
                response.sendRedirect("Login.jsp");
            }
        } catch (SQLException e) {
            result = "Data Not Entered Successfully";
            e.printStackTrace();
        }
        finally {
            try {
                if (userStmt != null) userStmt.close();
                if (uidStmt != null) uidStmt.close();
                if (customerStmt != null) customerStmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        	
        	        

        return result;
    }
    
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes());
            
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                hexString.append(String.format("%02x", b));
            }
            return hexString.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
