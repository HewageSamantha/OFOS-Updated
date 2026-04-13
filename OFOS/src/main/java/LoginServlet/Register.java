package LoginServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
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
		
   // Anti-Clickjacking Header
        
        response.setHeader("X-Frame-Options", "DENY");

		
		String sessionToken = (String) request.getSession().getAttribute("csrfToken");
		String requestToken = request.getParameter("csrfToken");

		if (sessionToken == null || requestToken == null || !sessionToken.equals(requestToken)) {
		    response.getWriter().println("CSRF Attack Detected!");
		    return;
		}
		String uname=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String password=request.getParameter("password");
		
		// Null check FIRST
		if(email == null || uname == null || password == null || phone == null) {
		    response.getWriter().println("Invalid input!");
		    return;
		}

		// Trim AFTER null check
		uname = uname.trim();
		email = email.trim();
		phone = phone.trim();
		password = password.trim();
		
	
		// Input validation (ONLY empty check now)
		if(email.isEmpty() || uname.isEmpty() || password.isEmpty() || phone.isEmpty()) {
		    response.getWriter().println("Invalid input!");
		    return;
		}
		
		
		// Email format validation
		if(!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
		    response.getWriter().println("Invalid email format!");
		    return;
		}

		// Block SQL patterns
		if(email.contains("'") || email.contains("--") || email.contains(";") ||
		   uname.contains("'") || uname.contains("--") || uname.contains(";") ||
		   password.contains("'") || password.contains("--") || password.contains(";") ||
		   phone.contains("'") || phone.contains("--") || phone.contains(";")) {

		    response.getWriter().println("Invalid input format!");
		    return;
		}

		// Length validation
		if(email.length() > 50 || uname.length() > 50 || password.length() > 50 || phone.length() > 15) {
		    response.getWriter().println("Input too long!");
		    return;
		}
		
		Member member=new Member(uname,email, phone,password);
		RegisterDao rdao=new RegisterDao();
		String result=rdao.insert(member, response);
		response.getWriter().println(result);
		
		
	}
}