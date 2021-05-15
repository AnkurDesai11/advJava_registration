package com.register;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.sql.*;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
@MultipartConfig
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public register() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String name = request.getParameter("user_name");
		String pass = request.getParameter("user_pass");
		String mail = request.getParameter("user_mail");
		Part part = request.getPart("user_file");
		String file = part.getSubmittedFileName();
		//connection
		try {
			Thread.sleep(1000);
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","register","java");
			String q = "insert into users(name,password,email,filename) values(?,?,?,?)";
			
			PreparedStatement psmt = con.prepareStatement(q);
			psmt.setString(1, name);
			psmt.setString(2, pass);
			psmt.setString(3, mail);
			psmt.setString(4, file);
			
			psmt.executeUpdate();
			
			//upload file
			
			InputStream is = part.getInputStream();
			byte []data = new byte[is.available()];
			is.read(data);
			String path = request.getSession().getServletContext().getRealPath("/")+"img"+File.separator+file; 
			FileOutputStream fileOutputStream = new FileOutputStream(path);
			fileOutputStream.write(data);
			fileOutputStream.close();
			out.println("done");
		}catch(Exception e) {
			e.printStackTrace();
			out.println("Error");
		}
	}

}
